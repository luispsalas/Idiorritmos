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
  "rect": [
   80.0,
   80.0,
   900.0,
   420.0
  ],
  "boxes": [
   {
    "box": {
     "id": "b-clk",
     "maxclass": "button",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      40,
      40,
      24.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "clk",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40,
      72,
      50,
      22.0
     ],
     "text": "click~"
    }
   },
   {
    "box": {
     "id": "c-clk",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      95,
      42,
      150,
      18.0
     ],
     "text": "click (echo test)"
    }
   },
   {
    "box": {
     "id": "noise",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      150,
      40,
      50,
      22.0
     ],
     "text": "noise~"
    }
   },
   {
    "box": {
     "id": "nmul",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      150,
      72,
      40,
      22.0
     ],
     "text": "*~"
    }
   },
   {
    "box": {
     "id": "lm-nl",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      210,
      40,
      80,
      22.0
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "n-nl",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "patching_rect": [
      210,
      72,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "c-nl",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      265,
      74,
      90,
      18.0
     ],
     "text": "noise level"
    }
   },
   {
    "box": {
     "id": "summ",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40,
      120,
      40,
      22.0
     ],
     "text": "+~"
    }
   },
   {
    "box": {
     "id": "gen",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40,
      200,
      160,
      22.0
     ],
     "text": "gen~ texture_gen"
    }
   },
   {
    "box": {
     "id": "lm-mode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      40,
      90,
      22.0
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "n-mode",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "bang"
     ],
     "patching_rect": [
      395,
      40,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "m-mode",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      450,
      40,
      90,
      22.0
     ],
     "text": "mode $1"
    }
   },
   {
    "box": {
     "id": "c-mode",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      545,
      42,
      90,
      18.0
     ],
     "text": "mode"
    }
   },
   {
    "box": {
     "id": "lm-A",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      72,
      90,
      22.0
     ],
     "text": "loadmess 1"
    }
   },
   {
    "box": {
     "id": "n-A",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "patching_rect": [
      395,
      72,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "m-A",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      450,
      72,
      90,
      22.0
     ],
     "text": "A $1"
    }
   },
   {
    "box": {
     "id": "c-A",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      545,
      74,
      90,
      18.0
     ],
     "text": "A"
    }
   },
   {
    "box": {
     "id": "lm-B",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      104,
      90,
      22.0
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "n-B",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "patching_rect": [
      395,
      104,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "m-B",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      450,
      104,
      90,
      22.0
     ],
     "text": "B $1"
    }
   },
   {
    "box": {
     "id": "c-B",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      545,
      106,
      90,
      18.0
     ],
     "text": "B"
    }
   },
   {
    "box": {
     "id": "lm-base",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      136,
      90,
      22.0
     ],
     "text": "loadmess 150"
    }
   },
   {
    "box": {
     "id": "n-base",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "patching_rect": [
      395,
      136,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "m-base",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      450,
      136,
      90,
      22.0
     ],
     "text": "basems $1"
    }
   },
   {
    "box": {
     "id": "c-base",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      545,
      138,
      90,
      18.0
     ],
     "text": "basems"
    }
   },
   {
    "box": {
     "id": "lm-fbk",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      168,
      90,
      22.0
     ],
     "text": "loadmess 0.5"
    }
   },
   {
    "box": {
     "id": "n-fbk",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "patching_rect": [
      395,
      168,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "m-fbk",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      450,
      168,
      90,
      22.0
     ],
     "text": "fbk $1"
    }
   },
   {
    "box": {
     "id": "c-fbk",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      545,
      170,
      90,
      18.0
     ],
     "text": "fbk"
    }
   },
   {
    "box": {
     "id": "lm-lp",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      200,
      90,
      22.0
     ],
     "text": "loadmess 6000"
    }
   },
   {
    "box": {
     "id": "n-lp",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "patching_rect": [
      395,
      200,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "m-lp",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      450,
      200,
      90,
      22.0
     ],
     "text": "lopass $1"
    }
   },
   {
    "box": {
     "id": "c-lp",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      545,
      202,
      90,
      18.0
     ],
     "text": "lopass"
    }
   },
   {
    "box": {
     "id": "gout",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40,
      250,
      60,
      22.0
     ],
     "text": "*~ 0.3"
    }
   },
   {
    "box": {
     "id": "dac",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      40,
      300,
      90,
      22.0
     ],
     "text": "ezdac~"
    }
   },
   {
    "box": {
     "id": "c-dac",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      140,
      302,
      520,
      18.0
     ],
     "text": "click ezdac~ to start. Click button = hear taps. Try mode 4 (harmonic), 6 (spread); raise fbk."
    }
   },
   {
    "box": {
     "id": "c-modes",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      300,
      232,
      520,
      18.0
     ],
     "text": "modes: 1 exp  2 scaledexp  3 increment  4 harmonic  5 subharmonic  6 spread"
    }
   },
   {
    "box": {
     "id": "h",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      12,
      560,
      18.0
     ],
     "text": "RNBO SPIKE - gen~ texture (12-tap distribution feedback delay)",
     "fontsize": 13
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "b-clk",
      0
     ],
     "destination": [
      "clk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "clk",
      0
     ],
     "destination": [
      "summ",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "noise",
      0
     ],
     "destination": [
      "nmul",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-nl",
      0
     ],
     "destination": [
      "n-nl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-nl",
      0
     ],
     "destination": [
      "nmul",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "nmul",
      0
     ],
     "destination": [
      "summ",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "summ",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-mode",
      0
     ],
     "destination": [
      "n-mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-mode",
      0
     ],
     "destination": [
      "m-mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-mode",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-A",
      0
     ],
     "destination": [
      "n-A",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-A",
      0
     ],
     "destination": [
      "m-A",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-A",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-B",
      0
     ],
     "destination": [
      "n-B",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-B",
      0
     ],
     "destination": [
      "m-B",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-B",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-base",
      0
     ],
     "destination": [
      "n-base",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-base",
      0
     ],
     "destination": [
      "m-base",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-base",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-fbk",
      0
     ],
     "destination": [
      "n-fbk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-fbk",
      0
     ],
     "destination": [
      "m-fbk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-fbk",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lm-lp",
      0
     ],
     "destination": [
      "n-lp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "n-lp",
      0
     ],
     "destination": [
      "m-lp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m-lp",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gen",
      0
     ],
     "destination": [
      "gout",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gout",
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
      "gout",
      0
     ],
     "destination": [
      "dac",
      1
     ]
    }
   }
  ]
 }
}