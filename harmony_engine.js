/*
	Harmony Engine — calculates semitone shifts from key, scale, and interval

	Inlet 0: key (0-11, C=0)
	Inlet 1: scale index (0=Major, 1=Minor, 2=Dorian, 3=Mixolydian,
	          4=Pent Maj, 5=Pent Min, 6=Chromatic)

	Sends semitone values to voice gen~ objects via outlet messages
*/

inlets = 2;
outlets = 1;

var key = 0;
var scaleIdx = 0;

// Scale intervals (semitones from root)
var scales = {
	0: [0, 2, 4, 5, 7, 9, 11],          // Major (Ionian)
	1: [0, 2, 3, 5, 7, 8, 10],          // Natural Minor (Aeolian)
	2: [0, 2, 3, 5, 7, 9, 10],          // Dorian
	3: [0, 2, 4, 5, 7, 9, 10],          // Mixolydian
	4: [0, 2, 4, 7, 9],                  // Pentatonic Major
	5: [0, 3, 5, 7, 10],                 // Pentatonic Minor
	6: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] // Chromatic
};

// Interval name → scale degree offset mapping
// Negative = below root, positive = above
var intervalMap = {
	"OFF":        null,
	"Unison":     0,
	"-2nd":      -1,
	"-3rd":      -2,
	"-4th":      -3,
	"-5th":      -4,
	"-6th":      -5,
	"-7th":      -6,
	"-Oct":      -7,
	"+2nd":       1,
	"+3rd":       2,
	"+4th":       3,
	"+5th":       4,
	"+6th":       5,
	"+7th":       6,
	"+Oct":       7,
	"+Oct+3rd":   9,
	"+Oct+5th":  11,
	"+2Oct":     14,
	"-Oct-3rd":  -9
};

function msg_int(v) {
	if (inlet === 0) {
		key = v;
	} else if (inlet === 1) {
		scaleIdx = v;
	}
}

// Convert a scale degree offset to semitones
// degree can be negative (below) or positive (above)
function degreeToSemitones(degree) {
	if (degree === null) return null;

	var scale = scales[scaleIdx] || scales[0];
	var len = scale.length;

	if (degree === 0) return 0;

	var octaves = 0;
	var idx = degree;

	// Handle octave wrapping
	if (idx > 0) {
		octaves = Math.floor(idx / len);
		idx = idx % len;
	} else {
		// For negative, wrap upward
		octaves = Math.ceil(idx / len) - 1;
		idx = ((idx % len) + len) % len;
	}

	return scale[idx] + (octaves * 12);
}

// Called from preset_handler or directly
// voice: 1-4, intervalName: string from umenu
function setVoiceInterval(voice, intervalName) {
	var degree = intervalMap[intervalName];
	var semitones = degreeToSemitones(degree);

	if (semitones === null) {
		// Voice is OFF — send 0 semitones and mute
		outlet(0, "voice", voice, 0, 0); // voice, num, semitones, active
	} else {
		outlet(0, "voice", voice, semitones, 1);
	}
}

// Recalculate all voices when key/scale changes
function bang() {
	post("Harmony Engine: key=" + key + " scale=" + scaleIdx + "\n");
}
