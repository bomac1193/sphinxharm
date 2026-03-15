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
        "rect": [ 200.0, 200.0, 500.0, 500.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 10.0, 400.0, 20.0 ],
                    "text": "MIC FINDER — click speaker then talk. Which meter moves?"
                }
            },
            {
                "box": {
                    "id": "obj-open-audio",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 40.0, 130.0, 22.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "obj-adstatus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "int" ],
                    "patching_rect": [ 300.0, 65.0, 80.0, 22.0 ],
                    "text": "adstatus"
                }
            },
            {
                "box": {
                    "id": "obj-adc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 30.0, 70.0, 250.0, 22.0 ],
                    "text": "adc~ 1 2 3 4 5 6 7 8"
                }
            },
            {
                "box": {
                    "id": "obj-lbl1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 100.0, 40.0, 20.0 ],
                    "text": "ch 1"
                }
            },
            {
                "box": {
                    "id": "obj-m1",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 100.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 130.0, 40.0, 20.0 ],
                    "text": "ch 2"
                }
            },
            {
                "box": {
                    "id": "obj-m2",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 130.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 160.0, 40.0, 20.0 ],
                    "text": "ch 3"
                }
            },
            {
                "box": {
                    "id": "obj-m3",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 160.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 190.0, 40.0, 20.0 ],
                    "text": "ch 4"
                }
            },
            {
                "box": {
                    "id": "obj-m4",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 190.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 220.0, 40.0, 20.0 ],
                    "text": "ch 5"
                }
            },
            {
                "box": {
                    "id": "obj-m5",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 220.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 250.0, 40.0, 20.0 ],
                    "text": "ch 6"
                }
            },
            {
                "box": {
                    "id": "obj-m6",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 250.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 280.0, 40.0, 20.0 ],
                    "text": "ch 7"
                }
            },
            {
                "box": {
                    "id": "obj-m7",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 280.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 310.0, 40.0, 20.0 ],
                    "text": "ch 8"
                }
            },
            {
                "box": {
                    "id": "obj-m8",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 70.0, 310.0, 150.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 370.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-note",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 90.0, 380.0, 350.0, 20.0 ],
                    "text": "Click 'open' above to check Audio Settings / driver"
                }
            }
        ],
        "lines": [
            { "patchline": { "source": [ "obj-open-audio", 0 ], "destination": [ "obj-adstatus", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-m1", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 1 ], "destination": [ "obj-m2", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 2 ], "destination": [ "obj-m3", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 3 ], "destination": [ "obj-m4", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 4 ], "destination": [ "obj-m5", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 5 ], "destination": [ "obj-m6", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 6 ], "destination": [ "obj-m7", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 7 ], "destination": [ "obj-m8", 0 ] } }
        ],
        "autosave": 0
    }
}
