#!/usr/bin/env python3
"""Generate clean sphinxharm_spectral.maxpat — 4 independent voices with sig~ converters."""
import json

boxes = []
lines = []

def box(id, maxclass, rect, text=None, **kw):
    b = {"id": id, "maxclass": maxclass, "numinlets": kw.get("numinlets", 1),
         "numoutlets": kw.get("numoutlets", 0), "patching_rect": rect}
    if text is not None:
        b["text"] = text
    if "outlettype" in kw:
        b["outlettype"] = kw["outlettype"]
    for k in ("fontsize", "fontface", "minimum", "maximum", "items"):
        if k in kw:
            b[k] = kw[k]
    if maxclass == "newobj":
        b.setdefault("numinlets", 1)
        b.setdefault("numoutlets", 1)
    boxes.append({"box": b})

def wire(src_id, src_out, dst_id, dst_in):
    lines.append({"patchline": {"source": [src_id, src_out], "destination": [dst_id, dst_in]}})

# ── Header ──
box("obj-title", "comment", [30, 10, 550, 20],
    "SPHINXHARM SPECTRAL — 4-voice harmonizer with independent pitch + formant",
    fontsize=13, fontface=1)
box("obj-subtitle", "comment", [30, 30, 650, 20],
    "pfft~/gizmo~ (pitch) + fftz.mindwarp~ (formant). Each voice fully independent.")

# ── Input ──
box("obj-adc", "newobj", [50, 60, 45, 22], "adc~ 1",
    numinlets=1, numoutlets=1, outlettype=["signal"])
box("obj-in-meter", "meter~", [110, 62, 100, 14],
    numinlets=1, numoutlets=1, outlettype=["float"])
box("obj-loadbang", "newobj", [1200, 60, 58, 22], "loadbang",
    numinlets=1, numoutlets=1, outlettype=["bang"])

# ── Voice generator ──
# Voice layout (each voice ~328px tall):
#   by+0:   label
#   by+20:  sublabel
#   by+42:  controls (semi, fmt, gain, dly, pan)
#   by+72:  ratio expr, dbtoa, dlysig, ps
#   by+102: ratiosig, fmtsig expr, ms2s, phalf
#   by+132: send~ sharm_rN (ratio → pfft~ subpatch via receive~)
#   by+156: fmtwarpsig, poff, invp
#   by+186: pfft~ (1 inlet: audio only, ratio via send~/receive~)
#   by+216: mindwarp~
#   by+246: *~ gain
#   by+276: delay~
#   by+306: panR, panL

INTERVAL_ITEMS = ["OFF",",","Unison",",","+2nd",",","+3rd",",","+4th",",","+5th",",",
    "+6th",",","+7th",",","+Oct",",","+Oct+3rd",",","+Oct+5th",",","+2Oct",",",
    "-2nd",",","-3rd",",","-4th",",","-5th",",","-6th",",","-7th",",","-Oct",",","-Oct-3rd"]

def make_voice(n, bx, by):
    """Create voice N at base position (bx, by). Each is fully independent."""
    v = f"obj-v{n}"
    # Labels
    box(f"{v}-lbl", "comment", [bx, by, 100, 20], f"VOICE {n}", fontface=1)
    box(f"{v}-slbl", "comment", [bx, by+20, 290, 20],
        "semi / formant / gain(dB) / delay(ms) / pan(-1..1)")
    # Controls (flonums)
    box(f"{v}-semi", "flonum", [bx, by+42, 50, 22],
        numinlets=1, numoutlets=2, outlettype=["","bang"], minimum=-24.0, maximum=24.0)
    box(f"{v}-fmt", "flonum", [bx+60, by+42, 50, 22],
        numinlets=1, numoutlets=2, outlettype=["","bang"], minimum=-24.0, maximum=24.0)
    box(f"{v}-gain", "flonum", [bx+120, by+42, 50, 22],
        numinlets=1, numoutlets=2, outlettype=["","bang"])
    box(f"{v}-dly", "flonum", [bx+180, by+42, 50, 22],
        numinlets=1, numoutlets=2, outlettype=["","bang"], minimum=0.0, maximum=2000.0)
    box(f"{v}-pan", "flonum", [bx+240, by+42, 50, 22],
        numinlets=1, numoutlets=2, outlettype=["","bang"], minimum=-1.0, maximum=1.0)

    # Row A: float converters
    # ratio: semi → pow(2, s/12) → float ratio
    box(f"{v}-ratio", "newobj", [bx, by+72, 128, 22], "expr pow(2.\\, $f1/12.)",
        numinlets=1, numoutlets=1, outlettype=[""])
    box(f"{v}-dbtoa", "newobj", [bx+140, by+72, 38, 22], "dbtoa",
        numinlets=1, numoutlets=1, outlettype=[""])
    box(f"{v}-dlysig", "newobj", [bx+190, by+72, 32, 22], "sig~",
        numinlets=1, numoutlets=1, outlettype=["signal"])
    box(f"{v}-ps", "newobj", [bx+250, by+72, 32, 22], "sig~",
        numinlets=1, numoutlets=1, outlettype=["signal"])

    # Row B: sig~ converters for ratio + formant warp expr
    # ratiosig: converts float ratio → signal, then send~ to pfft~ subpatch
    box(f"{v}-ratiosig", "newobj", [bx, by+102, 32, 22], "sig~",
        numinlets=1, numoutlets=1, outlettype=["signal"])
    # send~ sharm_r{n}: sends ratio signal into pfft~ subpatch via receive~ sharm_r{n}
    box(f"{v}-sendratio", "newobj", [bx, by+132, 110, 22], f"send~ sharm_r{n}",
        numinlets=1, numoutlets=0)
    # fmtsig: fmt semi → pow(2, f/12) → float warp ratio
    box(f"{v}-fmtsig", "newobj", [bx+60, by+102, 128, 22], "expr pow(2.\\, $f1/12.)",
        numinlets=1, numoutlets=1, outlettype=[""])
    box(f"{v}-ms2s", "newobj", [bx+200, by+102, 45, 22], "*~ 44.1",
        numinlets=2, numoutlets=1, outlettype=["signal"])
    box(f"{v}-phalf", "newobj", [bx+255, by+102, 40, 22], "*~ 0.5",
        numinlets=2, numoutlets=1, outlettype=["signal"])

    # Row C: formant warp sig~ + pan helpers (y+156 to clear send~ at y+132)
    # fmtwarpsig: converts float warp ratio → signal for mindwarp~
    box(f"{v}-fmtwarpsig", "newobj", [bx+60, by+156, 32, 22], "sig~",
        numinlets=1, numoutlets=1, outlettype=["signal"])
    box(f"{v}-poff", "newobj", [bx+255, by+156, 40, 22], "+~ 0.5",
        numinlets=2, numoutlets=1, outlettype=["signal"])
    box(f"{v}-invp", "newobj", [bx+200, by+156, 50, 22], "!-~ 1.",
        numinlets=2, numoutlets=1, outlettype=["signal"])

    # Signal chain (shifted down to accommodate send~ row)
    box(f"{v}-pfft", "newobj", [bx, by+186, 260, 22], f"pfft~ spectral_voice_fft 2048 4 {n}",
        numinlets=1, numoutlets=1, outlettype=["signal"])
    box(f"{v}-fmteq", "newobj", [bx, by+216, 130, 22], "fftz.mindwarp~ 2048 4",
        numinlets=2, numoutlets=1, outlettype=["signal"])
    box(f"{v}-mult", "newobj", [bx, by+246, 40, 22], "*~ 1.",
        numinlets=2, numoutlets=1, outlettype=["signal"])
    box(f"{v}-delay", "newobj", [bx, by+276, 75, 22], "delay~ 88200",
        numinlets=2, numoutlets=1, outlettype=["signal"])
    box(f"{v}-panR", "newobj", [bx, by+306, 30, 22], "*~",
        numinlets=2, numoutlets=1, outlettype=["signal"])
    box(f"{v}-panL", "newobj", [bx+100, by+306, 30, 22], "*~",
        numinlets=2, numoutlets=1, outlettype=["signal"])

def wire_voice(n):
    v = f"obj-v{n}"
    # Pitch: semi → expr → sig~ → send~ (ratio reaches gizmo~ inside pfft~ via receive~)
    wire(f"{v}-semi", 0, f"{v}-ratio", 0)
    wire(f"{v}-ratio", 0, f"{v}-ratiosig", 0)
    wire(f"{v}-ratiosig", 0, f"{v}-sendratio", 0)

    # Audio: adc~ → pfft~ inlet 0 (done in fanout section)
    # pfft~ → mindwarp~ inlet 0 (audio)
    wire(f"{v}-pfft", 0, f"{v}-fmteq", 0)

    # Formant: fmt → expr → sig~ → mindwarp~ inlet 1 (signal warp ratio)
    wire(f"{v}-fmt", 0, f"{v}-fmtsig", 0)
    wire(f"{v}-fmtsig", 0, f"{v}-fmtwarpsig", 0)
    wire(f"{v}-fmtwarpsig", 0, f"{v}-fmteq", 1)

    # mindwarp~ → gain
    wire(f"{v}-fmteq", 0, f"{v}-mult", 0)

    # Gain: gain dB → dbtoa → *~ inlet 1
    wire(f"{v}-gain", 0, f"{v}-dbtoa", 0)
    wire(f"{v}-dbtoa", 0, f"{v}-mult", 1)

    # Delay: *~ → delay~ inlet 0, dly ms → sig~ → *~ 44.1 → delay~ inlet 1
    wire(f"{v}-mult", 0, f"{v}-delay", 0)
    wire(f"{v}-dly", 0, f"{v}-dlysig", 0)
    wire(f"{v}-dlysig", 0, f"{v}-ms2s", 0)
    wire(f"{v}-ms2s", 0, f"{v}-delay", 1)

    # Pan: pan → sig~ → *~ 0.5 → +~ 0.5 → panR (and → !-~ 1. → panL)
    wire(f"{v}-pan", 0, f"{v}-ps", 0)
    wire(f"{v}-ps", 0, f"{v}-phalf", 0)
    wire(f"{v}-phalf", 0, f"{v}-poff", 0)
    wire(f"{v}-poff", 0, f"{v}-panR", 1)
    wire(f"{v}-poff", 0, f"{v}-invp", 0)
    wire(f"{v}-invp", 0, f"{v}-panL", 1)

    # delay~ → pan multipliers
    wire(f"{v}-delay", 0, f"{v}-panR", 0)
    wire(f"{v}-delay", 0, f"{v}-panL", 0)

# Create 4 voices (V1/V2 top row, V3/V4 bottom row)
make_voice(1, 30, 90)
make_voice(2, 360, 90)
make_voice(3, 30, 425)
make_voice(4, 360, 425)

# ── Right panel ──
# KEY / SCALE (prominent)
box("obj-key-lbl", "comment", [690, 90, 200, 24],
    "KEY / SCALE", fontsize=16, fontface=1)
box("obj-key-menu", "umenu", [690, 120, 100, 22],
    numinlets=1, numoutlets=3, outlettype=["int","",""],
    items=["C",",","C#",",","D",",","Eb",",","E",",","F",",","F#",",",
           "G",",","Ab",",","A",",","Bb",",","B"])
box("obj-scale-menu", "umenu", [800, 120, 120, 22],
    numinlets=1, numoutlets=3, outlettype=["int","",""],
    items=["Major",",","Minor",",","Dorian",",","Mixolydian",",",
           "Pent Maj",",","Pent Min",",","Chromatic"])

# Key Follow
box("obj-kf-toggle", "toggle", [690, 155, 24, 24],
    numinlets=1, numoutlets=1, outlettype=["int"])
box("obj-kf-lbl", "comment", [720, 157, 100, 20], "Key Follow", fontsize=12)
box("obj-kf-prep", "newobj", [690, 185, 95, 22], "prepend keyfollow",
    numinlets=1, numoutlets=1, outlettype=[""])

# Voice Intervals (ABOVE harmony for downward wire flow)
box("obj-int-lbl", "comment", [690, 218, 280, 20],
    "VOICE INTERVALS (active when Key Follow ON)", fontface=1)
box("obj-int-v1lbl", "comment", [690, 242, 25, 20], "V1")
box("obj-v1-int", "umenu", [715, 242, 70, 22],
    numinlets=1, numoutlets=3, outlettype=["int","",""], items=INTERVAL_ITEMS)
box("obj-int-v2lbl", "comment", [795, 242, 25, 20], "V2")
box("obj-v2-int", "umenu", [820, 242, 70, 22],
    numinlets=1, numoutlets=3, outlettype=["int","",""], items=INTERVAL_ITEMS)
box("obj-int-v3lbl", "comment", [900, 242, 25, 20], "V3")
box("obj-v3-int", "umenu", [925, 242, 70, 22],
    numinlets=1, numoutlets=3, outlettype=["int","",""], items=INTERVAL_ITEMS)
box("obj-int-v4lbl", "comment", [1005, 242, 25, 20], "V4")
box("obj-v4-int", "umenu", [1030, 242, 70, 22],
    numinlets=1, numoutlets=3, outlettype=["int","",""], items=INTERVAL_ITEMS)
box("obj-v1-prep", "newobj", [715, 269, 65, 22], "prepend v1",
    numinlets=1, numoutlets=1, outlettype=[""])
box("obj-v2-prep", "newobj", [820, 269, 65, 22], "prepend v2",
    numinlets=1, numoutlets=1, outlettype=[""])
box("obj-v3-prep", "newobj", [925, 269, 65, 22], "prepend v3",
    numinlets=1, numoutlets=1, outlettype=[""])
box("obj-v4-prep", "newobj", [1030, 269, 65, 22], "prepend v4",
    numinlets=1, numoutlets=1, outlettype=[""])

# Pitch detection (retune~ outputs MIDI note directly on outlet 1)
box("obj-retune", "newobj", [850, 305, 55, 22], "retune~",
    numinlets=2, numoutlets=2, outlettype=["signal", ""])

# Harmony engine
box("obj-harmony", "newobj", [690, 345, 280, 22], "js harmony_engine.js",
    numinlets=3, numoutlets=1, outlettype=[""])

# Presets
box("obj-preset-lbl", "comment", [690, 380, 160, 20], "PRESETS", fontface=1)
box("obj-preset-woods", "message", [690, 403, 50, 22], "bang",
    numinlets=2, numoutlets=1, outlettype=[""])
box("obj-preset-choir", "message", [745, 403, 50, 22], "bang",
    numinlets=2, numoutlets=1, outlettype=[""])
box("obj-preset-shimmer", "message", [800, 403, 55, 22], "bang",
    numinlets=2, numoutlets=1, outlettype=[""])
box("obj-preset-dark", "message", [860, 403, 50, 22], "bang",
    numinlets=2, numoutlets=1, outlettype=[""])
box("obj-plbl-w", "comment", [690, 426, 50, 20], "Woods")
box("obj-plbl-c", "comment", [745, 426, 50, 20], "Choir")
box("obj-plbl-s", "comment", [800, 426, 55, 20], "Shimmer")
box("obj-plbl-d", "comment", [860, 426, 50, 20], "Dark")
box("obj-presets", "newobj", [690, 450, 160, 22], "js preset_handler.js",
    numinlets=4, numoutlets=1, outlettype=[""])

# Dry
box("obj-dry-lbl", "comment", [690, 485, 50, 20], "DRY", fontface=1)
box("obj-dry-gain", "flonum", [690, 507, 50, 22],
    numinlets=1, numoutlets=2, outlettype=["","bang"])
box("obj-dry-dbtoa", "newobj", [690, 534, 38, 22], "dbtoa",
    numinlets=1, numoutlets=1, outlettype=[""])
box("obj-dry-mult", "newobj", [690, 561, 40, 22], "*~ 1.",
    numinlets=2, numoutlets=1, outlettype=["signal"])

# Master
box("obj-master-lbl", "comment", [690, 593, 80, 20], "MASTER", fontface=1)
box("obj-master-val", "flonum", [690, 615, 50, 22],
    numinlets=1, numoutlets=2, outlettype=["","bang"])
box("obj-master-dbtoa", "newobj", [690, 642, 38, 22], "dbtoa",
    numinlets=1, numoutlets=1, outlettype=[""])

# Route
box("obj-route-presets", "newobj", [690, 680, 600, 22],
    "route v1_semi v2_semi v3_semi v4_semi v1_formant v2_formant v3_formant v4_formant v1_gain v2_gain v3_gain v4_gain v1_delay v2_delay v3_delay v4_delay v1_pan v2_pan v3_pan v4_pan dry_gain",
    numinlets=1, numoutlets=22,
    outlettype=[""]*22)

# ── Summing ──
box("obj-lbl-left", "comment", [200, 770, 40, 20], "LEFT")
box("obj-lbl-right", "comment", [350, 770, 50, 20], "RIGHT")
for name, x in [("sumL1",200),("sumL2",200),("sumL3",200),("sumR1",350),("sumR2",350),("sumR3",350)]:
    yy = 790 + (int(name[-1])-1)*30
    box(f"obj-{name}", "newobj", [x, yy, 30, 22], "+~",
        numinlets=2, numoutlets=1, outlettype=["signal"])

box("obj-addDryL", "newobj", [200, 890, 30, 22], "+~",
    numinlets=2, numoutlets=1, outlettype=["signal"])
box("obj-addDryR", "newobj", [350, 890, 30, 22], "+~",
    numinlets=2, numoutlets=1, outlettype=["signal"])
box("obj-masterL", "newobj", [200, 930, 40, 22], "*~ 1.",
    numinlets=2, numoutlets=1, outlettype=["signal"])
box("obj-masterR", "newobj", [350, 930, 40, 22], "*~ 1.",
    numinlets=2, numoutlets=1, outlettype=["signal"])
box("obj-meterL", "meter~", [200, 965, 100, 14],
    numinlets=1, numoutlets=1, outlettype=["float"])
box("obj-meterR", "meter~", [350, 965, 100, 14],
    numinlets=1, numoutlets=1, outlettype=["float"])
box("obj-ezdac", "ezdac~", [260, 990, 45, 45], numinlets=2, numoutlets=0)

# ── Info ──
box("obj-info1", "comment", [690, 760, 350, 20], "SIGNAL FLOW:")
box("obj-info2", "comment", [690, 780, 550, 20],
    "adc~ -> pfft~/gizmo~ (PITCH shift) -> fftz.mindwarp~ (FORMANT warp, independent) -> gain -> pan")
box("obj-info3", "comment", [690, 800, 500, 20],
    "Each voice has its own pfft~ + mindwarp~ instance. Pitch and formant are SEPARATE controls.")
box("obj-info4", "comment", [690, 820, 400, 20],
    "Pitch ratio reaches gizmo~ inside pfft~ via send~/receive~ (per-voice naming).")
box("obj-info5", "comment", [690, 840, 400, 20],
    "Requires: FFTease package (for fftz.mindwarp~). retune~ is built-in.")

# ══════════ CONNECTIONS ══════════

# Input fanout — adc~ feeds each voice's pfft~ independently
wire("obj-adc", 0, "obj-in-meter", 0)
wire("obj-adc", 0, "obj-v1-pfft", 0)
wire("obj-adc", 0, "obj-v2-pfft", 0)
wire("obj-adc", 0, "obj-v3-pfft", 0)
wire("obj-adc", 0, "obj-v4-pfft", 0)
wire("obj-adc", 0, "obj-dry-mult", 0)

# Init — loadbang triggers Woods preset so all voices have audible defaults
wire("obj-loadbang", 0, "obj-preset-woods", 0)

# Voice wiring (4 independent voices)
for n in range(1, 5):
    wire_voice(n)

# Summing L
wire("obj-v1-panL", 0, "obj-sumL1", 0)
wire("obj-v2-panL", 0, "obj-sumL1", 1)
wire("obj-sumL1", 0, "obj-sumL2", 0)
wire("obj-v3-panL", 0, "obj-sumL2", 1)
wire("obj-sumL2", 0, "obj-sumL3", 0)
wire("obj-v4-panL", 0, "obj-sumL3", 1)
# Summing R
wire("obj-v1-panR", 0, "obj-sumR1", 0)
wire("obj-v2-panR", 0, "obj-sumR1", 1)
wire("obj-sumR1", 0, "obj-sumR2", 0)
wire("obj-v3-panR", 0, "obj-sumR2", 1)
wire("obj-sumR2", 0, "obj-sumR3", 0)
wire("obj-v4-panR", 0, "obj-sumR3", 1)

# Add dry
wire("obj-sumL3", 0, "obj-addDryL", 0)
wire("obj-dry-mult", 0, "obj-addDryL", 1)
wire("obj-sumR3", 0, "obj-addDryR", 0)
wire("obj-dry-mult", 0, "obj-addDryR", 1)

# Dry chain
wire("obj-dry-gain", 0, "obj-dry-dbtoa", 0)
wire("obj-dry-dbtoa", 0, "obj-dry-mult", 1)

# Master chain
wire("obj-addDryL", 0, "obj-masterL", 0)
wire("obj-addDryR", 0, "obj-masterR", 0)
wire("obj-master-val", 0, "obj-master-dbtoa", 0)
wire("obj-master-dbtoa", 0, "obj-masterL", 1)
wire("obj-master-dbtoa", 0, "obj-masterR", 1)

# Output
wire("obj-masterL", 0, "obj-meterL", 0)
wire("obj-masterR", 0, "obj-meterR", 0)
wire("obj-masterL", 0, "obj-ezdac", 0)
wire("obj-masterR", 0, "obj-ezdac", 1)

# Key/Scale → Harmony
wire("obj-key-menu", 0, "obj-harmony", 0)
wire("obj-scale-menu", 0, "obj-harmony", 1)

# Pitch detection (retune~ outlet 1 = detected MIDI note)
wire("obj-adc", 0, "obj-retune", 0)
wire("obj-retune", 1, "obj-harmony", 2)

# Key Follow
wire("obj-kf-toggle", 0, "obj-kf-prep", 0)
wire("obj-kf-prep", 0, "obj-harmony", 0)

# Intervals → Harmony (all downward)
wire("obj-v1-int", 1, "obj-v1-prep", 0)
wire("obj-v2-int", 1, "obj-v2-prep", 0)
wire("obj-v3-int", 1, "obj-v3-prep", 0)
wire("obj-v4-int", 1, "obj-v4-prep", 0)
wire("obj-v1-prep", 0, "obj-harmony", 0)
wire("obj-v2-prep", 0, "obj-harmony", 0)
wire("obj-v3-prep", 0, "obj-harmony", 0)
wire("obj-v4-prep", 0, "obj-harmony", 0)

# Harmony → Route
wire("obj-harmony", 0, "obj-route-presets", 0)

# Presets
wire("obj-preset-woods", 0, "obj-presets", 0)
wire("obj-preset-choir", 0, "obj-presets", 1)
wire("obj-preset-shimmer", 0, "obj-presets", 2)
wire("obj-preset-dark", 0, "obj-presets", 3)
wire("obj-presets", 0, "obj-route-presets", 0)

# Route → Voice controls
route_map = [
    (0, "obj-v1-semi"), (1, "obj-v2-semi"), (2, "obj-v3-semi"), (3, "obj-v4-semi"),
    (4, "obj-v1-fmt"), (5, "obj-v2-fmt"), (6, "obj-v3-fmt"), (7, "obj-v4-fmt"),
    (8, "obj-v1-gain"), (9, "obj-v2-gain"), (10, "obj-v3-gain"), (11, "obj-v4-gain"),
    (12, "obj-v1-dly"), (13, "obj-v2-dly"), (14, "obj-v3-dly"), (15, "obj-v4-dly"),
    (16, "obj-v1-pan"), (17, "obj-v2-pan"), (18, "obj-v3-pan"), (19, "obj-v4-pan"),
    (20, "obj-dry-gain"),
]
for outlet, target in route_map:
    wire("obj-route-presets", outlet, target, 0)

# ══════════ VALIDATE ══════════
box_map = {}
for b in boxes:
    bid = b["box"]["id"]
    rect = b["box"]["patching_rect"]
    box_map[bid] = rect

# Check overlaps
overlaps = []
ids = list(box_map.keys())
for i in range(len(ids)):
    for j in range(i+1, len(ids)):
        a = box_map[ids[i]]
        b = box_map[ids[j]]
        ax1, ay1, aw, ah = a[0], a[1], a[2], a[3]
        bx1, by1, bw, bh = b[0], b[1], b[2], b[3]
        if ax1 < bx1+bw and ax1+aw > bx1 and ay1 < by1+bh and ay1+ah > by1:
            overlaps.append((ids[i], ids[j]))

# Check connections reference valid boxes
conn_errors = []
for l in lines:
    src = l["patchline"]["source"][0]
    dst = l["patchline"]["destination"][0]
    if src not in box_map:
        conn_errors.append(f"Missing source: {src}")
    if dst not in box_map:
        conn_errors.append(f"Missing dest: {dst}")

print(f"Boxes: {len(boxes)}")
print(f"Connections: {len(lines)}")
print(f"Overlaps: {len(overlaps)}")
for a, b in overlaps:
    print(f"  OVERLAP: {a} {box_map[a]} vs {b} {box_map[b]}")
print(f"Connection errors: {len(conn_errors)}")
for e in conn_errors:
    print(f"  {e}")

# ══════════ OUTPUT ══════════
patch = {
    "patcher": {
        "fileversion": 1,
        "appversion": {"major": 9, "minor": 1, "revision": 0,
                       "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [34.0, 80.0, 1400.0, 1080.0],
        "bglocked": 0,
        "openinpresentation": 0,
        "boxes": boxes,
        "lines": lines,
        "autosave": 0
    }
}

with open("/home/sphinxy/max-patches/harmonizer/sphinxharm_spectral.maxpat", "w") as f:
    json.dump(patch, f, indent=4)

print("\nWrote sphinxharm_spectral.maxpat")
if len(overlaps) == 0 and len(conn_errors) == 0:
    print("CLEAN — no overlaps, no connection errors")
else:
    print("ISSUES FOUND — see above")
