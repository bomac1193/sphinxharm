/*
	Preset Handler for Sphinxharm Spectral

	Inlet 0: bang = "Woods"
	Inlet 1: bang = "Choir"
	Inlet 2: bang = "Shimmer"
	Inlet 3: bang = "Dark"

	Outlet 0: messages to set voice parameters
	  - v1_semi / v2_semi / v3_semi / v4_semi  (semitones)
	  - v1_formant ... v4_formant               (semitones, tilt EQ)
	  - v1_gain ... v4_gain                     (dB)
	  - v1_delay ... v4_delay                   (ms)
	  - v1_pan ... v4_pan                       (-1..1)
	  - dry_gain                                (dB)
*/

inlets = 4;
outlets = 1;

var presets = {
	// Woods — tight choir stack, heavy formant, wide stereo
	woods: {
		voices: [
			{ semi: 4,   formant: -3,  gain: -3,  delay: 12,  pan: -0.4 },
			{ semi: 7,   formant: 0,   gain: -4,  delay: 18,  pan: 0.4  },
			{ semi: 12,  formant: 5,   gain: -8,  delay: 30,  pan: -0.7 },
			{ semi: -12, formant: -7,  gain: -6,  delay: 45,  pan: 0.7  }
		],
		dry: -6
	},

	// Choir — full choral spread, natural formants
	choir: {
		voices: [
			{ semi: -7,  formant: -5,  gain: -2,  delay: 8,   pan: -0.6 },
			{ semi: 4,   formant: 2,   gain: -2,  delay: 15,  pan: 0.3  },
			{ semi: 7,   formant: 0,   gain: -3,  delay: 22,  pan: -0.3 },
			{ semi: 12,  formant: 4,   gain: -6,  delay: 35,  pan: 0.6  }
		],
		dry: 0
	},

	// Shimmer — Eventide-style octave shimmer
	shimmer: {
		voices: [
			{ semi: 12,  formant: 8,   gain: -8,  delay: 20,  pan: -0.8 },
			{ semi: 19,  formant: 10,  gain: -12, delay: 35,  pan: 0.8  },
			{ semi: 7,   formant: 3,   gain: -6,  delay: 15,  pan: -0.3 },
			{ semi: 24,  formant: 12,  gain: -18, delay: 50,  pan: 0.3  }
		],
		dry: 0
	},

	// Dark — low moody harmonies
	dark: {
		voices: [
			{ semi: -3,  formant: -8,  gain: 0,   delay: 10,  pan: -0.5 },
			{ semi: -7,  formant: -10, gain: -2,  delay: 20,  pan: 0.5  },
			{ semi: -12, formant: -12, gain: -4,  delay: 40,  pan: -0.8 },
			{ semi: 0,   formant: -5,  gain: -6,  delay: 5,   pan: 0.0  }
		],
		dry: -3
	}
};

function msg_int(v) {
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
	for (var i = 0; i < p.voices.length; i++) {
		var v = p.voices[i];
		var n = i + 1;

		outlet(0, "v" + n + "_semi", v.semi);
		outlet(0, "v" + n + "_formant", v.formant);
		outlet(0, "v" + n + "_gain", v.gain);
		outlet(0, "v" + n + "_delay", v.delay);
		outlet(0, "v" + n + "_pan", v.pan);
	}

	outlet(0, "dry_gain", p.dry);
}
