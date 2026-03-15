/*
	Preset Handler for Sphinx Harmonizer

	Inlet 0: "Woods" preset (layered choir stack)
	Inlet 1: "Choir" preset (Full choral stack)
	Inlet 2: "Shimmer" preset (Eventide-style octave shimmer)
	Inlet 3: "Dark" preset (Low, moody harmonies)

	Outlet 0: messages to set voice parameters
*/

inlets = 4;
outlets = 1;

var presets = {
	// Woods — tight unison/3rd stack, heavy formant, lots of reverb
	// Layered choir-of-one sound
	woods: {
		voices: [
			{ interval: "+3rd", formant: -3, gain: -3 },
			{ interval: "+5th", formant: 0, gain: -4 },
			{ interval: "+Oct", formant: 5, gain: -8 },
			{ interval: "-Oct", formant: -7, gain: -6 }
		],
		dry: -6,
		detune: 12,
		reverb_mix: 45,
		reverb_size: 80
	},

	// Choir — full choral spread, natural formants
	choir: {
		voices: [
			{ interval: "-5th", formant: -5, gain: -2 },
			{ interval: "+3rd", formant: 2, gain: -2 },
			{ interval: "+5th", formant: 0, gain: -3 },
			{ interval: "+Oct", formant: 4, gain: -6 }
		],
		dry: 0,
		detune: 8,
		reverb_mix: 30,
		reverb_size: 65
	},

	// Shimmer — Eventide-style octave up shimmer
	shimmer: {
		voices: [
			{ interval: "+Oct", formant: 8, gain: -8 },
			{ interval: "+Oct+5th", formant: 10, gain: -12 },
			{ interval: "+5th", formant: 3, gain: -6 },
			{ interval: "+2Oct", formant: 12, gain: -18 }
		],
		dry: 0,
		detune: 15,
		reverb_mix: 60,
		reverb_size: 90
	},

	// Dark — low harmonies, formant shifted down
	dark: {
		voices: [
			{ interval: "-3rd", formant: -8, gain: 0 },
			{ interval: "-5th", formant: -10, gain: -2 },
			{ interval: "-Oct", formant: -12, gain: -4 },
			{ interval: "Unison", formant: -5, gain: -6 }
		],
		dry: -3,
		detune: 5,
		reverb_mix: 25,
		reverb_size: 50
	}
};

function msg_int(v) {
	// v is ignored — we use the inlet number
	var presetNames = ["woods", "choir", "shimmer", "dark"];
	var name = presetNames[inlet];

	if (name && presets[name]) {
		applyPreset(presets[name]);
		post("Preset: " + name + "\n");
	}
}

function bang() {
	msg_int(1);
}

function applyPreset(p) {
	// Set each voice
	for (var i = 0; i < p.voices.length; i++) {
		var v = p.voices[i];
		var voiceNum = i + 1;

		// Send interval name (for umenu)
		outlet(0, "v" + voiceNum + "_interval", v.interval);

		// Send formant shift
		outlet(0, "v" + voiceNum + "_formant", v.formant);

		// Send gain
		outlet(0, "v" + voiceNum + "_gain", v.gain);
	}

	// Global params
	outlet(0, "dry_gain", p.dry);
	outlet(0, "detune", p.detune);
	outlet(0, "reverb_mix", p.reverb_mix);
	outlet(0, "reverb_size", p.reverb_size);
}
