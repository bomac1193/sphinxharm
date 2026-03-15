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
            100.0,
            700.0,
            560.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        20,
                        10,
                        600,
                        22
                    ],
                    "text": "TEST: Single voice pitch debug \u2014 change semi and watch values propagate",
                    "fontsize": 14,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "adc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        50,
                        45,
                        22
                    ],
                    "text": "adc~ 1",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        500,
                        45,
                        45
                    ]
                }
            },
            {
                "box": {
                    "id": "semi-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        90,
                        200,
                        20
                    ],
                    "text": "SEMITONES (-24 to 24):"
                }
            },
            {
                "box": {
                    "id": "semi",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        30,
                        112,
                        60,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -24.0,
                    "maximum": 24.0
                }
            },
            {
                "box": {
                    "id": "expr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        150,
                        140,
                        22
                    ],
                    "text": "expr pow(2.\\, $f1/12.)",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "expr-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        180,
                        150,
                        200,
                        20
                    ],
                    "text": "<-- ratio (should change)"
                }
            },
            {
                "box": {
                    "id": "ratio-display",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        30,
                        180,
                        80,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ]
                }
            },
            {
                "box": {
                    "id": "ratio-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        120,
                        180,
                        250,
                        20
                    ],
                    "text": "<-- DEBUG: ratio value (1.0=no shift, 2.0=octave)"
                }
            },
            {
                "box": {
                    "id": "sig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        220,
                        32,
                        22
                    ],
                    "text": "sig~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "num-sig",
                    "maxclass": "number~",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        80,
                        220,
                        80,
                        22
                    ],
                    "outlettype": [
                        "signal",
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "sig-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        170,
                        220,
                        200,
                        20
                    ],
                    "text": "<-- DEBUG: signal value going to send~"
                }
            },
            {
                "box": {
                    "id": "send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        260,
                        110,
                        22
                    ],
                    "text": "send~ sharm_r1"
                }
            },
            {
                "box": {
                    "id": "send-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        150,
                        260,
                        300,
                        20
                    ],
                    "text": "<-- sends ratio to pfft~ subpatch"
                }
            },
            {
                "box": {
                    "id": "pfft",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        310,
                        220,
                        22
                    ],
                    "text": "pfft~ spectral_voice_1 2048 4",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "pfft-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        260,
                        310,
                        300,
                        20
                    ],
                    "text": "<-- loads spectral_voice_1 (receive~ sharm_r1 \u2192 gizmo~)"
                }
            },
            {
                "box": {
                    "id": "gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        370,
                        50,
                        22
                    ],
                    "text": "*~ 0.5",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "out-meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        410,
                        200,
                        14
                    ],
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "dry-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        90,
                        200,
                        20
                    ],
                    "text": "DRY COMPARISON:"
                }
            },
            {
                "box": {
                    "id": "dry-gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        370,
                        50,
                        22
                    ],
                    "text": "*~ 0.3",
                    "outlettype": [
                        "signal"
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
                        30,
                        460,
                        600,
                        20
                    ],
                    "text": "INSTRUCTIONS: Turn on DSP. Type 7 in semi box. You should hear pitch go UP a 5th."
                }
            },
            {
                "box": {
                    "id": "inst2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        480,
                        600,
                        20
                    ],
                    "text": "Watch the ratio display: 0\u21921.0, 7\u21921.498, 12\u21922.0, -12\u21920.5"
                }
            },
            {
                "box": {
                    "id": "inst3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        500,
                        600,
                        20
                    ],
                    "text": "If ratio display changes but pitch does NOT change, the issue is inside pfft~/gizmo~/receive~."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "semi",
                        0
                    ],
                    "destination": [
                        "expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "expr",
                        0
                    ],
                    "destination": [
                        "ratio-display",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "expr",
                        0
                    ],
                    "destination": [
                        "sig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sig",
                        0
                    ],
                    "destination": [
                        "num-sig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "sig",
                        0
                    ],
                    "destination": [
                        "send",
                        0
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
                        "pfft",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "pfft",
                        0
                    ],
                    "destination": [
                        "gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "gain",
                        0
                    ],
                    "destination": [
                        "out-meter",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "gain",
                        0
                    ],
                    "destination": [
                        "ezdac",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "gain",
                        0
                    ],
                    "destination": [
                        "ezdac",
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
                        "dry-gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "dry-gain",
                        0
                    ],
                    "destination": [
                        "ezdac",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "dry-gain",
                        0
                    ],
                    "destination": [
                        "ezdac",
                        1
                    ]
                }
            }
        ],
        "autosave": 0
    }
}