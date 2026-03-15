/*
	Harmony Engine — key-following pitch harmonizer

	When key-follow is ON, voices shift by musical intervals that
	stay in-key. The shift amount adapts to the sung note:
	  e.g. in C major, "+3rd" while singing C = +4st (→E),
	       but "+3rd" while singing D = +3st (→F).

	Inlet 0: key (int 0-11, C=0) OR messages:
	         "v1 +3rd" etc — set voice interval
	         "keyfollow 1/0" — enable/disable
	Inlet 1: scale index (int 0-6)
	Inlet 2: detected MIDI note (float, from sigmund~ → ftom)

	Outlet 0: messages — v1_semi / v2_semi / v3_semi / v4_semi
*/

inlets = 3;
outlets = 1;

var key = 0;
var scaleIdx = 0;
var currentPitch = -1;
var keyFollowEnabled = false;

// Per-voice: scale degree offset (null = OFF)
var voiceDegrees = [2, 4, 7, -7]; // default: +3rd, +5th, +Oct, -Oct

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

// Interval name → scale degree offset
var intervalMap = {
	"OFF":        null,
	"Unison":     0,
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
	"-2nd":      -1,
	"-3rd":      -2,
	"-4th":      -3,
	"-5th":      -4,
	"-6th":      -5,
	"-7th":      -6,
	"-Oct":      -7,
	"-Oct-3rd":  -9
};

function msg_int(v) {
	if (inlet === 0) {
		key = v;
		if (keyFollowEnabled) recalcAll();
	} else if (inlet === 1) {
		scaleIdx = v;
		if (keyFollowEnabled) recalcAll();
	}
}

function msg_float(v) {
	if (inlet === 2) {
		// Only update if pitch is valid (sigmund~ sends 0 when silent)
		if (v > 20 && v < 120) {
			currentPitch = v;
			if (keyFollowEnabled) recalcAll();
		}
	}
}

function anything() {
	if (inlet !== 0) return;

	var name = messagename;

	if (name === "keyfollow") {
		keyFollowEnabled = arrayfromargs(arguments)[0] ? true : false;
		if (keyFollowEnabled && currentPitch > 0) recalcAll();
		post("Key follow: " + (keyFollowEnabled ? "ON" : "OFF") + "\n");
		return;
	}

	// "v1 +3rd" → messagename="v1", arguments=["+3rd"]
	var match = name.match(/^v(\d)$/);
	if (match) {
		var voiceIdx = parseInt(match[1]) - 1;
		if (voiceIdx < 0 || voiceIdx > 3) return;

		var intervalName = arrayfromargs(arguments)[0];
		if (intervalName in intervalMap) {
			voiceDegrees[voiceIdx] = intervalMap[intervalName];
			if (keyFollowEnabled && currentPitch > 0) recalcVoice(voiceIdx);
			post("Voice " + (voiceIdx + 1) + ": " + intervalName + "\n");
		}
	}
}

function bang() {
	if (keyFollowEnabled && currentPitch > 0) recalcAll();
}

function recalcAll() {
	for (var i = 0; i < 4; i++) {
		recalcVoice(i);
	}
}

function recalcVoice(idx) {
	var degree = voiceDegrees[idx];
	if (degree === null) return; // voice OFF

	var scale = scales[scaleIdx] || scales[0];
	var len = scale.length;

	// Find input note's position relative to key
	var noteInOctave = Math.round(currentPitch) % 12;
	var relToKey = ((noteInOctave - key) % 12 + 12) % 12;

	// Find nearest scale degree index
	var nearestIdx = 0;
	var minDist = 12;
	for (var i = 0; i < len; i++) {
		var d = Math.abs(scale[i] - relToKey);
		var dWrap = Math.min(d, 12 - d);
		if (dWrap < minDist) {
			minDist = dWrap;
			nearestIdx = i;
		}
	}

	// Target = current scale degree + voice offset
	var targetIdx = nearestIdx + degree;

	// Handle octave wrapping
	var octaveShift = 0;
	while (targetIdx >= len) {
		targetIdx -= len;
		octaveShift += 12;
	}
	while (targetIdx < 0) {
		targetIdx += len;
		octaveShift -= 12;
	}

	// Semitone shift = (target note in scale) - (input note in scale) + octave shift
	var shift = (scale[targetIdx] + octaveShift) - scale[nearestIdx];

	outlet(0, "v" + (idx + 1) + "_semi", shift);
}
