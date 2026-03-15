# Sphinxharm — Setup Guide

## Files
- `sphinxharm.maxpat` — Main patch (open this)
- `pitch_shift.gendsp` — gen~ granular pitch shifter (auto-loaded)
- `harmony_engine.js` — Key/scale → semitone calculator
- `preset_handler.js` — Preset system

## Quick Start
1. Open `sphinxharm.maxpat` in Max 8+
2. All files must be in the same folder (or add folder to Max search path)
3. Turn on audio (DSP)
4. Select your song's key and scale
5. Pick intervals for each voice
6. Adjust formant per voice for character

## Manual Wiring (if connections are missing)

The .maxpat has the layout and objects. Some connections may need
manual patching since JSON can be finicky. Here's the signal flow:

```
adc~ 1
├──▶ gen~ pitch_shift (Voice 1) ──▶ *~ (V1 gain) ──┐
├──▶ gen~ pitch_shift (Voice 2) ──▶ *~ (V2 gain) ──┤
├──▶ gen~ pitch_shift (Voice 3) ──▶ *~ (V3 gain) ──┤  +~ chain
├──▶ gen~ pitch_shift (Voice 4) ──▶ *~ (V4 gain) ──┤
└──▶ *~ (dry gain) ────────────────────────────────┘
                                                    │
                                              +~ (sum all)
                                                    │
                                              *~ (master gain)
                                                    │
                                              dac~ 1 2
```

### Each gen~ pitch_shift has 4 inlets:
- **in 1**: audio (from adc~)
- **in 2**: semitones (from harmony_engine.js or direct number)
- **in 3**: formant shift in semitones (from live.dial)
- **in 4**: mix (set to 1.0 for full wet on harmony voices)

### For reverb (optional):
Insert a reverb between the sum and master gain. Options:
- `yafr2` (built-in, decent)
- `gigaverb~` (free external, better)
- `vst~ "ValhallaRoom"` (if you have it — best for this sound)

## Preset Recipes

### "Woods" (layered choir stack):
- Key: Match your song
- V1: +3rd, formant -3, gain -3dB
- V2: +5th, formant 0, gain -4dB
- V3: +Oct, formant +5, gain -8dB
- V4: -Oct, formant -7, gain -6dB
- Dry: -6dB (voices dominate)
- Detune: 12 cents (width)
- Reverb: 45% mix, large space

### "Exposed" (simpler, fewer voices):
- V1: +3rd, formant 0, gain -2dB
- V2: +5th, formant 0, gain -4dB
- V3: OFF
- V4: OFF
- Dry: 0dB
- Detune: 5 cents
- Reverb: 20%

### "Shimmer" (octave shimmer):
- V1: +Oct, formant +8, gain -8dB
- V2: +Oct+5th, formant +10, gain -12dB
- V3: +5th, formant +3, gain -6dB
- V4: +2Oct, formant +12, gain -18dB
- Dry: 0dB
- Reverb: 60% mix, very large

## Formant Guide

Formant shifting changes the vowel character without changing pitch:
- **-12 to -6**: Deep, masculine, "demon" voice
- **-5 to -2**: Slightly deeper, warm
- **0**: Natural (no shift)
- **+2 to +5**: Slightly brighter, younger
- **+6 to +12**: Chipmunk / angelic / ethereal

Key trick: shift formant OPPOSITE to pitch.
- Voice pitched UP → formant shifted DOWN (keeps it human)
- Voice pitched DOWN → formant shifted UP (avoids muddy bass)

## Adding Pitch Tracking (Advanced)

For auto-following harmonies (like a real Eventide H9):

1. Add `sigmund~` object for pitch detection
2. Route detected MIDI note into `harmony_engine.js`
3. The engine snaps to the nearest scale degree
4. Semitone output feeds each voice's gen~

This turns it from manual intervals into automatic harmony
that follows your singing in the selected key.
