{
    "patcher": {
        "fileversion": 1,
        "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
        "classnamespace": "box",
        "rect": [ 50.0, 100.0, 700.0, 500.0 ],
        "boxes": [
            { "box": { "id": "title", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 20, 10, 600, 22 ], "text": "TEST: 1 voice pitch debug. Change semi, watch ratio, hear pitch change.", "fontsize": 13, "fontface": 1 } },

            { "box": { "id": "adc", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 30, 50, 45, 22 ], "text": "adc~ 1" } },

            { "box": { "id": "semi-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 30, 85, 180, 20 ], "text": "SEMITONES (-24 to 24):" } },
            { "box": { "id": "semi", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 30, 107, 60, 22 ], "minimum": -24.0, "maximum": 24.0 } },

            { "box": { "id": "expr1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 30, 142, 140, 22 ], "text": "expr pow(2.\\, $f1/12.)" } },

            { "box": { "id": "ratio-disp", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 30, 175, 80, 22 ] } },
            { "box": { "id": "ratio-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 120, 175, 300, 20 ], "text": "RATIO: 0=1.0  7=1.498  12=2.0  -12=0.5" } },

            { "box": { "id": "sig1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 30, 210, 32, 22 ], "text": "sig~" } },

            { "box": { "id": "send1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 30, 245, 110, 22 ], "text": "send~ sharm_r1" } },
            { "box": { "id": "send-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 150, 245, 300, 20 ], "text": "sends ratio signal to pfft~ subpatch" } },

            { "box": { "id": "pfft1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 30, 290, 200, 22 ], "text": "pfft~ spectral_voice_1 2048 4" } },
            { "box": { "id": "pfft-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 240, 290, 350, 20 ], "text": "spectral_voice_1 has: receive~ sharm_r1 -> gizmo~" } },

            { "box": { "id": "out-gain", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 30, 340, 50, 22 ], "text": "*~ 0.5" } },

            { "box": { "id": "out-meter", "maxclass": "meter~", "numinlets": 1, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 30, 375, 200, 14 ] } },

            { "box": { "id": "ezdac", "maxclass": "ezdac~", "numinlets": 2, "numoutlets": 0, "patching_rect": [ 100, 410, 45, 45 ] } },

            { "box": { "id": "dry-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 350, 50, 120, 20 ], "text": "DRY (comparison)" } },
            { "box": { "id": "dry-gain", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 350, 340, 50, 22 ], "text": "*~ 0.3" } },

            { "box": { "id": "inst1", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 30, 460, 650, 20 ], "text": "Turn on DSP. Type 7 in semi. Ratio shows 1.498. You should hear voice pitched UP a 5th." } }
        ],
        "lines": [
            { "patchline": { "source": [ "semi", 0 ], "destination": [ "expr1", 0 ] } },
            { "patchline": { "source": [ "expr1", 0 ], "destination": [ "ratio-disp", 0 ] } },
            { "patchline": { "source": [ "expr1", 0 ], "destination": [ "sig1", 0 ] } },
            { "patchline": { "source": [ "sig1", 0 ], "destination": [ "send1", 0 ] } },
            { "patchline": { "source": [ "adc", 0 ], "destination": [ "pfft1", 0 ] } },
            { "patchline": { "source": [ "pfft1", 0 ], "destination": [ "out-gain", 0 ] } },
            { "patchline": { "source": [ "out-gain", 0 ], "destination": [ "out-meter", 0 ] } },
            { "patchline": { "source": [ "out-gain", 0 ], "destination": [ "ezdac", 0 ] } },
            { "patchline": { "source": [ "out-gain", 0 ], "destination": [ "ezdac", 1 ] } },
            { "patchline": { "source": [ "adc", 0 ], "destination": [ "dry-gain", 0 ] } },
            { "patchline": { "source": [ "dry-gain", 0 ], "destination": [ "ezdac", 0 ] } },
            { "patchline": { "source": [ "dry-gain", 0 ], "destination": [ "ezdac", 1 ] } }
        ],
        "autosave": 0
    }
}