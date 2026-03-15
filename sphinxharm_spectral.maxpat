{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 1,
			"revision": 0,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			50.0,
			50.0,
			990.0,
			640.0
		],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15.0,
			15.0
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"lefttoolbarpinned": 0,
		"toptoolbarpinned": 0,
		"righttoolbarpinned": 0,
		"bottomtoolbarpinned": 0,
		"toolbars_unpinned_last_save": 0,
		"tallnewobj": 0,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 0.0,
		"description": "",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"id": "title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						10.0,
						900.0,
						20.0
					],
					"text": "SPHINXHARM 4-Voice Spectral Harmonizer  |  Semi=pitch(st)  Form=formant warp(1.0=neutral)"
				}
			},
			{
				"box": {
					"id": "adc",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						20.0,
						45.0,
						45.0,
						22.0
					],
					"text": "adc~ 1",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v1lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						80.0,
						200.0,
						20.0
					],
					"text": "-- VOICE 1 --"
				}
			},
			{
				"box": {
					"id": "v1slbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						105.0,
						38.0,
						20.0
					],
					"text": "Semi:"
				}
			},
			{
				"box": {
					"id": "v1semi",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						62.0,
						105.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v1expr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						20.0,
						135.0,
						165.0,
						22.0
					],
					"text": "expr pow(2.\\, $f1/12.)",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "v1sigr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						20.0,
						165.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v1pfft",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						20.0,
						195.0,
						200.0,
						22.0
					],
					"text": "pfft~ spectral_voice 2048 4",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v1flbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						235.0,
						42.0,
						20.0
					],
					"text": "Form:"
				}
			},
			{
				"box": {
					"id": "v1form",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						65.0,
						235.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v1sigf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						65.0,
						265.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v1mw",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						20.0,
						295.0,
						120.0,
						22.0
					],
					"text": "fftz.mindwarp~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v1gain",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						20.0,
						330.0,
						50.0,
						22.0
					],
					"text": "*~ 0.3",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v2lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						250.0,
						80.0,
						200.0,
						20.0
					],
					"text": "-- VOICE 2 --"
				}
			},
			{
				"box": {
					"id": "v2slbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						250.0,
						105.0,
						38.0,
						20.0
					],
					"text": "Semi:"
				}
			},
			{
				"box": {
					"id": "v2semi",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						292.0,
						105.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v2expr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						135.0,
						165.0,
						22.0
					],
					"text": "expr pow(2.\\, $f1/12.)",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "v2sigr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						165.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v2pfft",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						195.0,
						200.0,
						22.0
					],
					"text": "pfft~ spectral_voice 2048 4",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v2flbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						250.0,
						235.0,
						42.0,
						20.0
					],
					"text": "Form:"
				}
			},
			{
				"box": {
					"id": "v2form",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						295.0,
						235.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v2sigf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						295.0,
						265.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v2mw",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						295.0,
						120.0,
						22.0
					],
					"text": "fftz.mindwarp~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v2gain",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						330.0,
						50.0,
						22.0
					],
					"text": "*~ 0.3",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v3lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						480.0,
						80.0,
						200.0,
						20.0
					],
					"text": "-- VOICE 3 --"
				}
			},
			{
				"box": {
					"id": "v3slbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						480.0,
						105.0,
						38.0,
						20.0
					],
					"text": "Semi:"
				}
			},
			{
				"box": {
					"id": "v3semi",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						522.0,
						105.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v3expr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						480.0,
						135.0,
						165.0,
						22.0
					],
					"text": "expr pow(2.\\, $f1/12.)",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "v3sigr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						480.0,
						165.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v3pfft",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						480.0,
						195.0,
						200.0,
						22.0
					],
					"text": "pfft~ spectral_voice 2048 4",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v3flbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						480.0,
						235.0,
						42.0,
						20.0
					],
					"text": "Form:"
				}
			},
			{
				"box": {
					"id": "v3form",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						525.0,
						235.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v3sigf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						525.0,
						265.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v3mw",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						480.0,
						295.0,
						120.0,
						22.0
					],
					"text": "fftz.mindwarp~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v3gain",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						480.0,
						330.0,
						50.0,
						22.0
					],
					"text": "*~ 0.3",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v4lbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710.0,
						80.0,
						200.0,
						20.0
					],
					"text": "-- VOICE 4 --"
				}
			},
			{
				"box": {
					"id": "v4slbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710.0,
						105.0,
						38.0,
						20.0
					],
					"text": "Semi:"
				}
			},
			{
				"box": {
					"id": "v4semi",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						752.0,
						105.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v4expr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						710.0,
						135.0,
						165.0,
						22.0
					],
					"text": "expr pow(2.\\, $f1/12.)",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "v4sigr",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						710.0,
						165.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v4pfft",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						710.0,
						195.0,
						200.0,
						22.0
					],
					"text": "pfft~ spectral_voice 2048 4",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v4flbl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						710.0,
						235.0,
						42.0,
						20.0
					],
					"text": "Form:"
				}
			},
			{
				"box": {
					"id": "v4form",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						755.0,
						235.0,
						55.0,
						22.0
					],
					"outlettype": [
						"",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "v4sigf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						755.0,
						265.0,
						45.0,
						22.0
					],
					"text": "sig~ 1.",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v4mw",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						710.0,
						295.0,
						120.0,
						22.0
					],
					"text": "fftz.mindwarp~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "v4gain",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						710.0,
						330.0,
						50.0,
						22.0
					],
					"text": "*~ 0.3",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "mix12",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						300.0,
						370.0,
						35.0,
						22.0
					],
					"text": "+~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "mix123",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						300.0,
						400.0,
						35.0,
						22.0
					],
					"text": "+~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "mixall",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						300.0,
						430.0,
						35.0,
						22.0
					],
					"text": "+~",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "master",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						300.0,
						465.0,
						55.0,
						22.0
					],
					"text": "*~ 0.5",
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "dac",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						300.0,
						505.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "inst1",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						560.0,
						900.0,
						20.0
					],
					"text": "1. DSP on   2. Semi: 7=fifth, 12=octave, -12=oct down, 0=no shift"
				}
			},
			{
				"box": {
					"id": "inst2",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						580.0,
						900.0,
						20.0
					],
					"text": "3. Formant: 1.0=neutral, 1.5=brighter, 0.7=darker   (if mindwarp~ errors, formant unavailable)"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"v1semi",
						0
					],
					"destination": [
						"v1expr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1expr",
						0
					],
					"destination": [
						"v1sigr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1sigr",
						0
					],
					"destination": [
						"v1pfft",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"adc",
						0
					],
					"destination": [
						"v1pfft",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1pfft",
						0
					],
					"destination": [
						"v1mw",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1form",
						0
					],
					"destination": [
						"v1sigf",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1sigf",
						0
					],
					"destination": [
						"v1mw",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1mw",
						0
					],
					"destination": [
						"v1gain",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2semi",
						0
					],
					"destination": [
						"v2expr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2expr",
						0
					],
					"destination": [
						"v2sigr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2sigr",
						0
					],
					"destination": [
						"v2pfft",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"adc",
						0
					],
					"destination": [
						"v2pfft",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2pfft",
						0
					],
					"destination": [
						"v2mw",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2form",
						0
					],
					"destination": [
						"v2sigf",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2sigf",
						0
					],
					"destination": [
						"v2mw",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2mw",
						0
					],
					"destination": [
						"v2gain",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3semi",
						0
					],
					"destination": [
						"v3expr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3expr",
						0
					],
					"destination": [
						"v3sigr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3sigr",
						0
					],
					"destination": [
						"v3pfft",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"adc",
						0
					],
					"destination": [
						"v3pfft",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3pfft",
						0
					],
					"destination": [
						"v3mw",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3form",
						0
					],
					"destination": [
						"v3sigf",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3sigf",
						0
					],
					"destination": [
						"v3mw",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3mw",
						0
					],
					"destination": [
						"v3gain",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4semi",
						0
					],
					"destination": [
						"v4expr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4expr",
						0
					],
					"destination": [
						"v4sigr",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4sigr",
						0
					],
					"destination": [
						"v4pfft",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"adc",
						0
					],
					"destination": [
						"v4pfft",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4pfft",
						0
					],
					"destination": [
						"v4mw",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4form",
						0
					],
					"destination": [
						"v4sigf",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4sigf",
						0
					],
					"destination": [
						"v4mw",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4mw",
						0
					],
					"destination": [
						"v4gain",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v1gain",
						0
					],
					"destination": [
						"mix12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v2gain",
						0
					],
					"destination": [
						"mix12",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"mix12",
						0
					],
					"destination": [
						"mix123",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v3gain",
						0
					],
					"destination": [
						"mix123",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"mix123",
						0
					],
					"destination": [
						"mixall",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"v4gain",
						0
					],
					"destination": [
						"mixall",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"mixall",
						0
					],
					"destination": [
						"master",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"master",
						0
					],
					"destination": [
						"dac",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"master",
						0
					],
					"destination": [
						"dac",
						1
					]
				}
			}
		],
		"autosave": 0
	}
}