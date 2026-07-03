{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 100.0, 100.0, 891.0, 620.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 161.0, 26.0, 60.0, 22.0 ],
                    "text": "saw~ 250"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-6",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 152.0, 50.0, 23.0 ]
                }
            },
            {
                "box": {
                    "disabled": [ 0, 0, 0 ],
                    "flagmode": 1,
                    "id": "obj-5",
                    "itemtype": 0,
                    "maxclass": "radiogroup",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": 29,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 44.0, 21.0, 89.0 ],
                    "size": 3,
                    "value": 0
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 30.0, 192.0, 150.0, 22.0 ],
                    "text": "selector~ 2"
                }
            },
            {
                "box": {
                    "id": "noise",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 95.0, 26.0, 50.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "lm-ng",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 111.0, 84.0, 90.0, 22.0 ],
                    "text": "loadmess 0.05"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "ngain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 111.0, 117.0, 44.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ng",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 95.0, 157.0, 35.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "c-src",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 218.0, 85.0, 280.0, 20.0 ],
                    "text": "noise level — swap noise~ for adc~ or playlist~"
                }
            },
            {
                "box": {
                    "id": "lm-mode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 201.0, 164.0, 80.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "nmode",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 201.0, 194.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-mode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 261.0, 194.0, 246.0, 20.0 ],
                    "text": "0=dry  1=resonator  2=diffuse  3=harmonizer"
                }
            },
            {
                "box": {
                    "id": "lm-freq",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 201.0, 234.0, 90.0, 22.0 ],
                    "text": "loadmess 220"
                }
            },
            {
                "box": {
                    "id": "nfreq",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 201.0, 264.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-freq",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 271.0, 264.0, 150.0, 20.0 ],
                    "text": "reson freq (Hz)"
                }
            },
            {
                "box": {
                    "id": "lm-q",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 201.0, 304.0, 90.0, 22.0 ],
                    "text": "loadmess 0.9"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "nq",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 201.0, 334.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-q",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 271.0, 334.0, 150.0, 20.0 ],
                    "text": "reson resonance 0-0.98"
                }
            },
            {
                "box": {
                    "id": "lm-transp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 501.0, 164.0, 110.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "ntransp",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 501.0, 194.0, 70.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-transp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 581.0, 194.0, 180.0, 20.0 ],
                    "text": "harm transpose (cents)"
                }
            },
            {
                "box": {
                    "id": "lm-spread",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 501.0, 234.0, 110.0, 22.0 ],
                    "text": "loadmess 20"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "nspread",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 501.0, 264.0, 70.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-spread",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 581.0, 264.0, 180.0, 20.0 ],
                    "text": "harm spread (cents ±)"
                }
            },
            {
                "box": {
                    "id": "lm-qual",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 501.0, 304.0, 90.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "nqual",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 501.0, 334.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-qual",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 561.0, 334.0, 250.0, 20.0 ],
                    "text": "harm quality 0=basic 1=good 2=better 3=best"
                }
            },
            {
                "box": {
                    "id": "lm-glide",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 501.0, 374.0, 100.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "nglide",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 501.0, 404.0, 70.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-glide",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 581.0, 404.0, 150.0, 20.0 ],
                    "text": "harm glide (ms)"
                }
            },
            {
                "box": {
                    "id": "pp",
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 41.0, 454.0, 200.0, 22.0 ],
                    "text": "pre_process"
                }
            },
            {
                "box": {
                    "id": "dac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 41.0, 504.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "c-dac",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 101.0, 516.0, 245.0, 20.0 ],
                    "text": "click speaker to start — all params auto-load"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "nfreq", 0 ],
                    "source": [ "lm-freq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nglide", 0 ],
                    "source": [ "lm-glide", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nmode", 0 ],
                    "source": [ "lm-mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ngain", 0 ],
                    "source": [ "lm-ng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nq", 0 ],
                    "source": [ "lm-q", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nqual", 0 ],
                    "source": [ "lm-qual", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "nspread", 0 ],
                    "source": [ "lm-spread", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ntransp", 0 ],
                    "source": [ "lm-transp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 3 ],
                    "source": [ "nfreq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "ng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ng", 1 ],
                    "source": [ "ngain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 8 ],
                    "source": [ "nglide", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 2 ],
                    "source": [ "nmode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ng", 0 ],
                    "source": [ "noise", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 4 ],
                    "source": [ "nq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 7 ],
                    "source": [ "nqual", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 6 ],
                    "source": [ "nspread", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 5 ],
                    "source": [ "ntransp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 1 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pp", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 1 ],
                    "source": [ "pp", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 0 ],
                    "source": [ "pp", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}