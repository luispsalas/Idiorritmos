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
        "rect": [ 62.0, 96.0, 889.0, 870.0 ],
        "boxes": [
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "guide",
                    "linecount": 33,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 296.0, 485.0, 468.0, 412.0 ],
                    "text": "mc TEXTURES — ENGINE PARAMETER GUIDE\n\nSignal path: in L/R summed to mono, upmixed to 10 channels, fed through a 10-tap modulated delay matrix with a feedback loop, output as a 10-channel mc signal.\n\nTAP COUNT (1-10): how many taps are active (gain mask). More = denser. Best judged with the CLICK source (count the echoes).\n\nBASE TAP (ms): overall delay size. ~30-80 = metallic/comb tone; ~200-600 = spacious echoes. Use CLICKS to hear it.\n\nEXPONENT (tap spread): reshapes tap spacing as ratio^exp. 1 = as-set, >1 = taps fling wide, <1 = cluster near base, 0 = all taps collapse to one echo. Use CLICKS.\n\nFEEDBACK (0-0.99): regeneration. 0 = single pass, 0.5-0.7 = repeating, 0.9+ = long lush tail. (Limiter on output guards runaway.)\n\nFEEDBACK LOPASS (Hz): tone of the repeats. Low (800-2000) = each echo darker, dub-like; high = bright.\n\nLFO RATE (Hz): speed of per-tap delay modulation. 0.1-0.5 = slow drift; higher = warble.\n\nLFO DEPTH (ms): amount of delay modulation = pitch wobble / chorus. 0 = static, high = seasick. Clearest on TONAL (oscillator) or repeating material.\n\nFREEZE (0/1): locks the buffer (native mc.tapin~ freeze) — keeps echoing the captured moment, ignores new input. Most dramatic on the OSCILLATOR / tonal source.\n\nPANIC: clears the buffer + unfreezes + feedback to 0 = instant clean silence.\n\nTEST SOURCES: Oscillator/tonal -> freeze drones & LFO pitch-wobble.  Noise -> diffuse wash (hides individual taps — don't use to judge tap count/spread).  Click/impulse -> hear individual taps, base, exponent, tap count."
                }
            },
            {
                "box": {
                    "id": "noise",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 166.0, 256.0, 50.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "lm-g",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 90.0, 316.0, 90.0, 22.0 ],
                    "text": "loadmess 0."
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "gn",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 90.0, 346.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 334.0, 35.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "c-src",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 182.0, 323.0, 107.0, 33.0 ],
                    "text": "src level (set 0 to isolate clicks)"
                }
            },
            {
                "box": {
                    "id": "btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 229.0, 220.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 265.0, 190.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "met",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 265.0, 221.0, 70.0, 22.0 ],
                    "text": "metro 1200"
                }
            },
            {
                "box": {
                    "id": "clk",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 229.0, 256.0, 50.0, 22.0 ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "id": "lm-oscf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 103.0, 141.0, 90.0, 22.0 ],
                    "text": "loadmess 220"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "oscfreq",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 103.0, 176.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "osc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 103.0, 211.0, 60.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "disabled": [ 0, 0, 0 ],
                    "id": "rg",
                    "itemtype": 0,
                    "maxclass": "radiogroup",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 164.0, 24.0, 50.0 ],
                    "size": 3,
                    "value": 0
                }
            },
            {
                "box": {
                    "id": "addsel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 40.0, 221.0, 35.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "sel",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 285.0, 208.0, 22.0 ],
                    "text": "selector~ 3"
                }
            },
            {
                "box": {
                    "id": "lm-tc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 40.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 512.0, 40.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-tc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 572.0, 40.0, 124.0, 20.0 ],
                    "text": "tap count (4/6/8/10)"
                }
            },
            {
                "box": {
                    "id": "lm-base",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 86.0, 90.0, 22.0 ],
                    "text": "loadmess 100"
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
                    "patching_rect": [ 512.0, 86.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-base",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.0, 86.0, 124.0, 20.0 ],
                    "text": "base tap (ms)"
                }
            },
            {
                "box": {
                    "id": "lm-exp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 132.0, 90.0, 22.0 ],
                    "text": "loadmess 1.2"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "n-exp",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 512.0, 132.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-exp",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.0, 132.0, 124.0, 33.0 ],
                    "text": "exponent (tap spread)"
                }
            },
            {
                "box": {
                    "id": "lm-fb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 178.0, 90.0, 22.0 ],
                    "text": "loadmess 0."
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
                    "patching_rect": [ 512.0, 178.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-fb",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.0, 178.0, 124.0, 20.0 ],
                    "text": "feedback 0-0.99"
                }
            },
            {
                "box": {
                    "id": "lm-lp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 224.0, 90.0, 22.0 ],
                    "text": "loadmess 6000"
                }
            },
            {
                "box": {
                    "id": "n-lp",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 512.0, 224.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-lp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.0, 224.0, 124.0, 20.0 ],
                    "text": "feedback lopass (Hz)"
                }
            },
            {
                "box": {
                    "id": "lm-lr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 270.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 512.0, 270.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-lr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.0, 270.0, 124.0, 20.0 ],
                    "text": "lfo rate (Hz)"
                }
            },
            {
                "box": {
                    "id": "lm-ld",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 316.0, 90.0, 22.0 ],
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
                    "patching_rect": [ 512.0, 316.0, 60.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "c-ld",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.0, 316.0, 124.0, 20.0 ],
                    "text": "lfo depth (ms)"
                }
            },
            {
                "box": {
                    "id": "t-frz",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 394.0, 362.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c-frz",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 452.0, 364.0, 160.0, 20.0 ],
                    "text": "freeze (lock buffer)"
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
                    "patching_rect": [ 632.0, 358.0, 28.0, 28.0 ]
                }
            },
            {
                "box": {
                    "id": "c-panic",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 667.0, 364.0, 160.0, 20.0 ],
                    "text": "PANIC (clear + kill tail)"
                }
            },
            {
                "box": {
                    "id": "engine",
                    "maxclass": "newobj",
                    "numinlets": 11,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 430.0, 407.8888888888889, 22.0 ],
                    "text": "texture_engine"
                }
            },
            {
                "box": {
                    "id": "mixdown",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 480.0, 120.0, 22.0 ],
                    "text": "mc.mixdown~ 2"
                }
            },
            {
                "box": {
                    "id": "limi",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 40.0, 515.0, 130.0, 22.0 ],
                    "text": "mc.limi~ @chans 2"
                }
            },
            {
                "box": {
                    "id": "dac",
                    "maxclass": "mc.ezdac~",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 555.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "c-dac",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 567.5, 131.0, 33.0 ],
                    "text": "click mc.ezdac~ to start audio"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "sel", 0 ],
                    "source": [ "addsel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 10 ],
                    "source": [ "b-panic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "clk", 0 ],
                    "source": [ "btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sel", 3 ],
                    "source": [ "clk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mixdown", 0 ],
                    "source": [ "engine", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mul", 1 ],
                    "source": [ "gn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dac", 0 ],
                    "source": [ "limi", 0 ]
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
                    "destination": [ "n-exp", 0 ],
                    "source": [ "lm-exp", 0 ]
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
                    "destination": [ "gn", 0 ],
                    "source": [ "lm-g", 0 ]
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
                    "destination": [ "oscfreq", 0 ],
                    "source": [ "lm-oscf", 0 ]
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
                    "destination": [ "clk", 0 ],
                    "source": [ "met", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "limi", 0 ],
                    "source": [ "mixdown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 1 ],
                    "order": 0,
                    "source": [ "mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 0 ],
                    "order": 1,
                    "source": [ "mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 3 ],
                    "source": [ "n-base", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 4 ],
                    "source": [ "n-exp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 5 ],
                    "source": [ "n-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 8 ],
                    "source": [ "n-ld", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 6 ],
                    "source": [ "n-lp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 7 ],
                    "source": [ "n-lr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 2 ],
                    "source": [ "n-tc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sel", 2 ],
                    "source": [ "noise", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sel", 1 ],
                    "source": [ "osc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "osc", 0 ],
                    "source": [ "oscfreq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "addsel", 0 ],
                    "source": [ "rg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mul", 0 ],
                    "source": [ "sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "engine", 9 ],
                    "source": [ "t-frz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "met", 0 ],
                    "source": [ "tog", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}