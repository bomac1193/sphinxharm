# Sphinxharm — JUCE Implementation Plan

## Workflow: Max First, JUCE Second

**Do NOT port to JUCE yet.** Here's why:

### Why Max First

- **Iteration speed**: Change a parameter, hear it instantly. No compile cycle.
- **You haven't locked the sound yet.** You're still figuring out what Sphinxharm *is* — how many voices, what the formant should feel like, what effects chain sounds right, what the performance UI needs. Max lets you explore this in real time.
- **pfft~ + gizmo~ + FFTease are available NOW in Max.** You can test high-quality spectral formant shifting today without writing a single line of C++. Install FFTease from the Package Manager, wire up `gizmo~` + `mindwarp~`, and hear what proper formant shifting sounds like on your voice.
- **JUCE is an engineering task, not a creative one.** Once you know exactly what signal chain you want, porting is mechanical. The DSP math is the same — just expressed in C++ instead of gen~/pfft~.

### The Workflow

```
PHASE 1 (NOW) — Max/MSP Sandbox
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Current gen~ harmonizer    →  working, sounds OK
Add pfft~ + gizmo~         →  better pitch shifting
Add FFTease mindwarp~      →  dramatic formant control
Add reverb / effects chain →  find the sound
Add key-following (js)     →  musical harmony
Test with your voice LIVE  →  iterate until it sounds right
Lock in: voices, params, ranges, signal flow

PHASE 2 — Port to JUCE
━━━━━━━━━━━━━━━━━━━━━━
Replicate the locked Max signal chain in C++
Replace gizmo~/mindwarp~ with Rubber Band or WORLD
Build proper GUI
Ship as VST3/AU plugin
```

### What to Explore in Max Before Porting

1. **pfft~ + gizmo~** — Replace gen~ pitch shifting with spectral domain. Compare quality.
2. **FFTease mindwarp~** — Test dramatic formant warping (factors 0.25 to 4.0). Find the sweet spot.
3. **Effect chain order** — Does reverb go before or after formant shift? Delay before or after pan? Compression on the master bus?
4. **Voice count** — Is 4 voices enough or do you want 6? 8?
5. **Key/scale following** — Wire up `harmony_engine.js` so voices snap to musical intervals.
6. **Presets** — Save your favorite configurations. These become JUCE presets later.
7. **Aurora effect** — Test the spectral shimmer freeze. Does it belong in Sphinxharm or is it a separate plugin?
8. **Latency tolerance** — How much latency can you accept for live performance? This determines which JUCE engine to use.

### When to Port

Port to JUCE when you can answer ALL of these:
- [ ] I know exactly how many voices I want
- [ ] I know what formant range sounds good on my voice
- [ ] I know what effects chain I want (reverb, delay, compression, etc.)
- [ ] I know the parameter ranges for every control
- [ ] I have 3-5 presets that sound great
- [ ] I've performed with it live and know what's missing
- [ ] I want to distribute it as a VST3/AU plugin

---

## JUCE Architecture (For When You're Ready)

### Target

- VST3 + AU + Standalone
- macOS + Windows
- Real-time safe, < 50ms latency
- Per-voice: pitch shift, formant shift, pan, delay, gain
- Master: dry/wet, reverb, master gain
- Preset system
- Resizable GUI

### Engine Options (Ranked)

#### Option A: Rubber Band v4 — RECOMMENDED START

```
Pros: Proven JUCE integration, setFormantScale() API, commercial license available
Cons: ~50ms latency, formant quality good but not exceptional
Cost: Free (GPLv2) or ~$500-2000 commercial license
```

Each voice = one `RubberBandLiveShifter` instance:
```cpp
auto shifter = RubberBandLiveShifter(sampleRate, 1, // mono
    RubberBandLiveShifter::OptionFormantPreserved);

shifter.setPitchScale(pow(2.0, semitones / 12.0));
shifter.setFormantScale(pow(2.0, formantSemitones / 12.0));
```

#### Option B: WORLD Vocoder — BEST QUALITY FOR VOICE

```
Pros: Free (BSD), fully decomposed (pitch/formant/breathiness independent), voice-specific
Cons: Monophonic only, needs C wrapper, more work to integrate
Cost: Free
```

Pipeline per voice:
```cpp
// Analysis
DIO(input, f0);                    // pitch detection
CheapTrick(input, f0, envelope);   // spectral envelope (= formants)
D4C(input, f0, aperiodicity);      // breathiness

// Manipulation
shiftF0(f0, semitones);            // pitch shift
warpEnvelope(envelope, formantShift); // formant shift (independent!)

// Synthesis
Synthesis(f0, envelope, aperiodicity, output);
```

#### Option C: Hybrid (Rubber Band + WORLD analysis)

```
Use WORLD's CheapTrick for spectral envelope analysis
Feed that into Rubber Band's formant scale
Best of both worlds — potentially exceeds SuperVP on vocals
```

#### Option D: zplane elastique PRO — IF BUDGET ALLOWS

```
Pros: Highest quality, polyphonic, professional SDK
Cons: Commercial license (negotiated pricing, likely $5-20k+ for distribution)
Cost: Contact zplane for OEM pricing
```

### Project Structure

```
sphinxharm-plugin/
├── CMakeLists.txt                    # JUCE CMake project
├── libs/
│   ├── rubberband/                   # Rubber Band v4 (git submodule)
│   └── world/                        # WORLD vocoder (git submodule)
├── src/
│   ├── PluginProcessor.h/cpp         # Main audio processor
│   ├── PluginEditor.h/cpp            # GUI
│   ├── dsp/
│   │   ├── HarmonyVoice.h/cpp        # Single voice (pitch + formant + delay)
│   │   ├── FormantEngine.h/cpp       # Rubber Band or WORLD wrapper
│   │   ├── PanLaw.h/cpp              # Stereo panning (equal power)
│   │   └── StereoMixer.h/cpp         # Voice summing + master
│   ├── params/
│   │   ├── Parameters.h              # All parameter IDs and ranges
│   │   └── PresetManager.h/cpp       # Save/load presets
│   └── gui/
│       ├── VoiceStrip.h/cpp          # Per-voice UI strip
│       ├── MasterSection.h/cpp       # Master controls
│       └── LookAndFeel.h/cpp         # Custom styling
└── presets/
    └── *.xml                         # Factory presets (from Max experiments)
```

### Parameters

```cpp
// Per voice (x4 or x6 or x8)
struct VoiceParams {
    float semitones;      // -24 to +24 semitones
    float formant;        // -24 to +24 semitones (independent!)
    float gain;           // -inf to +12 dB
    float pan;            // -1.0 (L) to +1.0 (R)
    float delay;          // 0 to 2000 ms
    bool  enabled;        // on/off per voice
};

// Master
struct MasterParams {
    float dryGain;        // -inf to +12 dB
    float masterGain;     // -inf to +12 dB
    float reverbMix;      // 0 to 1
    float reverbDecay;    // 0.1 to 10 seconds
    int   keyRoot;        // 0-11 (C to B)
    int   scaleType;      // major, minor, dorian, etc.
    bool  keyFollow;      // snap voices to scale
};
```

### Audio Processing (processBlock)

```cpp
void SphinxharmProcessor::processBlock(AudioBuffer<float>& buffer, MidiBuffer&)
{
    auto* input = buffer.getReadPointer(0);  // mono mic input

    // Clear output (stereo)
    buffer.clear();

    for (int v = 0; v < numVoices; v++)
    {
        if (!voices[v].enabled) continue;

        // 1. Pitch + formant shift (Rubber Band or WORLD)
        voices[v].engine.process(input, shifted, numSamples);

        // 2. Per-voice delay
        voices[v].delay.process(shifted, delayed, numSamples);

        // 3. Per-voice gain
        applyGain(delayed, voices[v].gain, numSamples);

        // 4. Pan to stereo
        float leftGain, rightGain;
        equalPowerPan(voices[v].pan, leftGain, rightGain);

        // 5. Sum into stereo output
        for (int i = 0; i < numSamples; i++)
        {
            buffer.getWritePointer(0)[i] += delayed[i] * leftGain;
            buffer.getWritePointer(1)[i] += delayed[i] * rightGain;
        }
    }

    // 6. Add dry signal (center-panned)
    for (int i = 0; i < numSamples; i++)
    {
        float dry = input[i] * dryGain;
        buffer.getWritePointer(0)[i] += dry;
        buffer.getWritePointer(1)[i] += dry;
    }

    // 7. Master gain
    buffer.applyGain(masterGain);
}
```

### GUI Mockup

```
┌─────────────────────────────────────────────────────────┐
│  SPHINXHARM                              [Key: C major] │
├──────────┬──────────┬──────────┬──────────┬─────────────┤
│  VOICE 1 │  VOICE 2 │  VOICE 3 │  VOICE 4 │   MASTER   │
│          │          │          │          │             │
│ Semi  +4 │ Semi  +7 │ Semi +12 │ Semi -12 │  Dry   0dB │
│ Fmt   +2 │ Fmt    0 │ Fmt   -3 │ Fmt   +5 │  Master 0dB│
│ Gain  0  │ Gain  -3 │ Gain  -6 │ Gain  -6 │  Reverb 30%│
│ Pan -0.5 │ Pan +0.5 │ Pan -0.8 │ Pan +0.8 │             │
│ Dly  15  │ Dly  25  │ Dly  40  │ Dly  60  │  [L■■■  ]  │
│          │          │          │          │  [  ■■■R]  │
│ [ON/OFF] │ [ON/OFF] │ [ON/OFF] │ [ON/OFF] │             │
└──────────┴──────────┴──────────┴──────────┴─────────────┘
│                    PRESETS                                │
│  [Bon Iver] [Choir] [Robot] [Whisper] [Custom]          │
└──────────────────────────────────────────────────────────┘
```

### Build Commands (When Ready)

```bash
# Clone and setup
mkdir sphinxharm-plugin && cd sphinxharm-plugin
git init
git submodule add https://github.com/juce-framework/JUCE.git libs/JUCE
git submodule add https://github.com/breakfastquay/rubberband.git libs/rubberband
git submodule add https://github.com/mmorise/World.git libs/world

# Build
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release

# Outputs: build/sphinxharm_artefacts/VST3/Sphinxharm.vst3
#          build/sphinxharm_artefacts/AU/Sphinxharm.component
#          build/sphinxharm_artefacts/Standalone/Sphinxharm
```

---

## Next Steps (In Order)

### NOW — Max Experimentation
1. ~~Install FFTease from Max Package Manager~~ (patch uses mindwarp~, install when opening)
2. ~~Replace gen~ pitch shifting with pfft~ + gizmo~ on one voice~~ DONE
3. ~~Add mindwarp~ after pfft~ for formant warping~~ DONE
4. Compare quality: gen~ granular vs pfft~ spectral
5. Find the formant range that sounds best on your voice
6. ~~Wire up harmony_engine.js for key-following~~ DONE (sigmund~ pitch detect + scale-aware intervals)
7. ~~Build 3-5 presets you love~~ DONE (Woods, Choir, Shimmer, Dark)
8. Perform with it. Note what's missing.

### LATER — JUCE Port
1. Scaffold JUCE project with CMake
2. Integrate Rubber Band v4 (or WORLD if voice-only)
3. Port signal chain from Max
4. Build GUI
5. Test presets from Max experiments
6. Ship VST3/AU

---

*Last updated: 2026-03-15*
