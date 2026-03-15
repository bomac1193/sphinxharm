{
    "patcher": {
        "fileversion": 1,
        "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
        "classnamespace": "box",
        "rect": [ 34.0, 80.0, 1350.0, 900.0 ],
        "boxes": [
            { "box": { "id": "obj-title", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 30.0, 10.0, 300.0, 20.0 ], "text": "SPHINXHARM — 4-voice stereo harmonizer" } },

            { "box": { "id": "obj-adc", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 40.0, 45.0, 22.0 ], "text": "adc~ 1" } },
            { "box": { "id": "obj-in-meter", "maxclass": "meter~", "numinlets": 1, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 110.0, 42.0, 80.0, 14.0 ] } },

            { "box": { "id": "obj-loadbang", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "bang" ], "patching_rect": [ 1050.0, 40.0, 58.0, 22.0 ], "text": "loadbang" } },
            { "box": { "id": "obj-init-pan", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 1050.0, 70.0, 18.0, 22.0 ], "text": "0" } },

            { "box": { "id": "obj-sig1", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 1050.0, 430.0, 42.0, 22.0 ], "text": "sig~ 1." } },

            { "box": { "id": "obj-v1-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 50.0, 70.0, 330.0, 20.0 ], "text": "V1: semi / formant / gain(dB) / delay(ms) / pan(-1..1)" } },
            { "box": { "id": "obj-v1-semi", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 50.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v1-fmt", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 105.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v1-gain", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 160.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v1-dly", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 215.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v1-pan", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 270.0, 90.0, 50.0, 22.0 ], "minimum": -1.0, "maximum": 1.0 } },
            { "box": { "id": "obj-v1-ss", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v1-fs", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 105.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v1-dbtoa", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 160.0, 120.0, 38.0, 22.0 ], "text": "dbtoa" } },
            { "box": { "id": "obj-v1-ds", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 215.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v1-ms", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 330.0, 120.0, 42.0, 22.0 ], "text": "sig~ 1" } },
            {
                "box": {
                    "id": "obj-v1-gen", "maxclass": "newobj", "numinlets": 5, "numoutlets": 1, "outlettype": [ "signal" ],
                    "patching_rect": [ 50.0, 150.0, 310.0, 22.0 ], "text": "gen~",
                    "patcher": {
                        "fileversion": 1, "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
                        "classnamespace": "dsp.gen", "rect": [ 100.0, 100.0, 500.0, 400.0 ],
                        "boxes": [
                            { "box": { "id": "i1", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 20.0, 30.0, 22.0 ], "text": "in 1" } },
                            { "box": { "id": "i2", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 90.0, 20.0, 30.0, 22.0 ], "text": "in 2" } },
                            { "box": { "id": "i3", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 160.0, 20.0, 30.0, 22.0 ], "text": "in 3" } },
                            { "box": { "id": "i4", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 230.0, 20.0, 30.0, 22.0 ], "text": "in 4" } },
                            { "box": { "id": "i5", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 300.0, 20.0, 30.0, 22.0 ], "text": "in 5" } },
                            { "box": { "id": "cb", "maxclass": "codebox", "numinlets": 5, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 55.0, 380.0, 270.0 ],
                                "code": "Param base_win(40, min=10, max=200);\nHistory ph1(0);\nHistory ph2(0.5);\nDelay d(96000);\nDelay vd(96000);\n\naudio = in1;\nst = in2;\nfmt = in3;\nmx = in4;\ndly_ms = in5;\n\nfmt_ratio = pow(2, fmt / 12.0);\neff_win = base_win / fmt_ratio;\neff_win = clamp(eff_win, 8, 200);\n\nratio = pow(2, st / 12.0);\nws = eff_win * samplerate / 1000.0;\nrt = (1.0 - ratio) / ws;\n\nph1 += rt;\nph2 += rt;\nph1 = wrap(ph1, 0, 1);\nph2 = wrap(ph2, 0, 1);\n\ndl1 = ph1 * ws;\ndl2 = ph2 * ws;\n\nw1 = sin(ph1 * 3.14159265);\nw1 = w1 * w1;\nw2 = sin(ph2 * 3.14159265);\nw2 = w2 * w2;\n\nd.write(audio);\ng1 = d.read(dl1);\ng2 = d.read(dl2);\n\nshifted = g1 * w1 + g2 * w2;\nmixed = audio * (1.0 - mx) + shifted * mx;\n\ndly_samps = clamp(dly_ms, 0, 2000) * samplerate / 1000.0;\nvd.write(mixed);\nout1 = vd.read(dly_samps);\n" } },
                            { "box": { "id": "o1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 20.0, 340.0, 35.0, 22.0 ], "text": "out 1" } }
                        ],
                        "lines": [
                            { "patchline": { "source": [ "i1", 0 ], "destination": [ "cb", 0 ] } },
                            { "patchline": { "source": [ "i2", 0 ], "destination": [ "cb", 1 ] } },
                            { "patchline": { "source": [ "i3", 0 ], "destination": [ "cb", 2 ] } },
                            { "patchline": { "source": [ "i4", 0 ], "destination": [ "cb", 3 ] } },
                            { "patchline": { "source": [ "i5", 0 ], "destination": [ "cb", 4 ] } },
                            { "patchline": { "source": [ "cb", 0 ], "destination": [ "o1", 0 ] } }
                        ], "autosave": 0
                    }
                }
            },
            { "box": { "id": "obj-v1-mult", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 180.0, 40.0, 22.0 ], "text": "*~ 1." } },
            { "box": { "id": "obj-v1-ps", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v1-phalf", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 145.0, 40.0, 22.0 ], "text": "*~ 0.5" } },
            { "box": { "id": "obj-v1-poff", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 170.0, 40.0, 22.0 ], "text": "+~ 0.5" } },
            { "box": { "id": "obj-v1-invp", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 195.0, 30.0, 22.0 ], "text": "-~" } },
            { "box": { "id": "obj-v1-panR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 220.0, 30.0, 22.0 ], "text": "*~" } },
            { "box": { "id": "obj-v1-panL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 150.0, 220.0, 30.0, 22.0 ], "text": "*~" } },

            { "box": { "id": "obj-v2-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 450.0, 70.0, 330.0, 20.0 ], "text": "V2: semi / formant / gain(dB) / delay(ms) / pan(-1..1)" } },
            { "box": { "id": "obj-v2-semi", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 450.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v2-fmt", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 505.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v2-gain", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 560.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v2-dly", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 615.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v2-pan", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 670.0, 90.0, 50.0, 22.0 ], "minimum": -1.0, "maximum": 1.0 } },
            { "box": { "id": "obj-v2-ss", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 450.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v2-fs", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 505.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v2-dbtoa", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 560.0, 120.0, 38.0, 22.0 ], "text": "dbtoa" } },
            { "box": { "id": "obj-v2-ds", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 615.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v2-ms", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 730.0, 120.0, 42.0, 22.0 ], "text": "sig~ 1" } },
            {
                "box": {
                    "id": "obj-v2-gen", "maxclass": "newobj", "numinlets": 5, "numoutlets": 1, "outlettype": [ "signal" ],
                    "patching_rect": [ 450.0, 150.0, 310.0, 22.0 ], "text": "gen~",
                    "patcher": {
                        "fileversion": 1, "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
                        "classnamespace": "dsp.gen", "rect": [ 100.0, 100.0, 500.0, 400.0 ],
                        "boxes": [
                            { "box": { "id": "i1", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 20.0, 30.0, 22.0 ], "text": "in 1" } },
                            { "box": { "id": "i2", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 90.0, 20.0, 30.0, 22.0 ], "text": "in 2" } },
                            { "box": { "id": "i3", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 160.0, 20.0, 30.0, 22.0 ], "text": "in 3" } },
                            { "box": { "id": "i4", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 230.0, 20.0, 30.0, 22.0 ], "text": "in 4" } },
                            { "box": { "id": "i5", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 300.0, 20.0, 30.0, 22.0 ], "text": "in 5" } },
                            { "box": { "id": "cb", "maxclass": "codebox", "numinlets": 5, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 55.0, 380.0, 270.0 ],
                                "code": "Param base_win(40, min=10, max=200);\nHistory ph1(0);\nHistory ph2(0.5);\nDelay d(96000);\nDelay vd(96000);\n\naudio = in1;\nst = in2;\nfmt = in3;\nmx = in4;\ndly_ms = in5;\n\nfmt_ratio = pow(2, fmt / 12.0);\neff_win = base_win / fmt_ratio;\neff_win = clamp(eff_win, 8, 200);\n\nratio = pow(2, st / 12.0);\nws = eff_win * samplerate / 1000.0;\nrt = (1.0 - ratio) / ws;\n\nph1 += rt;\nph2 += rt;\nph1 = wrap(ph1, 0, 1);\nph2 = wrap(ph2, 0, 1);\n\ndl1 = ph1 * ws;\ndl2 = ph2 * ws;\n\nw1 = sin(ph1 * 3.14159265);\nw1 = w1 * w1;\nw2 = sin(ph2 * 3.14159265);\nw2 = w2 * w2;\n\nd.write(audio);\ng1 = d.read(dl1);\ng2 = d.read(dl2);\n\nshifted = g1 * w1 + g2 * w2;\nmixed = audio * (1.0 - mx) + shifted * mx;\n\ndly_samps = clamp(dly_ms, 0, 2000) * samplerate / 1000.0;\nvd.write(mixed);\nout1 = vd.read(dly_samps);\n" } },
                            { "box": { "id": "o1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 20.0, 340.0, 35.0, 22.0 ], "text": "out 1" } }
                        ],
                        "lines": [
                            { "patchline": { "source": [ "i1", 0 ], "destination": [ "cb", 0 ] } },
                            { "patchline": { "source": [ "i2", 0 ], "destination": [ "cb", 1 ] } },
                            { "patchline": { "source": [ "i3", 0 ], "destination": [ "cb", 2 ] } },
                            { "patchline": { "source": [ "i4", 0 ], "destination": [ "cb", 3 ] } },
                            { "patchline": { "source": [ "i5", 0 ], "destination": [ "cb", 4 ] } },
                            { "patchline": { "source": [ "cb", 0 ], "destination": [ "o1", 0 ] } }
                        ], "autosave": 0
                    }
                }
            },
            { "box": { "id": "obj-v2-mult", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 450.0, 180.0, 40.0, 22.0 ], "text": "*~ 1." } },
            { "box": { "id": "obj-v2-ps", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 120.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v2-phalf", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 145.0, 40.0, 22.0 ], "text": "*~ 0.5" } },
            { "box": { "id": "obj-v2-poff", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 170.0, 40.0, 22.0 ], "text": "+~ 0.5" } },
            { "box": { "id": "obj-v2-invp", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 195.0, 30.0, 22.0 ], "text": "-~" } },
            { "box": { "id": "obj-v2-panR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 450.0, 220.0, 30.0, 22.0 ], "text": "*~" } },
            { "box": { "id": "obj-v2-panL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 550.0, 220.0, 30.0, 22.0 ], "text": "*~" } },

            { "box": { "id": "obj-v3-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 50.0, 250.0, 330.0, 20.0 ], "text": "V3: semi / formant / gain(dB) / delay(ms) / pan(-1..1)" } },
            { "box": { "id": "obj-v3-semi", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 50.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v3-fmt", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 105.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v3-gain", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 160.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v3-dly", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 215.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v3-pan", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 270.0, 270.0, 50.0, 22.0 ], "minimum": -1.0, "maximum": 1.0 } },
            { "box": { "id": "obj-v3-ss", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v3-fs", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 105.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v3-dbtoa", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 160.0, 300.0, 38.0, 22.0 ], "text": "dbtoa" } },
            { "box": { "id": "obj-v3-ds", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 215.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v3-ms", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 330.0, 300.0, 42.0, 22.0 ], "text": "sig~ 1" } },
            {
                "box": {
                    "id": "obj-v3-gen", "maxclass": "newobj", "numinlets": 5, "numoutlets": 1, "outlettype": [ "signal" ],
                    "patching_rect": [ 50.0, 330.0, 310.0, 22.0 ], "text": "gen~",
                    "patcher": {
                        "fileversion": 1, "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
                        "classnamespace": "dsp.gen", "rect": [ 100.0, 100.0, 500.0, 400.0 ],
                        "boxes": [
                            { "box": { "id": "i1", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 20.0, 30.0, 22.0 ], "text": "in 1" } },
                            { "box": { "id": "i2", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 90.0, 20.0, 30.0, 22.0 ], "text": "in 2" } },
                            { "box": { "id": "i3", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 160.0, 20.0, 30.0, 22.0 ], "text": "in 3" } },
                            { "box": { "id": "i4", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 230.0, 20.0, 30.0, 22.0 ], "text": "in 4" } },
                            { "box": { "id": "i5", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 300.0, 20.0, 30.0, 22.0 ], "text": "in 5" } },
                            { "box": { "id": "cb", "maxclass": "codebox", "numinlets": 5, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 55.0, 380.0, 270.0 ],
                                "code": "Param base_win(40, min=10, max=200);\nHistory ph1(0);\nHistory ph2(0.5);\nDelay d(96000);\nDelay vd(96000);\n\naudio = in1;\nst = in2;\nfmt = in3;\nmx = in4;\ndly_ms = in5;\n\nfmt_ratio = pow(2, fmt / 12.0);\neff_win = base_win / fmt_ratio;\neff_win = clamp(eff_win, 8, 200);\n\nratio = pow(2, st / 12.0);\nws = eff_win * samplerate / 1000.0;\nrt = (1.0 - ratio) / ws;\n\nph1 += rt;\nph2 += rt;\nph1 = wrap(ph1, 0, 1);\nph2 = wrap(ph2, 0, 1);\n\ndl1 = ph1 * ws;\ndl2 = ph2 * ws;\n\nw1 = sin(ph1 * 3.14159265);\nw1 = w1 * w1;\nw2 = sin(ph2 * 3.14159265);\nw2 = w2 * w2;\n\nd.write(audio);\ng1 = d.read(dl1);\ng2 = d.read(dl2);\n\nshifted = g1 * w1 + g2 * w2;\nmixed = audio * (1.0 - mx) + shifted * mx;\n\ndly_samps = clamp(dly_ms, 0, 2000) * samplerate / 1000.0;\nvd.write(mixed);\nout1 = vd.read(dly_samps);\n" } },
                            { "box": { "id": "o1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 20.0, 340.0, 35.0, 22.0 ], "text": "out 1" } }
                        ],
                        "lines": [
                            { "patchline": { "source": [ "i1", 0 ], "destination": [ "cb", 0 ] } },
                            { "patchline": { "source": [ "i2", 0 ], "destination": [ "cb", 1 ] } },
                            { "patchline": { "source": [ "i3", 0 ], "destination": [ "cb", 2 ] } },
                            { "patchline": { "source": [ "i4", 0 ], "destination": [ "cb", 3 ] } },
                            { "patchline": { "source": [ "i5", 0 ], "destination": [ "cb", 4 ] } },
                            { "patchline": { "source": [ "cb", 0 ], "destination": [ "o1", 0 ] } }
                        ], "autosave": 0
                    }
                }
            },
            { "box": { "id": "obj-v3-mult", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 360.0, 40.0, 22.0 ], "text": "*~ 1." } },
            { "box": { "id": "obj-v3-ps", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v3-phalf", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 325.0, 40.0, 22.0 ], "text": "*~ 0.5" } },
            { "box": { "id": "obj-v3-poff", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 350.0, 40.0, 22.0 ], "text": "+~ 0.5" } },
            { "box": { "id": "obj-v3-invp", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 270.0, 375.0, 30.0, 22.0 ], "text": "-~" } },
            { "box": { "id": "obj-v3-panR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 50.0, 400.0, 30.0, 22.0 ], "text": "*~" } },
            { "box": { "id": "obj-v3-panL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 150.0, 400.0, 30.0, 22.0 ], "text": "*~" } },

            { "box": { "id": "obj-v4-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 450.0, 250.0, 330.0, 20.0 ], "text": "V4: semi / formant / gain(dB) / delay(ms) / pan(-1..1)" } },
            { "box": { "id": "obj-v4-semi", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 450.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v4-fmt", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 505.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v4-gain", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 560.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v4-dly", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 615.0, 270.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-v4-pan", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 670.0, 270.0, 50.0, 22.0 ], "minimum": -1.0, "maximum": 1.0 } },
            { "box": { "id": "obj-v4-ss", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 450.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v4-fs", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 505.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v4-dbtoa", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 560.0, 300.0, 38.0, 22.0 ], "text": "dbtoa" } },
            { "box": { "id": "obj-v4-ds", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 615.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v4-ms", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 730.0, 300.0, 42.0, 22.0 ], "text": "sig~ 1" } },
            {
                "box": {
                    "id": "obj-v4-gen", "maxclass": "newobj", "numinlets": 5, "numoutlets": 1, "outlettype": [ "signal" ],
                    "patching_rect": [ 450.0, 330.0, 310.0, 22.0 ], "text": "gen~",
                    "patcher": {
                        "fileversion": 1, "appversion": { "major": 9, "minor": 1, "revision": 0, "architecture": "x64", "modernui": 1 },
                        "classnamespace": "dsp.gen", "rect": [ 100.0, 100.0, 500.0, 400.0 ],
                        "boxes": [
                            { "box": { "id": "i1", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 20.0, 30.0, 22.0 ], "text": "in 1" } },
                            { "box": { "id": "i2", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 90.0, 20.0, 30.0, 22.0 ], "text": "in 2" } },
                            { "box": { "id": "i3", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 160.0, 20.0, 30.0, 22.0 ], "text": "in 3" } },
                            { "box": { "id": "i4", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 230.0, 20.0, 30.0, 22.0 ], "text": "in 4" } },
                            { "box": { "id": "i5", "maxclass": "newobj", "numinlets": 0, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 300.0, 20.0, 30.0, 22.0 ], "text": "in 5" } },
                            { "box": { "id": "cb", "maxclass": "codebox", "numinlets": 5, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 20.0, 55.0, 380.0, 270.0 ],
                                "code": "Param base_win(40, min=10, max=200);\nHistory ph1(0);\nHistory ph2(0.5);\nDelay d(96000);\nDelay vd(96000);\n\naudio = in1;\nst = in2;\nfmt = in3;\nmx = in4;\ndly_ms = in5;\n\nfmt_ratio = pow(2, fmt / 12.0);\neff_win = base_win / fmt_ratio;\neff_win = clamp(eff_win, 8, 200);\n\nratio = pow(2, st / 12.0);\nws = eff_win * samplerate / 1000.0;\nrt = (1.0 - ratio) / ws;\n\nph1 += rt;\nph2 += rt;\nph1 = wrap(ph1, 0, 1);\nph2 = wrap(ph2, 0, 1);\n\ndl1 = ph1 * ws;\ndl2 = ph2 * ws;\n\nw1 = sin(ph1 * 3.14159265);\nw1 = w1 * w1;\nw2 = sin(ph2 * 3.14159265);\nw2 = w2 * w2;\n\nd.write(audio);\ng1 = d.read(dl1);\ng2 = d.read(dl2);\n\nshifted = g1 * w1 + g2 * w2;\nmixed = audio * (1.0 - mx) + shifted * mx;\n\ndly_samps = clamp(dly_ms, 0, 2000) * samplerate / 1000.0;\nvd.write(mixed);\nout1 = vd.read(dly_samps);\n" } },
                            { "box": { "id": "o1", "maxclass": "newobj", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 20.0, 340.0, 35.0, 22.0 ], "text": "out 1" } }
                        ],
                        "lines": [
                            { "patchline": { "source": [ "i1", 0 ], "destination": [ "cb", 0 ] } },
                            { "patchline": { "source": [ "i2", 0 ], "destination": [ "cb", 1 ] } },
                            { "patchline": { "source": [ "i3", 0 ], "destination": [ "cb", 2 ] } },
                            { "patchline": { "source": [ "i4", 0 ], "destination": [ "cb", 3 ] } },
                            { "patchline": { "source": [ "i5", 0 ], "destination": [ "cb", 4 ] } },
                            { "patchline": { "source": [ "cb", 0 ], "destination": [ "o1", 0 ] } }
                        ], "autosave": 0
                    }
                }
            },
            { "box": { "id": "obj-v4-mult", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 450.0, 360.0, 40.0, 22.0 ], "text": "*~ 1." } },
            { "box": { "id": "obj-v4-ps", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 300.0, 32.0, 22.0 ], "text": "sig~" } },
            { "box": { "id": "obj-v4-phalf", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 325.0, 40.0, 22.0 ], "text": "*~ 0.5" } },
            { "box": { "id": "obj-v4-poff", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 350.0, 40.0, 22.0 ], "text": "+~ 0.5" } },
            { "box": { "id": "obj-v4-invp", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 670.0, 375.0, 30.0, 22.0 ], "text": "-~" } },
            { "box": { "id": "obj-v4-panR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 450.0, 400.0, 30.0, 22.0 ], "text": "*~" } },
            { "box": { "id": "obj-v4-panL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 550.0, 400.0, 30.0, 22.0 ], "text": "*~" } },

            { "box": { "id": "obj-dry-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 900.0, 70.0, 90.0, 20.0 ], "text": "DRY gain(dB)" } },
            { "box": { "id": "obj-dry-gain", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 900.0, 90.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-dry-dbtoa", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 900.0, 120.0, 38.0, 22.0 ], "text": "dbtoa" } },
            { "box": { "id": "obj-dry-mult", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 900.0, 150.0, 40.0, 22.0 ], "text": "*~ 1." } },

            { "box": { "id": "obj-master-lbl", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 900.0, 190.0, 80.0, 20.0 ], "text": "MASTER(dB)" } },
            { "box": { "id": "obj-master-val", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": [ "", "bang" ], "patching_rect": [ 900.0, 210.0, 50.0, 22.0 ] } },
            { "box": { "id": "obj-master-dbtoa", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": [ "" ], "patching_rect": [ 900.0, 240.0, 38.0, 22.0 ], "text": "dbtoa" } },

            { "box": { "id": "obj-lbl-left", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 200.0, 445.0, 40.0, 20.0 ], "text": "LEFT" } },
            { "box": { "id": "obj-lbl-right", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 350.0, 445.0, 40.0, 20.0 ], "text": "RIGHT" } },

            { "box": { "id": "obj-sumL1", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 200.0, 460.0, 30.0, 22.0 ], "text": "+~" } },
            { "box": { "id": "obj-sumL2", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 200.0, 490.0, 30.0, 22.0 ], "text": "+~" } },
            { "box": { "id": "obj-sumL3", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 200.0, 520.0, 30.0, 22.0 ], "text": "+~" } },
            { "box": { "id": "obj-sumR1", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 350.0, 460.0, 30.0, 22.0 ], "text": "+~" } },
            { "box": { "id": "obj-sumR2", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 350.0, 490.0, 30.0, 22.0 ], "text": "+~" } },
            { "box": { "id": "obj-sumR3", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 350.0, 520.0, 30.0, 22.0 ], "text": "+~" } },

            { "box": { "id": "obj-addDryL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 200.0, 560.0, 30.0, 22.0 ], "text": "+~" } },
            { "box": { "id": "obj-addDryR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 350.0, 560.0, 30.0, 22.0 ], "text": "+~" } },

            { "box": { "id": "obj-masterL", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 200.0, 600.0, 40.0, 22.0 ], "text": "*~ 1." } },
            { "box": { "id": "obj-masterR", "maxclass": "newobj", "numinlets": 2, "numoutlets": 1, "outlettype": [ "signal" ], "patching_rect": [ 350.0, 600.0, 40.0, 22.0 ], "text": "*~ 1." } },

            { "box": { "id": "obj-meterL", "maxclass": "meter~", "numinlets": 1, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 200.0, 640.0, 80.0, 14.0 ] } },
            { "box": { "id": "obj-meterR", "maxclass": "meter~", "numinlets": 1, "numoutlets": 1, "outlettype": [ "float" ], "patching_rect": [ 350.0, 640.0, 80.0, 14.0 ] } },

            { "box": { "id": "obj-ezdac", "maxclass": "ezdac~", "numinlets": 2, "numoutlets": 0, "patching_rect": [ 260.0, 670.0, 45.0, 45.0 ] } },

            { "box": { "id": "obj-info", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 900.0, 300.0, 350.0, 20.0 ], "text": "Semi: +4=maj3 +7=5th +12=oct -12=oct dn" } },
            { "box": { "id": "obj-info2", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 900.0, 320.0, 350.0, 20.0 ], "text": "Formant: -=deeper +=brighter (shifts grain size)" } },
            { "box": { "id": "obj-info3", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 900.0, 340.0, 350.0, 20.0 ], "text": "Pan: -1=left 0=center 1=right (STEREO)" } },
            { "box": { "id": "obj-info4", "maxclass": "comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [ 900.0, 360.0, 350.0, 20.0 ], "text": "Delay: ms (0-2000)" } }
        ],
        "lines": [
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-in-meter", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-v1-gen", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-v2-gen", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-v3-gen", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-v4-gen", 0 ] } },
            { "patchline": { "source": [ "obj-adc", 0 ], "destination": [ "obj-dry-mult", 0 ] } },

            { "patchline": { "source": [ "obj-loadbang", 0 ], "destination": [ "obj-init-pan", 0 ] } },
            { "patchline": { "source": [ "obj-init-pan", 0 ], "destination": [ "obj-v1-pan", 0 ] } },
            { "patchline": { "source": [ "obj-init-pan", 0 ], "destination": [ "obj-v2-pan", 0 ] } },
            { "patchline": { "source": [ "obj-init-pan", 0 ], "destination": [ "obj-v3-pan", 0 ] } },
            { "patchline": { "source": [ "obj-init-pan", 0 ], "destination": [ "obj-v4-pan", 0 ] } },

            { "patchline": { "source": [ "obj-v1-semi", 0 ], "destination": [ "obj-v1-ss", 0 ] } },
            { "patchline": { "source": [ "obj-v1-ss", 0 ], "destination": [ "obj-v1-gen", 1 ] } },
            { "patchline": { "source": [ "obj-v1-fmt", 0 ], "destination": [ "obj-v1-fs", 0 ] } },
            { "patchline": { "source": [ "obj-v1-fs", 0 ], "destination": [ "obj-v1-gen", 2 ] } },
            { "patchline": { "source": [ "obj-v1-ms", 0 ], "destination": [ "obj-v1-gen", 3 ] } },
            { "patchline": { "source": [ "obj-v1-dly", 0 ], "destination": [ "obj-v1-ds", 0 ] } },
            { "patchline": { "source": [ "obj-v1-ds", 0 ], "destination": [ "obj-v1-gen", 4 ] } },
            { "patchline": { "source": [ "obj-v1-gen", 0 ], "destination": [ "obj-v1-mult", 0 ] } },
            { "patchline": { "source": [ "obj-v1-gain", 0 ], "destination": [ "obj-v1-dbtoa", 0 ] } },
            { "patchline": { "source": [ "obj-v1-dbtoa", 0 ], "destination": [ "obj-v1-mult", 1 ] } },
            { "patchline": { "source": [ "obj-v1-pan", 0 ], "destination": [ "obj-v1-ps", 0 ] } },
            { "patchline": { "source": [ "obj-v1-ps", 0 ], "destination": [ "obj-v1-phalf", 0 ] } },
            { "patchline": { "source": [ "obj-v1-phalf", 0 ], "destination": [ "obj-v1-poff", 0 ] } },
            { "patchline": { "source": [ "obj-v1-poff", 0 ], "destination": [ "obj-v1-panR", 1 ] } },
            { "patchline": { "source": [ "obj-sig1", 0 ], "destination": [ "obj-v1-invp", 0 ] } },
            { "patchline": { "source": [ "obj-v1-poff", 0 ], "destination": [ "obj-v1-invp", 1 ] } },
            { "patchline": { "source": [ "obj-v1-invp", 0 ], "destination": [ "obj-v1-panL", 1 ] } },
            { "patchline": { "source": [ "obj-v1-mult", 0 ], "destination": [ "obj-v1-panR", 0 ] } },
            { "patchline": { "source": [ "obj-v1-mult", 0 ], "destination": [ "obj-v1-panL", 0 ] } },

            { "patchline": { "source": [ "obj-v2-semi", 0 ], "destination": [ "obj-v2-ss", 0 ] } },
            { "patchline": { "source": [ "obj-v2-ss", 0 ], "destination": [ "obj-v2-gen", 1 ] } },
            { "patchline": { "source": [ "obj-v2-fmt", 0 ], "destination": [ "obj-v2-fs", 0 ] } },
            { "patchline": { "source": [ "obj-v2-fs", 0 ], "destination": [ "obj-v2-gen", 2 ] } },
            { "patchline": { "source": [ "obj-v2-ms", 0 ], "destination": [ "obj-v2-gen", 3 ] } },
            { "patchline": { "source": [ "obj-v2-dly", 0 ], "destination": [ "obj-v2-ds", 0 ] } },
            { "patchline": { "source": [ "obj-v2-ds", 0 ], "destination": [ "obj-v2-gen", 4 ] } },
            { "patchline": { "source": [ "obj-v2-gen", 0 ], "destination": [ "obj-v2-mult", 0 ] } },
            { "patchline": { "source": [ "obj-v2-gain", 0 ], "destination": [ "obj-v2-dbtoa", 0 ] } },
            { "patchline": { "source": [ "obj-v2-dbtoa", 0 ], "destination": [ "obj-v2-mult", 1 ] } },
            { "patchline": { "source": [ "obj-v2-pan", 0 ], "destination": [ "obj-v2-ps", 0 ] } },
            { "patchline": { "source": [ "obj-v2-ps", 0 ], "destination": [ "obj-v2-phalf", 0 ] } },
            { "patchline": { "source": [ "obj-v2-phalf", 0 ], "destination": [ "obj-v2-poff", 0 ] } },
            { "patchline": { "source": [ "obj-v2-poff", 0 ], "destination": [ "obj-v2-panR", 1 ] } },
            { "patchline": { "source": [ "obj-sig1", 0 ], "destination": [ "obj-v2-invp", 0 ] } },
            { "patchline": { "source": [ "obj-v2-poff", 0 ], "destination": [ "obj-v2-invp", 1 ] } },
            { "patchline": { "source": [ "obj-v2-invp", 0 ], "destination": [ "obj-v2-panL", 1 ] } },
            { "patchline": { "source": [ "obj-v2-mult", 0 ], "destination": [ "obj-v2-panR", 0 ] } },
            { "patchline": { "source": [ "obj-v2-mult", 0 ], "destination": [ "obj-v2-panL", 0 ] } },

            { "patchline": { "source": [ "obj-v3-semi", 0 ], "destination": [ "obj-v3-ss", 0 ] } },
            { "patchline": { "source": [ "obj-v3-ss", 0 ], "destination": [ "obj-v3-gen", 1 ] } },
            { "patchline": { "source": [ "obj-v3-fmt", 0 ], "destination": [ "obj-v3-fs", 0 ] } },
            { "patchline": { "source": [ "obj-v3-fs", 0 ], "destination": [ "obj-v3-gen", 2 ] } },
            { "patchline": { "source": [ "obj-v3-ms", 0 ], "destination": [ "obj-v3-gen", 3 ] } },
            { "patchline": { "source": [ "obj-v3-dly", 0 ], "destination": [ "obj-v3-ds", 0 ] } },
            { "patchline": { "source": [ "obj-v3-ds", 0 ], "destination": [ "obj-v3-gen", 4 ] } },
            { "patchline": { "source": [ "obj-v3-gen", 0 ], "destination": [ "obj-v3-mult", 0 ] } },
            { "patchline": { "source": [ "obj-v3-gain", 0 ], "destination": [ "obj-v3-dbtoa", 0 ] } },
            { "patchline": { "source": [ "obj-v3-dbtoa", 0 ], "destination": [ "obj-v3-mult", 1 ] } },
            { "patchline": { "source": [ "obj-v3-pan", 0 ], "destination": [ "obj-v3-ps", 0 ] } },
            { "patchline": { "source": [ "obj-v3-ps", 0 ], "destination": [ "obj-v3-phalf", 0 ] } },
            { "patchline": { "source": [ "obj-v3-phalf", 0 ], "destination": [ "obj-v3-poff", 0 ] } },
            { "patchline": { "source": [ "obj-v3-poff", 0 ], "destination": [ "obj-v3-panR", 1 ] } },
            { "patchline": { "source": [ "obj-sig1", 0 ], "destination": [ "obj-v3-invp", 0 ] } },
            { "patchline": { "source": [ "obj-v3-poff", 0 ], "destination": [ "obj-v3-invp", 1 ] } },
            { "patchline": { "source": [ "obj-v3-invp", 0 ], "destination": [ "obj-v3-panL", 1 ] } },
            { "patchline": { "source": [ "obj-v3-mult", 0 ], "destination": [ "obj-v3-panR", 0 ] } },
            { "patchline": { "source": [ "obj-v3-mult", 0 ], "destination": [ "obj-v3-panL", 0 ] } },

            { "patchline": { "source": [ "obj-v4-semi", 0 ], "destination": [ "obj-v4-ss", 0 ] } },
            { "patchline": { "source": [ "obj-v4-ss", 0 ], "destination": [ "obj-v4-gen", 1 ] } },
            { "patchline": { "source": [ "obj-v4-fmt", 0 ], "destination": [ "obj-v4-fs", 0 ] } },
            { "patchline": { "source": [ "obj-v4-fs", 0 ], "destination": [ "obj-v4-gen", 2 ] } },
            { "patchline": { "source": [ "obj-v4-ms", 0 ], "destination": [ "obj-v4-gen", 3 ] } },
            { "patchline": { "source": [ "obj-v4-dly", 0 ], "destination": [ "obj-v4-ds", 0 ] } },
            { "patchline": { "source": [ "obj-v4-ds", 0 ], "destination": [ "obj-v4-gen", 4 ] } },
            { "patchline": { "source": [ "obj-v4-gen", 0 ], "destination": [ "obj-v4-mult", 0 ] } },
            { "patchline": { "source": [ "obj-v4-gain", 0 ], "destination": [ "obj-v4-dbtoa", 0 ] } },
            { "patchline": { "source": [ "obj-v4-dbtoa", 0 ], "destination": [ "obj-v4-mult", 1 ] } },
            { "patchline": { "source": [ "obj-v4-pan", 0 ], "destination": [ "obj-v4-ps", 0 ] } },
            { "patchline": { "source": [ "obj-v4-ps", 0 ], "destination": [ "obj-v4-phalf", 0 ] } },
            { "patchline": { "source": [ "obj-v4-phalf", 0 ], "destination": [ "obj-v4-poff", 0 ] } },
            { "patchline": { "source": [ "obj-v4-poff", 0 ], "destination": [ "obj-v4-panR", 1 ] } },
            { "patchline": { "source": [ "obj-sig1", 0 ], "destination": [ "obj-v4-invp", 0 ] } },
            { "patchline": { "source": [ "obj-v4-poff", 0 ], "destination": [ "obj-v4-invp", 1 ] } },
            { "patchline": { "source": [ "obj-v4-invp", 0 ], "destination": [ "obj-v4-panL", 1 ] } },
            { "patchline": { "source": [ "obj-v4-mult", 0 ], "destination": [ "obj-v4-panR", 0 ] } },
            { "patchline": { "source": [ "obj-v4-mult", 0 ], "destination": [ "obj-v4-panL", 0 ] } },

            { "patchline": { "source": [ "obj-v1-panL", 0 ], "destination": [ "obj-sumL1", 0 ] } },
            { "patchline": { "source": [ "obj-v2-panL", 0 ], "destination": [ "obj-sumL1", 1 ] } },
            { "patchline": { "source": [ "obj-sumL1", 0 ], "destination": [ "obj-sumL2", 0 ] } },
            { "patchline": { "source": [ "obj-v3-panL", 0 ], "destination": [ "obj-sumL2", 1 ] } },
            { "patchline": { "source": [ "obj-sumL2", 0 ], "destination": [ "obj-sumL3", 0 ] } },
            { "patchline": { "source": [ "obj-v4-panL", 0 ], "destination": [ "obj-sumL3", 1 ] } },

            { "patchline": { "source": [ "obj-v1-panR", 0 ], "destination": [ "obj-sumR1", 0 ] } },
            { "patchline": { "source": [ "obj-v2-panR", 0 ], "destination": [ "obj-sumR1", 1 ] } },
            { "patchline": { "source": [ "obj-sumR1", 0 ], "destination": [ "obj-sumR2", 0 ] } },
            { "patchline": { "source": [ "obj-v3-panR", 0 ], "destination": [ "obj-sumR2", 1 ] } },
            { "patchline": { "source": [ "obj-sumR2", 0 ], "destination": [ "obj-sumR3", 0 ] } },
            { "patchline": { "source": [ "obj-v4-panR", 0 ], "destination": [ "obj-sumR3", 1 ] } },

            { "patchline": { "source": [ "obj-sumL3", 0 ], "destination": [ "obj-addDryL", 0 ] } },
            { "patchline": { "source": [ "obj-dry-mult", 0 ], "destination": [ "obj-addDryL", 1 ] } },
            { "patchline": { "source": [ "obj-sumR3", 0 ], "destination": [ "obj-addDryR", 0 ] } },
            { "patchline": { "source": [ "obj-dry-mult", 0 ], "destination": [ "obj-addDryR", 1 ] } },

            { "patchline": { "source": [ "obj-dry-gain", 0 ], "destination": [ "obj-dry-dbtoa", 0 ] } },
            { "patchline": { "source": [ "obj-dry-dbtoa", 0 ], "destination": [ "obj-dry-mult", 1 ] } },

            { "patchline": { "source": [ "obj-addDryL", 0 ], "destination": [ "obj-masterL", 0 ] } },
            { "patchline": { "source": [ "obj-addDryR", 0 ], "destination": [ "obj-masterR", 0 ] } },
            { "patchline": { "source": [ "obj-master-val", 0 ], "destination": [ "obj-master-dbtoa", 0 ] } },
            { "patchline": { "source": [ "obj-master-dbtoa", 0 ], "destination": [ "obj-masterL", 1 ] } },
            { "patchline": { "source": [ "obj-master-dbtoa", 0 ], "destination": [ "obj-masterR", 1 ] } },

            { "patchline": { "source": [ "obj-masterL", 0 ], "destination": [ "obj-meterL", 0 ] } },
            { "patchline": { "source": [ "obj-masterR", 0 ], "destination": [ "obj-meterR", 0 ] } },
            { "patchline": { "source": [ "obj-masterL", 0 ], "destination": [ "obj-ezdac", 0 ] } },
            { "patchline": { "source": [ "obj-masterR", 0 ], "destination": [ "obj-ezdac", 1 ] } }
        ],
        "autosave": 0
    }
}