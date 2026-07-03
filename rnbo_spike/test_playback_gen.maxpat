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
  "rect": [
   60,
   60,
   860,
   760
  ],
  "boxes": [
   {
    "box": {
     "id": "buf",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      40,
      40,
      100,
      22
     ],
     "text": "buffer~ clip"
    }
   },
   {
    "box": {
     "id": "c_load",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      150,
      18,
      90,
      18
     ],
     "text": "load a clip ->"
    }
   },
   {
    "box": {
     "id": "b_load",
     "maxclass": "button",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      150,
      40,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "id": "m_load",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      40,
      70,
      22
     ],
     "text": "replace"
    }
   },
   {
    "box": {
     "id": "gen",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      40,
      90,
      160,
      22
     ],
     "text": "gen~ playback_gen"
    }
   },
   {
    "box": {
     "id": "mgl",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      40,
      520,
      60,
      22
     ],
     "text": "*~ 0.4"
    }
   },
   {
    "box": {
     "id": "mgr",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      110,
      520,
      60,
      22
     ],
     "text": "*~ 0.4"
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
      560,
      70,
      22
     ],
     "text": "ezdac~"
    }
   },
   {
    "box": {
     "id": "c_pre",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      90,
      420,
      18
     ],
     "text": "PRESETS - shift-click cell = store, click = recall (saved with patch)"
    }
   },
   {
    "box": {
     "id": "pre",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "preset"
     ],
     "patching_rect": [
      230,
      112,
      360,
      40
     ],
     "text": "preset"
    }
   },
   {
    "box": {
     "id": "c_globalspeed",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      170,
      90,
      18
     ],
     "text": "globalspeed"
    }
   },
   {
    "box": {
     "id": "f_globalspeed",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      230,
      188,
      60,
      22
     ]
    }
   },
   {
    "box": {
     "id": "p_globalspeed",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      188,
      120,
      22
     ],
     "text": "prepend globalspeed"
    }
   },
   {
    "box": {
     "id": "ld_globalspeed",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      430,
      188,
      110,
      22
     ],
     "text": "loadmess 1.0"
    }
   },
   {
    "box": {
     "id": "c_mode",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      216,
      90,
      18
     ],
     "text": "mode"
    }
   },
   {
    "box": {
     "id": "f_mode",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      230,
      234,
      60,
      22
     ]
    }
   },
   {
    "box": {
     "id": "p_mode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      234,
      120,
      22
     ],
     "text": "prepend mode"
    }
   },
   {
    "box": {
     "id": "ld_mode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      430,
      234,
      110,
      22
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "c_spdA",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      262,
      90,
      18
     ],
     "text": "spdA"
    }
   },
   {
    "box": {
     "id": "f_spdA",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      230,
      280,
      60,
      22
     ]
    }
   },
   {
    "box": {
     "id": "p_spdA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      280,
      120,
      22
     ],
     "text": "prepend spdA"
    }
   },
   {
    "box": {
     "id": "ld_spdA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      430,
      280,
      110,
      22
     ],
     "text": "loadmess 0.9"
    }
   },
   {
    "box": {
     "id": "c_spdB",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      308,
      90,
      18
     ],
     "text": "spdB"
    }
   },
   {
    "box": {
     "id": "f_spdB",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      230,
      326,
      60,
      22
     ]
    }
   },
   {
    "box": {
     "id": "p_spdB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      326,
      120,
      22
     ],
     "text": "prepend spdB"
    }
   },
   {
    "box": {
     "id": "ld_spdB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      430,
      326,
      110,
      22
     ],
     "text": "loadmess 1.4"
    }
   },
   {
    "box": {
     "id": "c_width",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      354,
      90,
      18
     ],
     "text": "width"
    }
   },
   {
    "box": {
     "id": "f_width",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      230,
      372,
      60,
      22
     ]
    }
   },
   {
    "box": {
     "id": "p_width",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      372,
      120,
      22
     ],
     "text": "prepend width"
    }
   },
   {
    "box": {
     "id": "ld_width",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      430,
      372,
      110,
      22
     ],
     "text": "loadmess 1.0"
    }
   },
   {
    "box": {
     "id": "c_play",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      400,
      90,
      18
     ],
     "text": "play"
    }
   },
   {
    "box": {
     "id": "t_play",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      230,
      418,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "id": "p_play",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      260,
      418,
      110,
      22
     ],
     "text": "prepend play"
    }
   },
   {
    "box": {
     "id": "ld_play",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      380,
      418,
      90,
      22
     ],
     "text": "loadmess 1"
    }
   },
   {
    "box": {
     "id": "c_restart",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      448,
      200,
      18
     ],
     "text": "RESTART (re-align voices)"
    }
   },
   {
    "box": {
     "id": "b_restart",
     "maxclass": "button",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      230,
      466,
      30,
      30
     ]
    }
   },
   {
    "box": {
     "id": "m1_restart",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      270,
      466,
      30,
      22
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "d_restart",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      270,
      496,
      60,
      22
     ],
     "text": "del 50"
    }
   },
   {
    "box": {
     "id": "m0_restart",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      340,
      496,
      30,
      22
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "pp_restart",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      380,
      466,
      120,
      22
     ],
     "text": "prepend restart"
    }
   },
   {
    "box": {
     "id": "c_reroll",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      538,
      200,
      18
     ],
     "text": "REROLL (deviate)"
    }
   },
   {
    "box": {
     "id": "b_reroll",
     "maxclass": "button",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      230,
      556,
      30,
      30
     ]
    }
   },
   {
    "box": {
     "id": "m1_reroll",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      270,
      556,
      30,
      22
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "d_reroll",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      270,
      586,
      60,
      22
     ],
     "text": "del 50"
    }
   },
   {
    "box": {
     "id": "m0_reroll",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      340,
      586,
      30,
      22
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "pp_reroll",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      380,
      556,
      120,
      22
     ],
     "text": "prepend reroll"
    }
   },
   {
    "box": {
     "id": "c_panic",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      628,
      200,
      18
     ],
     "text": "PANIC (stop + silence)"
    }
   },
   {
    "box": {
     "id": "b_panic",
     "maxclass": "button",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      230,
      646,
      30,
      30
     ]
    }
   },
   {
    "box": {
     "id": "m1_panic",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      270,
      646,
      30,
      22
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "d_panic",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      270,
      676,
      60,
      22
     ],
     "text": "del 200"
    }
   },
   {
    "box": {
     "id": "m0_panic",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      340,
      676,
      30,
      22
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "pp_panic",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      380,
      646,
      120,
      22
     ],
     "text": "prepend panic"
    }
   },
   {
    "box": {
     "id": "c_clr",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      718,
      260,
      18
     ],
     "text": "CLEAR (reset params to baseline)"
    }
   },
   {
    "box": {
     "id": "b_clr",
     "maxclass": "button",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      230,
      736,
      30,
      30
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "b_load",
      0
     ],
     "destination": [
      "m_load",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m_load",
      0
     ],
     "destination": [
      "buf",
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
      "mgl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gen",
      1
     ],
     "destination": [
      "mgr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mgl",
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
      "mgr",
      0
     ],
     "destination": [
      "dac",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f_globalspeed",
      0
     ],
     "destination": [
      "p_globalspeed",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p_globalspeed",
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
      "ld_globalspeed",
      0
     ],
     "destination": [
      "f_globalspeed",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f_mode",
      0
     ],
     "destination": [
      "p_mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p_mode",
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
      "ld_mode",
      0
     ],
     "destination": [
      "f_mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f_spdA",
      0
     ],
     "destination": [
      "p_spdA",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p_spdA",
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
      "ld_spdA",
      0
     ],
     "destination": [
      "f_spdA",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f_spdB",
      0
     ],
     "destination": [
      "p_spdB",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p_spdB",
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
      "ld_spdB",
      0
     ],
     "destination": [
      "f_spdB",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "f_width",
      0
     ],
     "destination": [
      "p_width",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p_width",
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
      "ld_width",
      0
     ],
     "destination": [
      "f_width",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "t_play",
      0
     ],
     "destination": [
      "p_play",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ld_play",
      0
     ],
     "destination": [
      "p_play",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "p_play",
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
      "b_restart",
      0
     ],
     "destination": [
      "m1_restart",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m1_restart",
      0
     ],
     "destination": [
      "pp_restart",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_restart",
      0
     ],
     "destination": [
      "d_restart",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "d_restart",
      0
     ],
     "destination": [
      "m0_restart",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m0_restart",
      0
     ],
     "destination": [
      "pp_restart",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_restart",
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
      "b_reroll",
      0
     ],
     "destination": [
      "m1_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m1_reroll",
      0
     ],
     "destination": [
      "pp_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_reroll",
      0
     ],
     "destination": [
      "d_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "d_reroll",
      0
     ],
     "destination": [
      "m0_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m0_reroll",
      0
     ],
     "destination": [
      "pp_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_reroll",
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
      "b_panic",
      0
     ],
     "destination": [
      "m1_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m1_panic",
      0
     ],
     "destination": [
      "pp_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_panic",
      0
     ],
     "destination": [
      "d_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "d_panic",
      0
     ],
     "destination": [
      "m0_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "m0_panic",
      0
     ],
     "destination": [
      "pp_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_panic",
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
      "b_clr",
      0
     ],
     "destination": [
      "ld_globalspeed",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_clr",
      0
     ],
     "destination": [
      "ld_mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_clr",
      0
     ],
     "destination": [
      "ld_spdA",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_clr",
      0
     ],
     "destination": [
      "ld_spdB",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_clr",
      0
     ],
     "destination": [
      "ld_width",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "b_clr",
      0
     ],
     "destination": [
      "ld_play",
      0
     ]
    }
   }
  ]
 }
}