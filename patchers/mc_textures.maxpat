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
        "rect": [ 134.0, 149.0, 1120.0, 820.0 ],
        "boxes": [
            {
                "box": {
                    "id": "pb",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 470.0, 260.0, 22.0 ],
                    "text": "playback"
                }
            },
            {
                "box": {
                    "id": "unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 40.0, 510.0, 100.0, 22.0 ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "pre",
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 40.0, 545.0, 300.0, 22.0 ],
                    "text": "pre_process"
                }
            },
            {
                "box": {
                    "id": "eng",
                    "maxclass": "newobj",
                    "numinlets": 12,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 580.0, 320.0, 22.0 ],
                    "text": "texture_engine"
                }
            },
            {
                "box": {
                    "id": "stereo",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 615.0, 180.0, 22.0 ],
                    "text": "stereo_image"
                }
            },
            {
                "box": {
                    "id": "outp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 650.0, 180.0, 22.0 ],
                    "text": "output"
                }
            },
            {
                "box": {
                    "id": "dac",
                    "maxclass": "mc.ezdac~",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 690.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "c-dac",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 692.0, 240.0, 20.0 ],
                    "text": "click mc.ezdac~ to start audio"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "h-pb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 20.0, 200.0, 22.0 ],
                    "text": "PLAYBACK"
                }
            },
            {
                "box": {
                    "id": "b-load",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 44.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "m-replace",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 76.0, 70.0, 22.0 ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "id": "c-load",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 115.0, 78.0, 120.0, 20.0 ],
                    "text": "load clip"
                }
            },
            {
                "box": {
                    "id": "lm-play",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 44.0, 80.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "tg-play",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 285.0, 44.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-play",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 315.0, 46.0, 60.0, 20.0 ],
                    "text": "play"
                }
            },
            {
                "box": {
                    "id": "b-restart",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 42.0, 28.0, 28.0 ]
                }
            },
            {
                "box": {
                    "id": "c-restart",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 392.0, 46.0, 70.0, 20.0 ],
                    "text": "restart"
                }
            },
            {
                "box": {
                    "id": "lm-gs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 80.0, 90.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-gs",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 80.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-gs",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 82.0, 110.0, 20.0 ],
                    "text": "global speed"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-spd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 20.0, 160.0, 20.0 ],
                    "text": "SPEED DIST"
                }
            },
            {
                "box": {
                    "id": "um-spd",
                    "items": [ "deviate", ",", "exponential", ",", "scaledexponential", ",", "increment", ",", "harmonic", ",", "subharmonic", ",", "spread", ",", "spreadinclusive", ",", "spreadexclusive", ",", "spreadincludesecond", ",", "spreadincludefirst", ",", "replicatevalues" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 44.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-spdm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 72.0, 70.0, 22.0 ],
                    "text": "loadmess 6"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "a-spd",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 610.0, 44.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-spda",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 610.0, 72.0, 90.0, 22.0 ],
                    "text": "loadmess 0.9"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "b-spd",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 670.0, 44.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-spdb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 670.0, 72.0, 90.0, 22.0 ],
                    "text": "loadmess 1.4"
                }
            },
            {
                "box": {
                    "id": "pak-spd",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 104.0, 140.0, 22.0 ],
                    "text": "pak spread 1. 1."
                }
            },
            {
                "box": {
                    "id": "b-rrspd",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 600.0, 104.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-rrspd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 628.0, 106.0, 60.0, 20.0 ],
                    "text": "re-roll"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-pre",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 150.0, 160.0, 20.0 ],
                    "text": "PRE-PROCESS"
                }
            },
            {
                "box": {
                    "id": "um-mode",
                    "items": [ "dry", ",", "resonator", ",", "diffuse", ",", "harmonizer" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 172.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-mode",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 610.0, 172.0, 80.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "c-mode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 700.0, 174.0, 80.0, 20.0 ],
                    "text": "mode"
                }
            },
            {
                "box": {
                    "id": "lm-rf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 206.0, 90.0, 22.0 ],
                    "text": "loadmess 220"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-rf",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 206.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-rf",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 208.0, 110.0, 20.0 ],
                    "text": "reson freq"
                }
            },
            {
                "box": {
                    "id": "lm-rq",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 236.0, 90.0, 22.0 ],
                    "text": "loadmess 0.9"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-rq",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 236.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-rq",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 238.0, 110.0, 20.0 ],
                    "text": "reson q"
                }
            },
            {
                "box": {
                    "id": "lm-ht",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 266.0, 90.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-ht",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 266.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-ht",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 268.0, 110.0, 20.0 ],
                    "text": "harm transpose"
                }
            },
            {
                "box": {
                    "id": "lm-hs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 296.0, 90.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-hs",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 296.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-hs",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 298.0, 110.0, 20.0 ],
                    "text": "harm spread"
                }
            },
            {
                "box": {
                    "id": "lm-hq",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 326.0, 90.0, 22.0 ],
                    "text": "loadmess 2"
                }
            },
            {
                "box": {
                    "id": "n-hq",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 326.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-hq",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 328.0, 110.0, 20.0 ],
                    "text": "harm quality"
                }
            },
            {
                "box": {
                    "id": "lm-hg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 450.0, 356.0, 90.0, 22.0 ],
                    "text": "loadmess 50"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-hg",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 356.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-hg",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 358.0, 110.0, 20.0 ],
                    "text": "harm glide"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-eng",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 150.0, 160.0, 20.0 ],
                    "text": "TEXTURE ENGINE"
                }
            },
            {
                "box": {
                    "id": "lm-tc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 172.0, 90.0, 22.0 ],
                    "text": "loadmess 10"
                }
            },
            {
                "box": {
                    "id": "n-tc",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 172.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-tc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 174.0, 110.0, 20.0 ],
                    "text": "tap count"
                }
            },
            {
                "box": {
                    "id": "lm-base",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 202.0, 90.0, 22.0 ],
                    "text": "loadmess 150"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-base",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 202.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-base",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 204.0, 110.0, 20.0 ],
                    "text": "base ms"
                }
            },
            {
                "box": {
                    "id": "lm-fb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 232.0, 90.0, 22.0 ],
                    "text": "loadmess 0.5"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-fb",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 232.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-fb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 234.0, 110.0, 20.0 ],
                    "text": "feedback"
                }
            },
            {
                "box": {
                    "id": "lm-lp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 262.0, 90.0, 22.0 ],
                    "text": "loadmess 6000"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-lp",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 262.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-lp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 264.0, 110.0, 20.0 ],
                    "text": "lopass Hz"
                }
            },
            {
                "box": {
                    "id": "lm-lr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 292.0, 90.0, 22.0 ],
                    "text": "loadmess 0.2"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-lr",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 292.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-lr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 294.0, 110.0, 20.0 ],
                    "text": "lfo rate"
                }
            },
            {
                "box": {
                    "id": "lm-ld",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 322.0, 90.0, 22.0 ],
                    "text": "loadmess 5"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-ld",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 322.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-ld",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 324.0, 110.0, 20.0 ],
                    "text": "lfo depth"
                }
            },
            {
                "box": {
                    "id": "lm-frz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 352.0, 80.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "tg-frz",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 285.0, 352.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-frz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 315.0, 354.0, 60.0, 20.0 ],
                    "text": "freeze"
                }
            },
            {
                "box": {
                    "id": "b-panic",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 350.0, 28.0, 28.0 ]
                }
            },
            {
                "box": {
                    "id": "c-panic",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 392.0, 354.0, 70.0, 20.0 ],
                    "text": "PANIC"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-tap",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 390.0, 260.0, 20.0 ],
                    "text": "TAP DIST  (B is enveloped)"
                }
            },
            {
                "box": {
                    "id": "um-tap",
                    "items": [ "deviate", ",", "exponential", ",", "scaledexponential", ",", "increment", ",", "harmonic", ",", "subharmonic", ",", "spread", ",", "spreadinclusive", ",", "spreadexclusive", ",", "spreadincludesecond", ",", "spreadincludefirst", ",", "replicatevalues" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 412.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-tapm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 440.0, 70.0, 22.0 ],
                    "text": "loadmess 6"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "a-tap",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 412.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-tapa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 360.0, 440.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "b-rrtap",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 430.0, 412.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-rrtap",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 458.0, 414.0, 60.0, 20.0 ],
                    "text": "re-roll"
                }
            },
            {
                "box": {
                    "id": "pak-tap",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 560.0, 140.0, 22.0 ],
                    "text": "pak spread 1. 1."
                }
            },
            {
                "box": {
                    "id": "slotB",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 520.0, 160.0, 22.0 ],
                    "text": "param_slot"
                }
            },
            {
                "box": {
                    "id": "lm-tapb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 470.0, 80.0, 22.0 ],
                    "text": "loadmess 6"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-tapb",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 430.0, 500.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-tapb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 490.0, 502.0, 90.0, 20.0 ],
                    "text": "B manual"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-lfo",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 390.0, 160.0, 20.0 ],
                    "text": "LFO DIST"
                }
            },
            {
                "box": {
                    "id": "um-lfo",
                    "items": [ "deviate", ",", "exponential", ",", "scaledexponential", ",", "increment", ",", "harmonic", ",", "subharmonic", ",", "spread", ",", "spreadinclusive", ",", "spreadexclusive", ",", "spreadincludesecond", ",", "spreadincludefirst", ",", "replicatevalues" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 560.0, 412.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-lfom",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 440.0, 70.0, 22.0 ],
                    "text": "loadmess 6"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "a-lfo",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 720.0, 412.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-lfoa",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 720.0, 440.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "b-lfo",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 780.0, 412.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-lfob",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 440.0, 70.0, 22.0 ],
                    "text": "loadmess 2"
                }
            },
            {
                "box": {
                    "id": "pak-lfo",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 472.0, 140.0, 22.0 ],
                    "text": "pak spread 1. 1."
                }
            },
            {
                "box": {
                    "id": "b-rrlfo",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 710.0, 472.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-rrlfo",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 738.0, 474.0, 60.0, 20.0 ],
                    "text": "re-roll"
                }
            },
            {
                "box": {
                    "id": "lm-wid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 520.0, 90.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-wid",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 655.0, 520.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-wid",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 710.0, 522.0, 110.0, 20.0 ],
                    "text": "width 0-1"
                }
            },
            {
                "box": {
                    "id": "lm-gain",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 550.0, 90.0, 22.0 ],
                    "text": "loadmess 0.8"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-gain",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 655.0, 550.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-gain",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 710.0, 552.0, 110.0, 20.0 ],
                    "text": "out gain"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-tr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 590.0, 420.0, 20.0 ],
                    "text": "TIMED TAKE  (sweeps TAP B in->out, restarts clip)"
                }
            },
            {
                "box": {
                    "id": "b-take",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 560.0, 612.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "c-take",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 595.0, 616.0, 60.0, 20.0 ],
                    "text": "TAKE"
                }
            },
            {
                "box": {
                    "id": "er",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 660.0, 650.0, 150.0, 22.0 ],
                    "text": "env_ramp"
                }
            },
            {
                "box": {
                    "id": "lm-erS",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 830.0, 612.0, 80.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-erS",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 915.0, 612.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-erE",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 830.0, 642.0, 80.0, 22.0 ],
                    "text": "loadmess 8"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-erE",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 915.0, 642.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "lm-erT",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 830.0, 672.0, 97.0, 22.0 ],
                    "text": "loadmess 10000"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-erT",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 925.0, 672.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-erlab",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 830.0, 592.0, 180.0, 20.0 ],
                    "text": "start / end / time(ms)"
                }
            },
            {
                "box": {
                    "id": "t-take",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 560.0, 650.0, 70.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "m-en1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 684.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "t-done",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 660.0, 690.0, 60.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "m-en0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 720.0, 712.0, 30.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "b-done",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 660.0, 712.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-done",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 690.0, 714.0, 90.0, 20.0 ],
                    "text": "take done"
                }
            },
            {
                "box": {
                    "id": "lm-en0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 440.0, 80.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "h-dry",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 880.0, 20.0, 120.0, 20.0 ],
                    "text": "RESET"
                }
            },
            {
                "box": {
                    "id": "b-dry",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 880.0, 40.0, 34.0, 34.0 ]
                }
            },
            {
                "box": {
                    "id": "c-dry",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 920.0, 46.0, 150.0, 20.0 ],
                    "text": "DRY  (all -> as recorded)"
                }
            },
            {
                "box": {
                    "id": "dry-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 80.0, 110.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "dry-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 106.0, 110.0, 22.0 ],
                    "text": "deviate 0 1"
                }
            },
            {
                "box": {
                    "id": "dry-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 132.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 158.0, 29.5, 22.0 ],
                    "text": "10"
                }
            },
            {
                "box": {
                    "id": "dry-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 184.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 210.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 236.0, 110.0, 22.0 ],
                    "text": "20000"
                }
            },
            {
                "box": {
                    "id": "dry-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 262.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 288.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 314.0, 110.0, 22.0 ],
                    "text": "spread 1 1"
                }
            },
            {
                "box": {
                    "id": "dry-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 340.0, 110.0, 22.0 ],
                    "text": "spread 1 1"
                }
            },
            {
                "box": {
                    "id": "dry-11",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 366.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 392.0, 110.0, 22.0 ],
                    "text": "0.8"
                }
            },
            {
                "box": {
                    "id": "dry-13",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 418.0, 110.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "dry-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 444.0, 110.0, 22.0 ],
                    "text": "0"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "pak-lfo", 1 ],
                    "source": [ "a-lfo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-spd", 1 ],
                    "source": [ "a-spd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-tap", 1 ],
                    "source": [ "a-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-0", 0 ],
                    "order": 14,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-1", 0 ],
                    "order": 13,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-10", 0 ],
                    "order": 4,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-11", 0 ],
                    "order": 3,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-12", 0 ],
                    "order": 2,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-13", 0 ],
                    "order": 1,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-14", 0 ],
                    "order": 0,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-2", 0 ],
                    "order": 12,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-3", 0 ],
                    "order": 11,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-4", 0 ],
                    "order": 10,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-5", 0 ],
                    "order": 9,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-6", 0 ],
                    "order": 8,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-7", 0 ],
                    "order": 7,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-8", 0 ],
                    "order": 6,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dry-9", 0 ],
                    "order": 5,
                    "source": [ "b-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-lfo", 2 ],
                    "source": [ "b-lfo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m-replace", 0 ],
                    "source": [ "b-load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 11 ],
                    "source": [ "b-panic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 4 ],
                    "source": [ "b-restart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-lfo", 0 ],
                    "source": [ "b-rrlfo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-spd", 0 ],
                    "source": [ "b-rrspd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-tap", 0 ],
                    "source": [ "b-rrtap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-spd", 2 ],
                    "source": [ "b-spd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t-take", 0 ],
                    "source": [ "b-take", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-gs", 0 ],
                    "source": [ "dry-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 1 ],
                    "source": [ "dry-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 8 ],
                    "source": [ "dry-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-wid", 0 ],
                    "source": [ "dry-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-gain", 0 ],
                    "source": [ "dry-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tg-frz", 0 ],
                    "source": [ "dry-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slotB", 2 ],
                    "source": [ "dry-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-mode", 0 ],
                    "source": [ "dry-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-tc", 0 ],
                    "source": [ "dry-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-base", 0 ],
                    "source": [ "dry-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-fb", 0 ],
                    "source": [ "dry-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-lp", 0 ],
                    "source": [ "dry-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-lr", 0 ],
                    "source": [ "dry-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-ld", 0 ],
                    "source": [ "dry-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 4 ],
                    "source": [ "dry-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "stereo", 0 ],
                    "source": [ "eng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slotB", 1 ],
                    "source": [ "er", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t-done", 0 ],
                    "source": [ "er", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-base", 0 ],
                    "source": [ "lm-base", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slotB", 2 ],
                    "source": [ "lm-en0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-erE", 0 ],
                    "source": [ "lm-erE", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-erS", 0 ],
                    "source": [ "lm-erS", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-erT", 0 ],
                    "source": [ "lm-erT", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-fb", 0 ],
                    "source": [ "lm-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tg-frz", 0 ],
                    "source": [ "lm-frz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-gain", 0 ],
                    "source": [ "lm-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-gs", 0 ],
                    "source": [ "lm-gs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-hg", 0 ],
                    "source": [ "lm-hg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-hq", 0 ],
                    "source": [ "lm-hq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-hs", 0 ],
                    "source": [ "lm-hs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-ht", 0 ],
                    "source": [ "lm-ht", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-ld", 0 ],
                    "source": [ "lm-ld", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "a-lfo", 0 ],
                    "source": [ "lm-lfoa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "b-lfo", 0 ],
                    "source": [ "lm-lfob", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-lfo", 0 ],
                    "source": [ "lm-lfom", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-lp", 0 ],
                    "source": [ "lm-lp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-lr", 0 ],
                    "source": [ "lm-lr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-mode", 0 ],
                    "source": [ "lm-mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tg-play", 0 ],
                    "source": [ "lm-play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-rf", 0 ],
                    "source": [ "lm-rf", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-rq", 0 ],
                    "source": [ "lm-rq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "a-spd", 0 ],
                    "source": [ "lm-spda", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "b-spd", 0 ],
                    "source": [ "lm-spdb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-spd", 0 ],
                    "source": [ "lm-spdm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "a-tap", 0 ],
                    "source": [ "lm-tapa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-tapb", 0 ],
                    "source": [ "lm-tapb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "um-tap", 0 ],
                    "source": [ "lm-tapm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-tc", 0 ],
                    "source": [ "lm-tc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "n-wid", 0 ],
                    "source": [ "lm-wid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slotB", 2 ],
                    "source": [ "m-en0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slotB", 2 ],
                    "source": [ "m-en1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 0 ],
                    "source": [ "m-replace", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 3 ],
                    "source": [ "n-base", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "er", 2 ],
                    "source": [ "n-erE", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "er", 1 ],
                    "source": [ "n-erS", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "er", 3 ],
                    "source": [ "n-erT", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 5 ],
                    "source": [ "n-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "outp", 1 ],
                    "source": [ "n-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 2 ],
                    "source": [ "n-gs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 8 ],
                    "source": [ "n-hg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 7 ],
                    "source": [ "n-hq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 6 ],
                    "source": [ "n-hs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 5 ],
                    "source": [ "n-ht", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 9 ],
                    "source": [ "n-ld", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 6 ],
                    "source": [ "n-lp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 7 ],
                    "source": [ "n-lr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 3 ],
                    "source": [ "n-rf", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 4 ],
                    "source": [ "n-rq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "slotB", 0 ],
                    "source": [ "n-tapb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 2 ],
                    "source": [ "n-tc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "stereo", 1 ],
                    "source": [ "n-wid", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 0 ],
                    "source": [ "outp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 8 ],
                    "source": [ "pak-lfo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 1 ],
                    "source": [ "pak-spd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 4 ],
                    "source": [ "pak-tap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "unpack", 0 ],
                    "source": [ "pb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 1 ],
                    "source": [ "pre", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "pre", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-tap", 2 ],
                    "source": [ "slotB", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "outp", 0 ],
                    "source": [ "stereo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "b-done", 0 ],
                    "source": [ "t-done", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m-en0", 0 ],
                    "source": [ "t-done", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "er", 0 ],
                    "source": [ "t-take", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m-en1", 0 ],
                    "source": [ "t-take", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 4 ],
                    "source": [ "t-take", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 10 ],
                    "source": [ "tg-frz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pb", 3 ],
                    "source": [ "tg-play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-lfo", 0 ],
                    "source": [ "um-lfo", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 2 ],
                    "source": [ "um-mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-spd", 0 ],
                    "source": [ "um-spd", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak-tap", 0 ],
                    "source": [ "um-tap", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 1 ],
                    "source": [ "unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pre", 0 ],
                    "source": [ "unpack", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}