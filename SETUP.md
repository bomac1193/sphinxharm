# Sphinxharm — Setup Guide

## Two Versions

### `sphinxharm_spectral.maxpat` — RECOMMENDED (new)
Spectral pitch shift via pfft~/gizmo~. Cleaner artifacts, better on large intervals.
True spectral formant warping via FFTease `fftz.mindwarp~`.
Autocorrelation pitch detection via gen~ (replaces sigmund~).
**Requires**: FFTease package (install from Max Package Manager).

### `sphinxharm.maxpat` — Original (gen~ granular)
Time-domain granular pitch shift. Lower latency, grittier sound.
Keep for comparison — try both on your voice.

## Files
- `sphinxharm_spectral.maxpat` — Main spectral patch (open this)
- `spectral_voice_fft.maxpat` — pfft~ sub-patch (auto-loaded by pfft~)
- `formant_eq.gendsp` — gen~ formant tilt EQ (fallback if FFTease not installed)
- `pitch_detect.gendsp` — gen~ autocorrelation pitch detector (for key-following)
- `harmony_engine.js` — Key/scale semitone calculator
- `preset_handler.js` — Preset system (Woods/Choir/Shimmer/Dark)
- `sphinxharm.maxpat` — Original gen~ version (for comparison)
- `pitch_shift.gendsp` — gen~ granular pitch shifter (used by original)
- `aurora.gendsp` — Spectral shimmer freeze (standalone effect)

## Quick Start
1. **Install FFTease** from Max Package Manager (File → Show Package Manager → search "FFTease")
2. Open `sphinxharm_spectral.maxpat` in Max 8+
2. **All files must be in the same folder** (or add folder to Max search path)
3. Turn on audio (DSP) — click the speaker icon
4. Set semitones for each voice (+4=maj3rd, +7=5th, +12=oct)
5. Set formant per voice (0=neutral, +bright, -dark)
6. Adjust gain (dB), delay (ms), pan (-1..1)

## Signal Flow (Spectral Version)

```
adc~ 1 (mono mic)
├──▶ pfft~/gizmo~ V1 (pitch) → fftz.mindwarp~ (formant) → *~ gain → delay~ → pan ──┐
├──▶ pfft~/gizmo~ V2 (pitch) → fftz.mindwarp~ (formant) → *~ gain → delay~ → pan ──┤
├──▶ pfft~/gizmo~ V3 (pitch) → fftz.mindwarp~ (formant) → *~ gain → delay~ → pan ──┤  stereo
├──▶ pfft~/gizmo~ V4 (pitch) → fftz.mindwarp~ (formant) → *~ gain → delay~ → pan ──┤   sum
└──▶ *~ dry gain ─────────────────────────────────────────────────────┘
                                                                       │
                                                              *~ master gain
                                                                       │
                                                                 dac~ 1 2
```

### pfft~ pitch shift
- FFT size: 2048 (overlap 4) — ~46ms latency
- Change to `pfft~ spectral_voice_fft 4096 4` for better quality (~93ms latency)
- Semitones → ratio via `pow(2, semi/12)` → gizmo~ inside pfft~

### fftz.mindwarp~ (FFTease spectral formant warping)
- Input: semitones (-24 to +24), converted to warp ratio via `pow(2, semi/12)`
- 0 semi (ratio 1.0) = no formant change
- +12 semi (ratio 2.0) = formant up one octave (smaller vocal tract)
- -12 semi (ratio 0.5) = formant down one octave (larger vocal tract)
- fftz.mindwarp~ does real spectral envelope extraction and resynthesis
- FFT size 2048, overlap 4 (matches pfft~ settings)

## Preset Recipes

### "Woods" (layered choir stack)
- V1: +4st (maj3rd), fmt -3, gain -3dB, dly 12ms, pan -0.4
- V2: +7st (5th), fmt 0, gain -4dB, dly 18ms, pan +0.4
- V3: +12st (oct), fmt +5, gain -8dB, dly 30ms, pan -0.7
- V4: -12st (oct dn), fmt -7, gain -6dB, dly 45ms, pan +0.7
- Dry: -6dB

### "Choir" (full choral spread)
- V1: -7st (5th dn), fmt -5, gain -2dB, dly 8ms, pan -0.6
- V2: +4st (maj3rd), fmt +2, gain -2dB, dly 15ms, pan +0.3
- V3: +7st (5th), fmt 0, gain -3dB, dly 22ms, pan -0.3
- V4: +12st (oct), fmt +4, gain -6dB, dly 35ms, pan +0.6
- Dry: 0dB

### "Shimmer" (octave shimmer)
- V1: +12st (oct), fmt +8, gain -8dB, dly 20ms, pan -0.8
- V2: +19st (oct+5th), fmt +10, gain -12dB, dly 35ms, pan +0.8
- V3: +7st (5th), fmt +3, gain -6dB, dly 15ms, pan -0.3
- V4: +24st (2oct), fmt +12, gain -18dB, dly 50ms, pan +0.3
- Dry: 0dB

### "Dark" (low moody)
- V1: -3st (min3rd dn), fmt -8, gain 0dB, dly 10ms, pan -0.5
- V2: -7st (5th dn), fmt -10, gain -2dB, dly 20ms, pan +0.5
- V3: -12st (oct dn), fmt -12, gain -4dB, dly 40ms, pan -0.8
- V4: 0st (unison), fmt -5, gain -6dB, dly 5ms, pan 0
- Dry: -3dB

## Formant Guide

fftz.mindwarp~ warps the spectral envelope independently from pitch:
- **-24 to -12**: Very deep, barrel-like
- **-11 to -5**: Noticeably darker, warm
- **-4 to -1**: Slightly warmer
- **0**: No formant change
- **+1 to +4**: Slightly brighter
- **+5 to +11**: Noticeably brighter, airy
- **+12 to +24**: Very bright, ethereal

Key trick for natural harmonies: shift formant OPPOSITE to pitch.
- Voice pitched UP → negative formant (keeps it grounded)
- Voice pitched DOWN → positive formant (prevents mud)

### Fallback (no FFTease)

If FFTease is not installed, replace each `fftz.mindwarp~ 2048 4` with
`gen~ @gen formant_eq` and each formant `expr pow(2.\, $f1/12.)` with `sig~`.
The `formant_eq.gendsp` file provides a tilt EQ approximation that works
without any external packages.

## Key-Following (Harmony Engine)

When **Key Follow** is ON, the harmony engine uses a gen~ autocorrelation pitch
detector (`pitch_detect.gendsp`) to detect your sung pitch and automatically
adjusts each voice's semitone shift so harmonies stay in the selected key and
scale.

### How it works
1. Set key (C, D, etc.) and scale (Major, Minor, Dorian, etc.)
2. Set each voice to a musical interval (+3rd, +5th, +Oct, -Oct, etc.)
3. Toggle **Key Follow** ON
4. As you sing, the harmony adapts:
   - In C major, singing C with voice set to "+3rd" → +4 semitones (C→E)
   - Singing D with "+3rd" → +3 semitones (D→F)
   - Singing E with "+3rd" → +3 semitones (E→G)

The shift amount changes in real-time to keep harmonies diatonic.

### Without Key Follow
When Key Follow is OFF, voices use fixed semitone values (manual flonums or
presets). This gives you a constant interval regardless of what you sing —
useful for parallel harmony effects.

### Pitch detection
Uses `gen~ @gen pitch_detect` — autocorrelation-based pitch detector with RMS
noise gate. Detects fundamental frequency of monophonic voice input. Output
converted to MIDI note via `snapshot~ 50` → `ftom`.

Range: C2 (65Hz) to Ab5 (831Hz). Threshold parameter controls noise gate.

## Latency Notes

- pfft~ 2048, overlap 4: ~46ms (good for live with monitoring)
- pfft~ 4096, overlap 4: ~93ms (better quality, studio only)
- Original gen~ version: ~5ms (lowest latency, grittier artifacts)
- Choose based on your use case

## Adding Reverb

Insert between the stereo sum and master gain:
- `yafr2` (built-in, decent)
- `gigaverb~` (free external, better)
- `vst~ "ValhallaRoom"` (best for this sound)
