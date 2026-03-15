{
    "patcher": {
        "fileversion": 1,
        "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
        "classnamespace": "box",
        "rect": [ 150.0, 150.0, 500.0, 350.0 ],
        "boxes": [
            { "box": { "id": "obj-title", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 20.0, 10.0, 460.0, 20.0 ], "text": "pfft~ sub-patch: gizmo~ pitch shift. Ratio via receive~ sharm_r#3" } },

            { "box": { "id": "obj-fftin", "maxclass": "newobj", "numinlets": 1, "numoutlets": 3, "outlettype": [ "signal", "signal", "signal" ], "patching_rect": [ 40.0, 60.0, 80.0, 22.0 ], "text": "fftin~ 1" } },

            { "box": { "id": "obj-ratio", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 200.0, 60.0, 120.0, 22.0 ], "text": "receive~ sharm_r#3" } },

            { "box": { "id": "obj-gizmo", "maxclass": "newobj", "numinlets": 2, "numoutlets": 2, "outlettype": [ "signal", "signal" ], "patching_rect": [ 40.0, 140.0, 80.0, 22.0 ], "text": "gizmo~" } },

            { "box": { "id": "obj-fftout", "maxclass": "newobj", "numinlets": 2, "numoutlets": 0, "patching_rect": [ 40.0, 220.0, 80.0, 22.0 ], "text": "fftout~ 1" } },

            { "box": { "id": "obj-n1", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 200.0, 100.0, 300.0, 20.0 ], "text": "#3 = voice number (1-4). #1=fftsize, #2=overlap" } },
            { "box": { "id": "obj-n2", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 140.0, 140.0, 300.0, 20.0 ], "text": "gizmo~ shifts all FFT bins by ratio" } }
        ],
        "lines": [
            { "patchline": { "source": [ "obj-fftin", 0 ], "destination": [ "obj-gizmo", 0 ] } },
            { "patchline": { "source": [ "obj-ratio", 0 ], "destination": [ "obj-gizmo", 1 ] } },
            { "patchline": { "source": [ "obj-gizmo", 0 ], "destination": [ "obj-fftout", 0 ] } },
            { "patchline": { "source": [ "obj-gizmo", 1 ], "destination": [ "obj-fftout", 1 ] } }
        ],
        "autosave": 0
    }
}
