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
            34.0,
            80.0,
            1400.0,
            1080.0
        ],
        "bglocked": 0,
        "openinpresentation": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        10,
                        550,
                        20
                    ],
                    "text": "SPHINXHARM SPECTRAL \u2014 4-voice harmonizer with independent pitch + formant",
                    "fontsize": 13,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        30,
                        650,
                        20
                    ],
                    "text": "pfft~/gizmo~ (pitch) + fftz.mindwarp~ (formant). Each voice fully independent."
                }
            },
            {
                "box": {
                    "id": "obj-adc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        50,
                        60,
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
                    "id": "obj-in-meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        110,
                        62,
                        100,
                        14
                    ],
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        1200,
                        60,
                        58,
                        22
                    ],
                    "text": "loadbang",
                    "outlettype": [
                        "bang"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        90,
                        100,
                        20
                    ],
                    "text": "VOICE 1",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-v1-slbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        110,
                        290,
                        20
                    ],
                    "text": "semi / formant / gain(dB) / delay(ms) / pan(-1..1)"
                }
            },
            {
                "box": {
                    "id": "obj-v1-semi",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        30,
                        132,
                        50,
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
                    "id": "obj-v1-fmt",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        90,
                        132,
                        50,
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
                    "id": "obj-v1-gain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        150,
                        132,
                        50,
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
                    "id": "obj-v1-dly",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        210,
                        132,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 2000.0
                }
            },
            {
                "box": {
                    "id": "obj-v1-pan",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        270,
                        132,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -1.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-v1-ratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        162,
                        128,
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
                    "id": "obj-v1-dbtoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        170,
                        162,
                        38,
                        22
                    ],
                    "text": "dbtoa",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-dlysig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        220,
                        162,
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
                    "id": "obj-v1-ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280,
                        162,
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
                    "id": "obj-v1-ratiosig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        192,
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
                    "id": "obj-v1-sendratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        222,
                        110,
                        22
                    ],
                    "text": "send~ sharm_r1"
                }
            },
            {
                "box": {
                    "id": "obj-v1-fmtsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        90,
                        192,
                        128,
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
                    "id": "obj-v1-ms2s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        230,
                        192,
                        65,
                        22
                    ],
                    "text": "mstosamps~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-phalf",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        192,
                        40,
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
                    "id": "obj-v1-fmtwarpsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        90,
                        246,
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
                    "id": "obj-v1-poff",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        246,
                        40,
                        22
                    ],
                    "text": "+~ 0.5",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-invp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        230,
                        246,
                        50,
                        22
                    ],
                    "text": "!-~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-pfft",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        276,
                        260,
                        22
                    ],
                    "text": "pfft~ spectral_voice_fft 2048 4 1",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-fmteq",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        306,
                        130,
                        22
                    ],
                    "text": "fftz.mindwarp~ 2048 4",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-mult",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        336,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        366,
                        75,
                        22
                    ],
                    "text": "delay~ 88200",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-panR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        396,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-panL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        130,
                        396,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        90,
                        100,
                        20
                    ],
                    "text": "VOICE 2",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-v2-slbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        110,
                        290,
                        20
                    ],
                    "text": "semi / formant / gain(dB) / delay(ms) / pan(-1..1)"
                }
            },
            {
                "box": {
                    "id": "obj-v2-semi",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        360,
                        132,
                        50,
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
                    "id": "obj-v2-fmt",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        420,
                        132,
                        50,
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
                    "id": "obj-v2-gain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        480,
                        132,
                        50,
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
                    "id": "obj-v2-dly",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        540,
                        132,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 2000.0
                }
            },
            {
                "box": {
                    "id": "obj-v2-pan",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        600,
                        132,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -1.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-v2-ratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        162,
                        128,
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
                    "id": "obj-v2-dbtoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        500,
                        162,
                        38,
                        22
                    ],
                    "text": "dbtoa",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-dlysig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        550,
                        162,
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
                    "id": "obj-v2-ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        610,
                        162,
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
                    "id": "obj-v2-ratiosig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        192,
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
                    "id": "obj-v2-sendratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        222,
                        110,
                        22
                    ],
                    "text": "send~ sharm_r2"
                }
            },
            {
                "box": {
                    "id": "obj-v2-fmtsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        420,
                        192,
                        128,
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
                    "id": "obj-v2-ms2s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        560,
                        192,
                        65,
                        22
                    ],
                    "text": "mstosamps~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-phalf",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        630,
                        192,
                        40,
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
                    "id": "obj-v2-fmtwarpsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        420,
                        246,
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
                    "id": "obj-v2-poff",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        630,
                        246,
                        40,
                        22
                    ],
                    "text": "+~ 0.5",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-invp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        560,
                        246,
                        50,
                        22
                    ],
                    "text": "!-~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-pfft",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        276,
                        260,
                        22
                    ],
                    "text": "pfft~ spectral_voice_fft 2048 4 2",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-fmteq",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        306,
                        130,
                        22
                    ],
                    "text": "fftz.mindwarp~ 2048 4",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-mult",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        336,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        366,
                        75,
                        22
                    ],
                    "text": "delay~ 88200",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-panR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        396,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-panL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        460,
                        396,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        425,
                        100,
                        20
                    ],
                    "text": "VOICE 3",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-v3-slbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        445,
                        290,
                        20
                    ],
                    "text": "semi / formant / gain(dB) / delay(ms) / pan(-1..1)"
                }
            },
            {
                "box": {
                    "id": "obj-v3-semi",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        30,
                        467,
                        50,
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
                    "id": "obj-v3-fmt",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        90,
                        467,
                        50,
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
                    "id": "obj-v3-gain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        150,
                        467,
                        50,
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
                    "id": "obj-v3-dly",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        210,
                        467,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 2000.0
                }
            },
            {
                "box": {
                    "id": "obj-v3-pan",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        270,
                        467,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -1.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-v3-ratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        497,
                        128,
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
                    "id": "obj-v3-dbtoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        170,
                        497,
                        38,
                        22
                    ],
                    "text": "dbtoa",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-dlysig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        220,
                        497,
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
                    "id": "obj-v3-ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280,
                        497,
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
                    "id": "obj-v3-ratiosig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        527,
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
                    "id": "obj-v3-sendratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30,
                        557,
                        110,
                        22
                    ],
                    "text": "send~ sharm_r3"
                }
            },
            {
                "box": {
                    "id": "obj-v3-fmtsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        90,
                        527,
                        128,
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
                    "id": "obj-v3-ms2s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        230,
                        527,
                        65,
                        22
                    ],
                    "text": "mstosamps~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-phalf",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        527,
                        40,
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
                    "id": "obj-v3-fmtwarpsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        90,
                        581,
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
                    "id": "obj-v3-poff",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        300,
                        581,
                        40,
                        22
                    ],
                    "text": "+~ 0.5",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-invp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        230,
                        581,
                        50,
                        22
                    ],
                    "text": "!-~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-pfft",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        611,
                        260,
                        22
                    ],
                    "text": "pfft~ spectral_voice_fft 2048 4 3",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-fmteq",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        641,
                        130,
                        22
                    ],
                    "text": "fftz.mindwarp~ 2048 4",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-mult",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        671,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        701,
                        75,
                        22
                    ],
                    "text": "delay~ 88200",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-panR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        30,
                        731,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-panL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        130,
                        731,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        425,
                        100,
                        20
                    ],
                    "text": "VOICE 4",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-v4-slbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        445,
                        290,
                        20
                    ],
                    "text": "semi / formant / gain(dB) / delay(ms) / pan(-1..1)"
                }
            },
            {
                "box": {
                    "id": "obj-v4-semi",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        360,
                        467,
                        50,
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
                    "id": "obj-v4-fmt",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        420,
                        467,
                        50,
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
                    "id": "obj-v4-gain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        480,
                        467,
                        50,
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
                    "id": "obj-v4-dly",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        540,
                        467,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 2000.0
                }
            },
            {
                "box": {
                    "id": "obj-v4-pan",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        600,
                        467,
                        50,
                        22
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -1.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-v4-ratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        497,
                        128,
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
                    "id": "obj-v4-dbtoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        500,
                        497,
                        38,
                        22
                    ],
                    "text": "dbtoa",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-dlysig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        550,
                        497,
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
                    "id": "obj-v4-ps",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        610,
                        497,
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
                    "id": "obj-v4-ratiosig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        527,
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
                    "id": "obj-v4-sendratio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        360,
                        557,
                        110,
                        22
                    ],
                    "text": "send~ sharm_r4"
                }
            },
            {
                "box": {
                    "id": "obj-v4-fmtsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        420,
                        527,
                        128,
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
                    "id": "obj-v4-ms2s",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        560,
                        527,
                        65,
                        22
                    ],
                    "text": "mstosamps~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-phalf",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        630,
                        527,
                        40,
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
                    "id": "obj-v4-fmtwarpsig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        420,
                        581,
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
                    "id": "obj-v4-poff",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        630,
                        581,
                        40,
                        22
                    ],
                    "text": "+~ 0.5",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-invp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        560,
                        581,
                        50,
                        22
                    ],
                    "text": "!-~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-pfft",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        611,
                        260,
                        22
                    ],
                    "text": "pfft~ spectral_voice_fft 2048 4 4",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-fmteq",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        641,
                        130,
                        22
                    ],
                    "text": "fftz.mindwarp~ 2048 4",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-mult",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        671,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        701,
                        75,
                        22
                    ],
                    "text": "delay~ 88200",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-panR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        360,
                        731,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-panL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        460,
                        731,
                        30,
                        22
                    ],
                    "text": "*~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-key-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        90,
                        200,
                        24
                    ],
                    "text": "KEY / SCALE",
                    "fontsize": 16,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-key-menu",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        690,
                        120,
                        100,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "C",
                        ",",
                        "C#",
                        ",",
                        "D",
                        ",",
                        "Eb",
                        ",",
                        "E",
                        ",",
                        "F",
                        ",",
                        "F#",
                        ",",
                        "G",
                        ",",
                        "Ab",
                        ",",
                        "A",
                        ",",
                        "Bb",
                        ",",
                        "B"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-scale-menu",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        800,
                        120,
                        120,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "Major",
                        ",",
                        "Minor",
                        ",",
                        "Dorian",
                        ",",
                        "Mixolydian",
                        ",",
                        "Pent Maj",
                        ",",
                        "Pent Min",
                        ",",
                        "Chromatic"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-kf-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        155,
                        24,
                        24
                    ],
                    "outlettype": [
                        "int"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-kf-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        720,
                        157,
                        100,
                        20
                    ],
                    "text": "Key Follow",
                    "fontsize": 12
                }
            },
            {
                "box": {
                    "id": "obj-kf-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        185,
                        95,
                        22
                    ],
                    "text": "prepend keyfollow",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-int-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        218,
                        280,
                        20
                    ],
                    "text": "VOICE INTERVALS (active when Key Follow ON)",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-int-v1lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        242,
                        25,
                        20
                    ],
                    "text": "V1"
                }
            },
            {
                "box": {
                    "id": "obj-v1-int",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        715,
                        242,
                        70,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "OFF",
                        ",",
                        "Unison",
                        ",",
                        "+2nd",
                        ",",
                        "+3rd",
                        ",",
                        "+4th",
                        ",",
                        "+5th",
                        ",",
                        "+6th",
                        ",",
                        "+7th",
                        ",",
                        "+Oct",
                        ",",
                        "+Oct+3rd",
                        ",",
                        "+Oct+5th",
                        ",",
                        "+2Oct",
                        ",",
                        "-2nd",
                        ",",
                        "-3rd",
                        ",",
                        "-4th",
                        ",",
                        "-5th",
                        ",",
                        "-6th",
                        ",",
                        "-7th",
                        ",",
                        "-Oct",
                        ",",
                        "-Oct-3rd"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-int-v2lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        795,
                        242,
                        25,
                        20
                    ],
                    "text": "V2"
                }
            },
            {
                "box": {
                    "id": "obj-v2-int",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        820,
                        242,
                        70,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "OFF",
                        ",",
                        "Unison",
                        ",",
                        "+2nd",
                        ",",
                        "+3rd",
                        ",",
                        "+4th",
                        ",",
                        "+5th",
                        ",",
                        "+6th",
                        ",",
                        "+7th",
                        ",",
                        "+Oct",
                        ",",
                        "+Oct+3rd",
                        ",",
                        "+Oct+5th",
                        ",",
                        "+2Oct",
                        ",",
                        "-2nd",
                        ",",
                        "-3rd",
                        ",",
                        "-4th",
                        ",",
                        "-5th",
                        ",",
                        "-6th",
                        ",",
                        "-7th",
                        ",",
                        "-Oct",
                        ",",
                        "-Oct-3rd"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-int-v3lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        900,
                        242,
                        25,
                        20
                    ],
                    "text": "V3"
                }
            },
            {
                "box": {
                    "id": "obj-v3-int",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        925,
                        242,
                        70,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "OFF",
                        ",",
                        "Unison",
                        ",",
                        "+2nd",
                        ",",
                        "+3rd",
                        ",",
                        "+4th",
                        ",",
                        "+5th",
                        ",",
                        "+6th",
                        ",",
                        "+7th",
                        ",",
                        "+Oct",
                        ",",
                        "+Oct+3rd",
                        ",",
                        "+Oct+5th",
                        ",",
                        "+2Oct",
                        ",",
                        "-2nd",
                        ",",
                        "-3rd",
                        ",",
                        "-4th",
                        ",",
                        "-5th",
                        ",",
                        "-6th",
                        ",",
                        "-7th",
                        ",",
                        "-Oct",
                        ",",
                        "-Oct-3rd"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-int-v4lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1005,
                        242,
                        25,
                        20
                    ],
                    "text": "V4"
                }
            },
            {
                "box": {
                    "id": "obj-v4-int",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        1030,
                        242,
                        70,
                        22
                    ],
                    "outlettype": [
                        "int",
                        "",
                        ""
                    ],
                    "items": [
                        "OFF",
                        ",",
                        "Unison",
                        ",",
                        "+2nd",
                        ",",
                        "+3rd",
                        ",",
                        "+4th",
                        ",",
                        "+5th",
                        ",",
                        "+6th",
                        ",",
                        "+7th",
                        ",",
                        "+Oct",
                        ",",
                        "+Oct+3rd",
                        ",",
                        "+Oct+5th",
                        ",",
                        "+2Oct",
                        ",",
                        "-2nd",
                        ",",
                        "-3rd",
                        ",",
                        "-4th",
                        ",",
                        "-5th",
                        ",",
                        "-6th",
                        ",",
                        "-7th",
                        ",",
                        "-Oct",
                        ",",
                        "-Oct-3rd"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v1-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        715,
                        269,
                        65,
                        22
                    ],
                    "text": "prepend v1",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v2-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        820,
                        269,
                        65,
                        22
                    ],
                    "text": "prepend v2",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v3-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        925,
                        269,
                        65,
                        22
                    ],
                    "text": "prepend v3",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-v4-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        1030,
                        269,
                        65,
                        22
                    ],
                    "text": "prepend v4",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-retune",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        850,
                        295,
                        55,
                        22
                    ],
                    "text": "retune~",
                    "outlettype": [
                        "signal",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        850,
                        320,
                        75,
                        22
                    ],
                    "text": "snapshot~ 50",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-harmony",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        345,
                        280,
                        22
                    ],
                    "text": "js harmony_engine.js",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-preset-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        380,
                        160,
                        20
                    ],
                    "text": "PRESETS",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-preset-woods",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        403,
                        50,
                        22
                    ],
                    "text": "bang",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-preset-choir",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        745,
                        403,
                        50,
                        22
                    ],
                    "text": "bang",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-preset-shimmer",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        800,
                        403,
                        55,
                        22
                    ],
                    "text": "bang",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-preset-dark",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        860,
                        403,
                        50,
                        22
                    ],
                    "text": "bang",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-plbl-w",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        426,
                        50,
                        20
                    ],
                    "text": "Woods"
                }
            },
            {
                "box": {
                    "id": "obj-plbl-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        745,
                        426,
                        50,
                        20
                    ],
                    "text": "Choir"
                }
            },
            {
                "box": {
                    "id": "obj-plbl-s",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        800,
                        426,
                        55,
                        20
                    ],
                    "text": "Shimmer"
                }
            },
            {
                "box": {
                    "id": "obj-plbl-d",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        860,
                        426,
                        50,
                        20
                    ],
                    "text": "Dark"
                }
            },
            {
                "box": {
                    "id": "obj-presets",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        450,
                        160,
                        22
                    ],
                    "text": "js preset_handler.js",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dry-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        485,
                        50,
                        20
                    ],
                    "text": "DRY",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-dry-gain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        690,
                        507,
                        50,
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
                    "id": "obj-dry-dbtoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        534,
                        38,
                        22
                    ],
                    "text": "dbtoa",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-dry-mult",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        561,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-master-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        593,
                        80,
                        20
                    ],
                    "text": "MASTER",
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-master-val",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        690,
                        615,
                        50,
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
                    "id": "obj-master-dbtoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        690,
                        642,
                        38,
                        22
                    ],
                    "text": "dbtoa",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-route-presets",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 22,
                    "patching_rect": [
                        690,
                        680,
                        600,
                        22
                    ],
                    "text": "route v1_semi v2_semi v3_semi v4_semi v1_formant v2_formant v3_formant v4_formant v1_gain v2_gain v3_gain v4_gain v1_delay v2_delay v3_delay v4_delay v1_pan v2_pan v3_pan v4_pan dry_gain",
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl-left",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        200,
                        770,
                        40,
                        20
                    ],
                    "text": "LEFT"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-right",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        350,
                        770,
                        50,
                        20
                    ],
                    "text": "RIGHT"
                }
            },
            {
                "box": {
                    "id": "obj-sumL1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        200,
                        790,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sumL2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        200,
                        820,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sumL3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        200,
                        850,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sumR1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        350,
                        790,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sumR2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        350,
                        820,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-sumR3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        350,
                        850,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-addDryL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        200,
                        890,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-addDryR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        350,
                        890,
                        30,
                        22
                    ],
                    "text": "+~",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-masterL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        200,
                        930,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-masterR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        350,
                        930,
                        40,
                        22
                    ],
                    "text": "*~ 1.",
                    "outlettype": [
                        "signal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-meterL",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        200,
                        965,
                        100,
                        14
                    ],
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-meterR",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        350,
                        965,
                        100,
                        14
                    ],
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        260,
                        990,
                        45,
                        45
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-info1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        760,
                        350,
                        20
                    ],
                    "text": "SIGNAL FLOW:"
                }
            },
            {
                "box": {
                    "id": "obj-info2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        780,
                        550,
                        20
                    ],
                    "text": "adc~ -> pfft~/gizmo~ (PITCH shift) -> fftz.mindwarp~ (FORMANT warp, independent) -> gain -> pan"
                }
            },
            {
                "box": {
                    "id": "obj-info3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        800,
                        500,
                        20
                    ],
                    "text": "Each voice has its own pfft~ + mindwarp~ instance. Pitch and formant are SEPARATE controls."
                }
            },
            {
                "box": {
                    "id": "obj-info4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        820,
                        400,
                        20
                    ],
                    "text": "Pitch ratio reaches gizmo~ inside pfft~ via send~/receive~ (per-voice naming)."
                }
            },
            {
                "box": {
                    "id": "obj-info5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        690,
                        840,
                        400,
                        20
                    ],
                    "text": "Requires: FFTease package (for fftz.mindwarp~). retune~ is built-in."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-in-meter",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-v1-pfft",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-v2-pfft",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-v3-pfft",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-v4-pfft",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-dry-mult",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-loadbang",
                        0
                    ],
                    "destination": [
                        "obj-preset-woods",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-semi",
                        0
                    ],
                    "destination": [
                        "obj-v1-ratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-ratio",
                        0
                    ],
                    "destination": [
                        "obj-v1-ratiosig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-ratiosig",
                        0
                    ],
                    "destination": [
                        "obj-v1-sendratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-pfft",
                        0
                    ],
                    "destination": [
                        "obj-v1-fmteq",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-fmt",
                        0
                    ],
                    "destination": [
                        "obj-v1-fmtsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-fmtsig",
                        0
                    ],
                    "destination": [
                        "obj-v1-fmtwarpsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-fmtwarpsig",
                        0
                    ],
                    "destination": [
                        "obj-v1-fmteq",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-fmteq",
                        0
                    ],
                    "destination": [
                        "obj-v1-mult",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-gain",
                        0
                    ],
                    "destination": [
                        "obj-v1-dbtoa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-v1-mult",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-mult",
                        0
                    ],
                    "destination": [
                        "obj-v1-delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-dly",
                        0
                    ],
                    "destination": [
                        "obj-v1-dlysig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-dlysig",
                        0
                    ],
                    "destination": [
                        "obj-v1-ms2s",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-ms2s",
                        0
                    ],
                    "destination": [
                        "obj-v1-delay",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-pan",
                        0
                    ],
                    "destination": [
                        "obj-v1-ps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-ps",
                        0
                    ],
                    "destination": [
                        "obj-v1-phalf",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-phalf",
                        0
                    ],
                    "destination": [
                        "obj-v1-poff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-poff",
                        0
                    ],
                    "destination": [
                        "obj-v1-panR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-poff",
                        0
                    ],
                    "destination": [
                        "obj-v1-invp",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-invp",
                        0
                    ],
                    "destination": [
                        "obj-v1-panL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-delay",
                        0
                    ],
                    "destination": [
                        "obj-v1-panR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-delay",
                        0
                    ],
                    "destination": [
                        "obj-v1-panL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-semi",
                        0
                    ],
                    "destination": [
                        "obj-v2-ratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-ratio",
                        0
                    ],
                    "destination": [
                        "obj-v2-ratiosig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-ratiosig",
                        0
                    ],
                    "destination": [
                        "obj-v2-sendratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-pfft",
                        0
                    ],
                    "destination": [
                        "obj-v2-fmteq",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-fmt",
                        0
                    ],
                    "destination": [
                        "obj-v2-fmtsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-fmtsig",
                        0
                    ],
                    "destination": [
                        "obj-v2-fmtwarpsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-fmtwarpsig",
                        0
                    ],
                    "destination": [
                        "obj-v2-fmteq",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-fmteq",
                        0
                    ],
                    "destination": [
                        "obj-v2-mult",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-gain",
                        0
                    ],
                    "destination": [
                        "obj-v2-dbtoa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-v2-mult",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-mult",
                        0
                    ],
                    "destination": [
                        "obj-v2-delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-dly",
                        0
                    ],
                    "destination": [
                        "obj-v2-dlysig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-dlysig",
                        0
                    ],
                    "destination": [
                        "obj-v2-ms2s",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-ms2s",
                        0
                    ],
                    "destination": [
                        "obj-v2-delay",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-pan",
                        0
                    ],
                    "destination": [
                        "obj-v2-ps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-ps",
                        0
                    ],
                    "destination": [
                        "obj-v2-phalf",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-phalf",
                        0
                    ],
                    "destination": [
                        "obj-v2-poff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-poff",
                        0
                    ],
                    "destination": [
                        "obj-v2-panR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-poff",
                        0
                    ],
                    "destination": [
                        "obj-v2-invp",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-invp",
                        0
                    ],
                    "destination": [
                        "obj-v2-panL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-delay",
                        0
                    ],
                    "destination": [
                        "obj-v2-panR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-delay",
                        0
                    ],
                    "destination": [
                        "obj-v2-panL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-semi",
                        0
                    ],
                    "destination": [
                        "obj-v3-ratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-ratio",
                        0
                    ],
                    "destination": [
                        "obj-v3-ratiosig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-ratiosig",
                        0
                    ],
                    "destination": [
                        "obj-v3-sendratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-pfft",
                        0
                    ],
                    "destination": [
                        "obj-v3-fmteq",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-fmt",
                        0
                    ],
                    "destination": [
                        "obj-v3-fmtsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-fmtsig",
                        0
                    ],
                    "destination": [
                        "obj-v3-fmtwarpsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-fmtwarpsig",
                        0
                    ],
                    "destination": [
                        "obj-v3-fmteq",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-fmteq",
                        0
                    ],
                    "destination": [
                        "obj-v3-mult",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-gain",
                        0
                    ],
                    "destination": [
                        "obj-v3-dbtoa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-v3-mult",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-mult",
                        0
                    ],
                    "destination": [
                        "obj-v3-delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-dly",
                        0
                    ],
                    "destination": [
                        "obj-v3-dlysig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-dlysig",
                        0
                    ],
                    "destination": [
                        "obj-v3-ms2s",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-ms2s",
                        0
                    ],
                    "destination": [
                        "obj-v3-delay",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-pan",
                        0
                    ],
                    "destination": [
                        "obj-v3-ps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-ps",
                        0
                    ],
                    "destination": [
                        "obj-v3-phalf",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-phalf",
                        0
                    ],
                    "destination": [
                        "obj-v3-poff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-poff",
                        0
                    ],
                    "destination": [
                        "obj-v3-panR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-poff",
                        0
                    ],
                    "destination": [
                        "obj-v3-invp",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-invp",
                        0
                    ],
                    "destination": [
                        "obj-v3-panL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-delay",
                        0
                    ],
                    "destination": [
                        "obj-v3-panR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-delay",
                        0
                    ],
                    "destination": [
                        "obj-v3-panL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-semi",
                        0
                    ],
                    "destination": [
                        "obj-v4-ratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-ratio",
                        0
                    ],
                    "destination": [
                        "obj-v4-ratiosig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-ratiosig",
                        0
                    ],
                    "destination": [
                        "obj-v4-sendratio",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-pfft",
                        0
                    ],
                    "destination": [
                        "obj-v4-fmteq",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-fmt",
                        0
                    ],
                    "destination": [
                        "obj-v4-fmtsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-fmtsig",
                        0
                    ],
                    "destination": [
                        "obj-v4-fmtwarpsig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-fmtwarpsig",
                        0
                    ],
                    "destination": [
                        "obj-v4-fmteq",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-fmteq",
                        0
                    ],
                    "destination": [
                        "obj-v4-mult",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-gain",
                        0
                    ],
                    "destination": [
                        "obj-v4-dbtoa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-v4-mult",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-mult",
                        0
                    ],
                    "destination": [
                        "obj-v4-delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-dly",
                        0
                    ],
                    "destination": [
                        "obj-v4-dlysig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-dlysig",
                        0
                    ],
                    "destination": [
                        "obj-v4-ms2s",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-ms2s",
                        0
                    ],
                    "destination": [
                        "obj-v4-delay",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-pan",
                        0
                    ],
                    "destination": [
                        "obj-v4-ps",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-ps",
                        0
                    ],
                    "destination": [
                        "obj-v4-phalf",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-phalf",
                        0
                    ],
                    "destination": [
                        "obj-v4-poff",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-poff",
                        0
                    ],
                    "destination": [
                        "obj-v4-panR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-poff",
                        0
                    ],
                    "destination": [
                        "obj-v4-invp",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-invp",
                        0
                    ],
                    "destination": [
                        "obj-v4-panL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-delay",
                        0
                    ],
                    "destination": [
                        "obj-v4-panR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-delay",
                        0
                    ],
                    "destination": [
                        "obj-v4-panL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-panL",
                        0
                    ],
                    "destination": [
                        "obj-sumL1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-panL",
                        0
                    ],
                    "destination": [
                        "obj-sumL1",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sumL1",
                        0
                    ],
                    "destination": [
                        "obj-sumL2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-panL",
                        0
                    ],
                    "destination": [
                        "obj-sumL2",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sumL2",
                        0
                    ],
                    "destination": [
                        "obj-sumL3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-panL",
                        0
                    ],
                    "destination": [
                        "obj-sumL3",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-panR",
                        0
                    ],
                    "destination": [
                        "obj-sumR1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-panR",
                        0
                    ],
                    "destination": [
                        "obj-sumR1",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sumR1",
                        0
                    ],
                    "destination": [
                        "obj-sumR2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-panR",
                        0
                    ],
                    "destination": [
                        "obj-sumR2",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sumR2",
                        0
                    ],
                    "destination": [
                        "obj-sumR3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-panR",
                        0
                    ],
                    "destination": [
                        "obj-sumR3",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sumL3",
                        0
                    ],
                    "destination": [
                        "obj-addDryL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dry-mult",
                        0
                    ],
                    "destination": [
                        "obj-addDryL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sumR3",
                        0
                    ],
                    "destination": [
                        "obj-addDryR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dry-mult",
                        0
                    ],
                    "destination": [
                        "obj-addDryR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dry-gain",
                        0
                    ],
                    "destination": [
                        "obj-dry-dbtoa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-dry-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-dry-mult",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-addDryL",
                        0
                    ],
                    "destination": [
                        "obj-masterL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-addDryR",
                        0
                    ],
                    "destination": [
                        "obj-masterR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-master-val",
                        0
                    ],
                    "destination": [
                        "obj-master-dbtoa",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-master-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-masterL",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-master-dbtoa",
                        0
                    ],
                    "destination": [
                        "obj-masterR",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-masterL",
                        0
                    ],
                    "destination": [
                        "obj-meterL",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-masterR",
                        0
                    ],
                    "destination": [
                        "obj-meterR",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-masterL",
                        0
                    ],
                    "destination": [
                        "obj-ezdac",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-masterR",
                        0
                    ],
                    "destination": [
                        "obj-ezdac",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-key-menu",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-scale-menu",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-adc",
                        0
                    ],
                    "destination": [
                        "obj-retune",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-retune",
                        1
                    ],
                    "destination": [
                        "obj-snap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-snap",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-kf-toggle",
                        0
                    ],
                    "destination": [
                        "obj-kf-prep",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-kf-prep",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-int",
                        1
                    ],
                    "destination": [
                        "obj-v1-prep",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-int",
                        1
                    ],
                    "destination": [
                        "obj-v2-prep",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-int",
                        1
                    ],
                    "destination": [
                        "obj-v3-prep",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-int",
                        1
                    ],
                    "destination": [
                        "obj-v4-prep",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v1-prep",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v2-prep",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v3-prep",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-v4-prep",
                        0
                    ],
                    "destination": [
                        "obj-harmony",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-harmony",
                        0
                    ],
                    "destination": [
                        "obj-route-presets",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-preset-woods",
                        0
                    ],
                    "destination": [
                        "obj-presets",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-preset-choir",
                        0
                    ],
                    "destination": [
                        "obj-presets",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-preset-shimmer",
                        0
                    ],
                    "destination": [
                        "obj-presets",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-preset-dark",
                        0
                    ],
                    "destination": [
                        "obj-presets",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-presets",
                        0
                    ],
                    "destination": [
                        "obj-route-presets",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        0
                    ],
                    "destination": [
                        "obj-v1-semi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        1
                    ],
                    "destination": [
                        "obj-v2-semi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        2
                    ],
                    "destination": [
                        "obj-v3-semi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        3
                    ],
                    "destination": [
                        "obj-v4-semi",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        4
                    ],
                    "destination": [
                        "obj-v1-fmt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        5
                    ],
                    "destination": [
                        "obj-v2-fmt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        6
                    ],
                    "destination": [
                        "obj-v3-fmt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        7
                    ],
                    "destination": [
                        "obj-v4-fmt",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        8
                    ],
                    "destination": [
                        "obj-v1-gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        9
                    ],
                    "destination": [
                        "obj-v2-gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        10
                    ],
                    "destination": [
                        "obj-v3-gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        11
                    ],
                    "destination": [
                        "obj-v4-gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        12
                    ],
                    "destination": [
                        "obj-v1-dly",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        13
                    ],
                    "destination": [
                        "obj-v2-dly",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        14
                    ],
                    "destination": [
                        "obj-v3-dly",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        15
                    ],
                    "destination": [
                        "obj-v4-dly",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        16
                    ],
                    "destination": [
                        "obj-v1-pan",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        17
                    ],
                    "destination": [
                        "obj-v2-pan",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        18
                    ],
                    "destination": [
                        "obj-v3-pan",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        19
                    ],
                    "destination": [
                        "obj-v4-pan",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-route-presets",
                        20
                    ],
                    "destination": [
                        "obj-dry-gain",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}