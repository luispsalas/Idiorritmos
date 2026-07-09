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
   704.0,
   92.0,
   1180.0,
   877.0
  ],
  "boxes": [
   {
    "box": {
     "id": "ttl",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40.0,
      12.0,
      760.0,
      20.0
     ],
     "text": "mc TEXTURES \u2014 performance layout (Tier-1 grouping draft): play + judge grouping/order"
    }
   },
   {
    "box": {
     "id": "c_src",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40.0,
      40.0,
      260.0,
      20.0
     ],
     "text": "src: 1 osc 2 noise 3 click 4 playlist"
    }
   },
   {
    "box": {
     "disabled": [
      0,
      0,
      0,
      0
     ],
     "id": "rg",
     "itemtype": 0,
     "maxclass": "radiogroup",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 0,
     "patching_rect": [
      40.0,
      60.0,
      18.0,
      66.0
     ],
     "size": 4,
     "value": -1
    }
   },
   {
    "box": {
     "id": "plus",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      70.0,
      150.0,
      40.0,
      22.0
     ],
     "text": "+ 1"
    }
   },
   {
    "box": {
     "id": "sel",
     "maxclass": "newobj",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40.0,
      182.0,
      90.0,
      22.0
     ],
     "text": "selector~ 4"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "freq",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      150.0,
      40.0,
      50.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "osc",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      150.0,
      72.0,
      90.0,
      22.0
     ],
     "text": "cycle~ 220"
    }
   },
   {
    "box": {
     "id": "noi",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      250.0,
      72.0,
      60.0,
      22.0
     ],
     "text": "noise~"
    }
   },
   {
    "box": {
     "id": "mettog",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      320.0,
      40.0,
      24.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "met",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      320.0,
      68.0,
      80.0,
      22.0
     ],
     "text": "metro 500"
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
      320.0,
      100.0,
      60.0,
      22.0
     ],
     "text": "click~"
    }
   },
   {
    "box": {
     "id": "c_pl",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      150.0,
      108.0,
      260.0,
      20.0
     ],
     "text": "playlist~ (drag audio, toggle=play/loop)"
    }
   },
   {
    "box": {
     "data": {
      "clips": []
     },
     "id": "pl",
     "maxclass": "playlist~",
     "mode": "basic",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "",
      "dictionary"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      150.0,
      128.0,
      150.0,
      92.0
     ],
     "quality": "basic",
     "saved_attribute_attributes": {
      "candicane2": {
       "expression": ""
      },
      "candicane3": {
       "expression": ""
      },
      "candicane4": {
       "expression": ""
      },
      "candicane5": {
       "expression": ""
      },
      "candicane6": {
       "expression": ""
      },
      "candicane7": {
       "expression": ""
      },
      "candicane8": {
       "expression": ""
      }
     }
    }
   },
   {
    "box": {
     "id": "pl_tog",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      150.0,
      212.0,
      24.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "pl_loop",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      182.0,
      212.0,
      110.0,
      22.0
     ],
     "text": "loadmess loop 1"
    }
   },
   {
    "box": {
     "id": "gen",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      40.0,
      250.0,
      210.0,
      22.0
     ],
     "text": "gen~ texture_gen_stereo"
    }
   },
   {
    "box": {
     "id": "mgl",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      40.0,
      288.0,
      55.0,
      22.0
     ],
     "text": "*~ 0.5"
    }
   },
   {
    "box": {
     "id": "mgr",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      105.0,
      288.0,
      55.0,
      22.0
     ],
     "text": "*~ 0.5"
    }
   },
   {
    "box": {
     "id": "dac",
     "maxclass": "ezdac~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      40.0,
      322.0,
      45.0,
      45.0
     ]
    }
   },
   {
    "box": {
     "id": "c_pre",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40.0,
      360.0,
      280.0,
      20.0
     ],
     "text": "presets: shift-click=store, click=recall"
    }
   },
   {
    "box": {
     "id": "pre",
     "maxclass": "preset",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "preset",
      "int",
      "preset",
      "int",
      ""
     ],
     "patching_rect": [
      40.0,
      380.0,
      100.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "id": "hdr_1_40",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      40.0,
      360.0,
      20.0
     ],
     "text": "1 \u00b7 SOURCE \u00b7 capture cloud"
    }
   },
   {
    "box": {
     "id": "lbl_cloud",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      64.0,
      86.0,
      20.0
     ],
     "text": "cloud"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_cloud",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      64.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_cloud",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      64.0,
      116.0,
      22.0
     ],
     "text": "prepend cloud"
    }
   },
   {
    "box": {
     "id": "ld_cloud",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      64.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0."
    }
   },
   {
    "box": {
     "id": "lbl_playspeed",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      94.0,
      86.0,
      20.0
     ],
     "text": "playspeed"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_playspeed",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      94.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_playspeed",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      94.0,
      116.0,
      22.0
     ],
     "text": "prepend playspeed"
    }
   },
   {
    "box": {
     "id": "ld_playspeed",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      94.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "lbl_spmode",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      124.0,
      86.0,
      20.0
     ],
     "text": "spmode"
    }
   },
   {
    "box": {
     "id": "ctl_spmode",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      124.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_spmode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      124.0,
      116.0,
      22.0
     ],
     "text": "prepend spmode"
    }
   },
   {
    "box": {
     "id": "ld_spmode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      124.0,
      96.0,
      22.0
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "lbl_spA",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      154.0,
      86.0,
      20.0
     ],
     "text": "spA"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_spA",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      154.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_spA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      154.0,
      116.0,
      22.0
     ],
     "text": "prepend spA"
    }
   },
   {
    "box": {
     "id": "ld_spA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      154.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.9"
    }
   },
   {
    "box": {
     "id": "lbl_spB",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      184.0,
      86.0,
      20.0
     ],
     "text": "spB"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_spB",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      184.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_spB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      184.0,
      116.0,
      22.0
     ],
     "text": "prepend spB"
    }
   },
   {
    "box": {
     "id": "ld_spB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      184.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1.4"
    }
   },
   {
    "box": {
     "id": "lbl_cloudhold",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      214.0,
      86.0,
      20.0
     ],
     "text": "cloudhold"
    }
   },
   {
    "box": {
     "id": "ctl_cloudhold",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      214.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_cloudhold",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      214.0,
      116.0,
      22.0
     ],
     "text": "prepend cloudhold"
    }
   },
   {
    "box": {
     "id": "ld_cloudhold",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      214.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "hdr_2_258",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      258.0,
      360.0,
      20.0
     ],
     "text": "2 \u00b7 TEMPO sync"
    }
   },
   {
    "box": {
     "id": "lbl_sync",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      282.0,
      86.0,
      20.0
     ],
     "text": "sync"
    }
   },
   {
    "box": {
     "id": "ctl_sync",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      282.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_sync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      282.0,
      116.0,
      22.0
     ],
     "text": "prepend sync"
    }
   },
   {
    "box": {
     "id": "ld_sync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      282.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "lbl_bpm",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      312.0,
      86.0,
      20.0
     ],
     "text": "bpm"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_bpm",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      312.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_bpm",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      312.0,
      116.0,
      22.0
     ],
     "text": "prepend bpm"
    }
   },
   {
    "box": {
     "id": "ld_bpm",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      312.0,
      96.0,
      22.0
     ],
     "text": "loadmess 120."
    }
   },
   {
    "box": {
     "id": "lbl_tapdiv",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      342.0,
      86.0,
      20.0
     ],
     "text": "tapdiv"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_tapdiv",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      342.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_tapdiv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      342.0,
      116.0,
      22.0
     ],
     "text": "prepend tapdiv"
    }
   },
   {
    "box": {
     "id": "ld_tapdiv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      342.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.5"
    }
   },
   {
    "box": {
     "id": "lbl_lfodiv",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      372.0,
      86.0,
      20.0
     ],
     "text": "lfodiv"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_lfodiv",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      372.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfodiv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      372.0,
      116.0,
      22.0
     ],
     "text": "prepend lfodiv"
    }
   },
   {
    "box": {
     "id": "ld_lfodiv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      372.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "lbl_freezediv",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      402.0,
      86.0,
      20.0
     ],
     "text": "freezediv"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_freezediv",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      402.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_freezediv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      402.0,
      116.0,
      22.0
     ],
     "text": "prepend freezediv"
    }
   },
   {
    "box": {
     "id": "ld_freezediv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      402.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "hdr_3_446",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      446.0,
      360.0,
      20.0
     ],
     "text": "3 \u00b7 TEXTURE engine"
    }
   },
   {
    "box": {
     "id": "lbl_tapcount",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      470.0,
      86.0,
      20.0
     ],
     "text": "tapcount"
    }
   },
   {
    "box": {
     "id": "ctl_tapcount",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      470.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_tapcount",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      470.0,
      116.0,
      22.0
     ],
     "text": "prepend tapcount"
    }
   },
   {
    "box": {
     "id": "ld_tapcount",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      470.0,
      96.0,
      22.0
     ],
     "text": "loadmess 12"
    }
   },
   {
    "box": {
     "id": "lbl_basems",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      500.0,
      86.0,
      20.0
     ],
     "text": "basems"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_basems",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      500.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_basems",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      500.0,
      116.0,
      22.0
     ],
     "text": "prepend basems"
    }
   },
   {
    "box": {
     "id": "ld_basems",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      500.0,
      96.0,
      22.0
     ],
     "text": "loadmess 150."
    }
   },
   {
    "box": {
     "id": "lbl_mode",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      530.0,
      86.0,
      20.0
     ],
     "text": "mode"
    }
   },
   {
    "box": {
     "id": "ctl_mode",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      530.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_mode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      530.0,
      116.0,
      22.0
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
      650.0,
      530.0,
      96.0,
      22.0
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "lbl_A",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      560.0,
      86.0,
      20.0
     ],
     "text": "A"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_A",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      560.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_A",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      560.0,
      116.0,
      22.0
     ],
     "text": "prepend A"
    }
   },
   {
    "box": {
     "id": "ld_A",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      560.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "lbl_B",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      590.0,
      86.0,
      20.0
     ],
     "text": "B"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_B",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      590.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_B",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      590.0,
      116.0,
      22.0
     ],
     "text": "prepend B"
    }
   },
   {
    "box": {
     "id": "ld_B",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      590.0,
      96.0,
      22.0
     ],
     "text": "loadmess 6."
    }
   },
   {
    "box": {
     "id": "lbl_fbk",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      620.0,
      86.0,
      20.0
     ],
     "text": "fbk"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_fbk",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      620.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_fbk",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      620.0,
      116.0,
      22.0
     ],
     "text": "prepend fbk"
    }
   },
   {
    "box": {
     "id": "ld_fbk",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      620.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.5"
    }
   },
   {
    "box": {
     "id": "lbl_lopass",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      650.0,
      86.0,
      20.0
     ],
     "text": "lopass"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_lopass",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      650.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lopass",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      650.0,
      116.0,
      22.0
     ],
     "text": "prepend lopass"
    }
   },
   {
    "box": {
     "id": "ld_lopass",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      650.0,
      96.0,
      22.0
     ],
     "text": "loadmess 6000."
    }
   },
   {
    "box": {
     "id": "lbl_freeze",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      680.0,
      86.0,
      20.0
     ],
     "text": "freeze"
    }
   },
   {
    "box": {
     "id": "ctl_freeze",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      680.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_freeze",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      680.0,
      116.0,
      22.0
     ],
     "text": "prepend freeze"
    }
   },
   {
    "box": {
     "id": "ld_freeze",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      680.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "lbl_freezelen",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380.0,
      710.0,
      86.0,
      20.0
     ],
     "text": "freezelen"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_freezelen",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      470.0,
      710.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_freezelen",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      530.0,
      710.0,
      116.0,
      22.0
     ],
     "text": "prepend freezelen"
    }
   },
   {
    "box": {
     "id": "ld_freezelen",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      650.0,
      710.0,
      96.0,
      22.0
     ],
     "text": "loadmess 2000."
    }
   },
   {
    "box": {
     "id": "hdr_4_40",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      40.0,
      360.0,
      20.0
     ],
     "text": "4 \u00b7 LFO (per-tap)"
    }
   },
   {
    "box": {
     "id": "lbl_lforate",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      64.0,
      86.0,
      20.0
     ],
     "text": "lforate"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_lforate",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      64.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lforate",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      64.0,
      116.0,
      22.0
     ],
     "text": "prepend lforate"
    }
   },
   {
    "box": {
     "id": "ld_lforate",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      64.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.3"
    }
   },
   {
    "box": {
     "id": "lbl_lfomode",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      94.0,
      86.0,
      20.0
     ],
     "text": "lfomode"
    }
   },
   {
    "box": {
     "id": "ctl_lfomode",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      94.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfomode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      94.0,
      116.0,
      22.0
     ],
     "text": "prepend lfomode"
    }
   },
   {
    "box": {
     "id": "ld_lfomode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      94.0,
      96.0,
      22.0
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "lbl_lfoA",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      124.0,
      86.0,
      20.0
     ],
     "text": "lfoA"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_lfoA",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      124.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfoA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      124.0,
      116.0,
      22.0
     ],
     "text": "prepend lfoA"
    }
   },
   {
    "box": {
     "id": "ld_lfoA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      124.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "lbl_lfoB",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      154.0,
      86.0,
      20.0
     ],
     "text": "lfoB"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_lfoB",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      154.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfoB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      154.0,
      116.0,
      22.0
     ],
     "text": "prepend lfoB"
    }
   },
   {
    "box": {
     "id": "ld_lfoB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      154.0,
      96.0,
      22.0
     ],
     "text": "loadmess 2."
    }
   },
   {
    "box": {
     "id": "lbl_lfodepth",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      184.0,
      86.0,
      20.0
     ],
     "text": "lfodepth"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_lfodepth",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      184.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfodepth",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      184.0,
      116.0,
      22.0
     ],
     "text": "prepend lfodepth"
    }
   },
   {
    "box": {
     "id": "ld_lfodepth",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      184.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0."
    }
   },
   {
    "box": {
     "id": "lbl_lfoshape",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      214.0,
      86.0,
      20.0
     ],
     "text": "lfoshape"
    }
   },
   {
    "box": {
     "id": "ctl_lfoshape",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      214.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfoshape",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      214.0,
      116.0,
      22.0
     ],
     "text": "prepend lfoshape"
    }
   },
   {
    "box": {
     "id": "ld_lfoshape",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      214.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "hdr_5_258",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      258.0,
      360.0,
      20.0
     ],
     "text": "5 \u00b7 PERFORMANCE"
    }
   },
   {
    "box": {
     "id": "lbl_morph",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      282.0,
      86.0,
      20.0
     ],
     "text": "morph"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_morph",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      282.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_morph",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      282.0,
      116.0,
      22.0
     ],
     "text": "prepend morph"
    }
   },
   {
    "box": {
     "id": "ld_morph",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      282.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0."
    }
   },
   {
    "box": {
     "id": "lbl_gateon",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      312.0,
      86.0,
      20.0
     ],
     "text": "gateon"
    }
   },
   {
    "box": {
     "id": "ctl_gateon",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      312.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_gateon",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      312.0,
      116.0,
      22.0
     ],
     "text": "prepend gateon"
    }
   },
   {
    "box": {
     "id": "ld_gateon",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      312.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "lbl_gatediv",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      342.0,
      86.0,
      20.0
     ],
     "text": "gatediv"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_gatediv",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      342.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_gatediv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      342.0,
      116.0,
      22.0
     ],
     "text": "prepend gatediv"
    }
   },
   {
    "box": {
     "id": "ld_gatediv",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      342.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.25"
    }
   },
   {
    "box": {
     "id": "lbl_gatedepth",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      372.0,
      86.0,
      20.0
     ],
     "text": "gatedepth"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_gatedepth",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      372.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_gatedepth",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      372.0,
      116.0,
      22.0
     ],
     "text": "prepend gatedepth"
    }
   },
   {
    "box": {
     "id": "ld_gatedepth",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      372.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "lbl_gateduty",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      402.0,
      86.0,
      20.0
     ],
     "text": "gateduty"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_gateduty",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      402.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_gateduty",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      402.0,
      116.0,
      22.0
     ],
     "text": "prepend gateduty"
    }
   },
   {
    "box": {
     "id": "ld_gateduty",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      402.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.5"
    }
   },
   {
    "box": {
     "id": "hdr_6_446",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      446.0,
      360.0,
      20.0
     ],
     "text": "6 \u00b7 CRUSH"
    }
   },
   {
    "box": {
     "id": "lbl_crushbits",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      470.0,
      86.0,
      20.0
     ],
     "text": "crushbits"
    }
   },
   {
    "box": {
     "id": "ctl_crushbits",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      470.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_crushbits",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      470.0,
      116.0,
      22.0
     ],
     "text": "prepend crushbits"
    }
   },
   {
    "box": {
     "id": "ld_crushbits",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      470.0,
      96.0,
      22.0
     ],
     "text": "loadmess 16"
    }
   },
   {
    "box": {
     "id": "lbl_downsamp",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      500.0,
      86.0,
      20.0
     ],
     "text": "downsamp"
    }
   },
   {
    "box": {
     "id": "ctl_downsamp",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      500.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_downsamp",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      500.0,
      116.0,
      22.0
     ],
     "text": "prepend downsamp"
    }
   },
   {
    "box": {
     "id": "ld_downsamp",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      500.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1"
    }
   },
   {
    "box": {
     "id": "hdr_7_544",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      544.0,
      360.0,
      20.0
     ],
     "text": "7 \u00b7 EVOLVE"
    }
   },
   {
    "box": {
     "id": "lbl_evolve",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      568.0,
      86.0,
      20.0
     ],
     "text": "evolve"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_evolve",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      568.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_evolve",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      568.0,
      116.0,
      22.0
     ],
     "text": "prepend evolve"
    }
   },
   {
    "box": {
     "id": "ld_evolve",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      568.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0."
    }
   },
   {
    "box": {
     "id": "lbl_evolverate",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      598.0,
      86.0,
      20.0
     ],
     "text": "evolverate"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_evolverate",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      598.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_evolverate",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      598.0,
      116.0,
      22.0
     ],
     "text": "prepend evolverate"
    }
   },
   {
    "box": {
     "id": "ld_evolverate",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      598.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0.05"
    }
   },
   {
    "box": {
     "id": "hdr_8_642",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      642.0,
      360.0,
      20.0
     ],
     "text": "8 \u00b7 STEREO image"
    }
   },
   {
    "box": {
     "id": "lbl_width",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      666.0,
      86.0,
      20.0
     ],
     "text": "width"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_width",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      666.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_width",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      666.0,
      116.0,
      22.0
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
      1040.0,
      666.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "lbl_panmode",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      696.0,
      86.0,
      20.0
     ],
     "text": "panmode"
    }
   },
   {
    "box": {
     "id": "ctl_panmode",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      696.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_panmode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      696.0,
      116.0,
      22.0
     ],
     "text": "prepend panmode"
    }
   },
   {
    "box": {
     "id": "ld_panmode",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      696.0,
      96.0,
      22.0
     ],
     "text": "loadmess 6"
    }
   },
   {
    "box": {
     "id": "lbl_panA",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      726.0,
      86.0,
      20.0
     ],
     "text": "panA"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_panA",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      726.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_panA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      726.0,
      116.0,
      22.0
     ],
     "text": "prepend panA"
    }
   },
   {
    "box": {
     "id": "ld_panA",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      726.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0."
    }
   },
   {
    "box": {
     "id": "lbl_panB",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      756.0,
      86.0,
      20.0
     ],
     "text": "panB"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_panB",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      756.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_panB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      756.0,
      116.0,
      22.0
     ],
     "text": "prepend panB"
    }
   },
   {
    "box": {
     "id": "ld_panB",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      756.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "hdr_9_800",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      800.0,
      360.0,
      20.0
     ],
     "text": "9 \u00b7 OUTPUT"
    }
   },
   {
    "box": {
     "id": "lbl_mix",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      824.0,
      86.0,
      20.0
     ],
     "text": "mix"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_mix",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      824.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_mix",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      824.0,
      116.0,
      22.0
     ],
     "text": "prepend mix"
    }
   },
   {
    "box": {
     "id": "ld_mix",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      824.0,
      96.0,
      22.0
     ],
     "text": "loadmess 0."
    }
   },
   {
    "box": {
     "id": "lbl_outgain",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      854.0,
      86.0,
      20.0
     ],
     "text": "outgain"
    }
   },
   {
    "box": {
     "format": 6,
     "id": "ctl_outgain",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      860.0,
      854.0,
      55.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "pp_outgain",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920.0,
      854.0,
      116.0,
      22.0
     ],
     "text": "prepend outgain"
    }
   },
   {
    "box": {
     "id": "ld_outgain",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040.0,
      854.0,
      96.0,
      22.0
     ],
     "text": "loadmess 1."
    }
   },
   {
    "box": {
     "id": "hdr_TR",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      898.0,
      360.0,
      20.0
     ],
     "text": "10 \u00b7 TRANSPORT"
    }
   },
   {
    "box": {
     "id": "lbl_panic",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      922.0,
      120.0,
      20.0
     ],
     "text": "PANIC"
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
     "parameter_enable": 0,
     "patching_rect": [
      770.0,
      940.0,
      28.0,
      28.0
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
      806.0,
      940.0,
      28.0,
      22.0
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "d_panic",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      806.0,
      968.0,
      56.0,
      22.0
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
      870.0,
      968.0,
      28.0,
      22.0
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
      900.0,
      940.0,
      116.0,
      22.0
     ],
     "text": "prepend panic"
    }
   },
   {
    "box": {
     "id": "lbl_reroll",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      1008.0,
      120.0,
      20.0
     ],
     "text": "REROLL"
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
     "parameter_enable": 0,
     "patching_rect": [
      770.0,
      1026.0,
      28.0,
      28.0
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
      806.0,
      1026.0,
      28.0,
      22.0
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "d_reroll",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      806.0,
      1054.0,
      56.0,
      22.0
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
      870.0,
      1054.0,
      28.0,
      22.0
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
      900.0,
      1026.0,
      116.0,
      22.0
     ],
     "text": "prepend reroll"
    }
   },
   {
    "box": {
     "id": "lbl_clr",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      770.0,
      1094.0,
      220.0,
      20.0
     ],
     "text": "CLEAR (reset to baseline)"
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
     "parameter_enable": 0,
     "patching_rect": [
      770.0,
      1112.0,
      28.0,
      28.0
     ]
    }
   },
   {
    "box": {
     "id": "pbk_hdr",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      632,
      600,
      18
     ],
     "text": "SCENES - persona hybrids (click a row = full state, fully resets). Pure PERSONAS row further down = the four canonical archetypes (Percutiendo / Bailando / Hablando / Patinando)."
    }
   },
   {
    "box": {
     "id": "plbl_0",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      664,
      150,
      18
     ],
     "text": "S1 \u00b7 MURMUR  (Bailando \u00d7 Hablando)"
    }
   },
   {
    "box": {
     "id": "pmsg_0",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      656,
      940,
      34
     ],
     "text": "cloud 0.7, playspeed 1, spmode 7, spA 0.35, spB 1, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 10, basems 300, mode 7, A 1.5, B 2.5, fbk 0.8, lopass 5000, freeze 0, freezelen 1500, lforate 0.5, lfomode 7, lfoA 1, lfoB 2, lfodepth 0.2, lfoshape 1, morph 0, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 16, downsamp 1, evolve 0.3, evolverate 0.05, width 1, panmode 7, panA 0.6, panB 0.5, mix 0.9, outgain 1, diffusion 0.55, tapsync 0, lfosync 0, freezesync 0"
    }
   },
   {
    "box": {
     "id": "plbl_1",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      708,
      150,
      18
     ],
     "text": "S2 \u00b7 STUTTER STEP  (Percutiendo \u00d7 Patinando)"
    }
   },
   {
    "box": {
     "id": "pmsg_1",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      700,
      940,
      34
     ],
     "text": "cloud 0, playspeed 1, spmode 6, spA 0.9, spB 1.4, cloudhold 0, sync 1, bpm 120, tapdiv 0.25, lfodiv 0.5, freezediv 0.25, tapcount 6, basems 120, mode 3, A 1, B 1, fbk 0.75, lopass 7000, freeze 0, freezelen 140, lforate 0.2, lfomode 6, lfoA 1, lfoB 2, lfodepth 0.05, lfoshape 1, morph 0.25, gateon 1, gatediv 0.125, gatedepth 1, gateduty 0.35, crushbits 12, downsamp 2, evolve 0, evolverate 0.03, width 0.8, panmode 6, panA -0.7, panB 0.7, mix 0.95, outgain 1, diffusion 0.05, tapsync 1, lfosync 1, freezesync 1"
    }
   },
   {
    "box": {
     "id": "plbl_2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      752,
      150,
      18
     ],
     "text": "S3 \u00b7 PAVEMENT  (Patinando \u00d7 Hablando)"
    }
   },
   {
    "box": {
     "id": "pmsg_2",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      744,
      940,
      34
     ],
     "text": "cloud 0.3, playspeed 0.8, spmode 7, spA 0.6, spB 0.9, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 0.5, tapcount 9, basems 180, mode 7, A 2, B 2.5, fbk 0.7, lopass 3800, freeze 0, freezelen 300, lforate 3.5, lfomode 7, lfoA 2, lfoB 3, lfodepth 0.4, lfoshape 1, morph 0.55, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 6, downsamp 10, evolve 0.1, evolverate 0.1, width 1, panmode 7, panA 0.9, panB 0.5, mix 0.9, outgain 1, diffusion 0.2, tapsync 0, lfosync 0, freezesync 0"
    }
   },
   {
    "box": {
     "id": "plbl_3",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      796,
      150,
      18
     ],
     "text": "S4 \u00b7 VIGIL  (deep Bailando)"
    }
   },
   {
    "box": {
     "id": "pmsg_3",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      788,
      940,
      34
     ],
     "text": "cloud 0.2, playspeed 0.5, spmode 6, spA 0.98, spB 1.02, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 12, basems 900, mode 4, A 1, B 0.5, fbk 1, lopass 3200, freeze 0, freezelen 2000, lforate 0.04, lfomode 6, lfoA 0.5, lfoB 1.5, lfodepth 0.2, lfoshape 0, morph 0, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 16, downsamp 1, evolve 0.65, evolverate 0.015, width 1, panmode 6, panA -1, panB 1, mix 0.85, outgain 1, diffusion 0.85, tapsync 1, lfosync 1, freezesync 1"
    }
   },
   {
    "box": {
     "id": "c_p5",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      270,
      226,
      340,
      18
     ],
     "text": "P5: Max global transport ON = grid-lock (sync 1); OFF = free-run fallback"
    }
   },
   {
    "box": {
     "id": "bphasor",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      270,
      250,
      130,
      22
     ],
     "text": "phasor~ 4n @lock 1"
    }
   },
   {
    "box": {
     "id": "lbl_diffusion",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      270,
      282,
      86,
      18
     ],
     "text": "diffusion"
    }
   },
   {
    "box": {
     "id": "ctl_diffusion",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      360,
      282,
      55,
      22
     ]
    }
   },
   {
    "box": {
     "id": "pp_diffusion",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      282,
      116,
      22
     ],
     "text": "prepend diffusion"
    }
   },
   {
    "box": {
     "id": "ld_diffusion",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      282,
      96,
      22
     ],
     "text": "loadmess 0"
    }
   },
   {
    "box": {
     "id": "lbl_tapsync",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      270,
      312,
      86,
      18
     ],
     "text": "tapsync"
    }
   },
   {
    "box": {
     "id": "ctl_tapsync",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      360,
      312,
      22,
      22
     ]
    }
   },
   {
    "box": {
     "id": "pp_tapsync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      312,
      116,
      22
     ],
     "text": "prepend tapsync"
    }
   },
   {
    "box": {
     "id": "ld_tapsync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      312,
      96,
      22
     ],
     "text": "loadmess 1"
    }
   },
   {
    "box": {
     "id": "lbl_lfosync",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      270,
      342,
      86,
      18
     ],
     "text": "lfosync"
    }
   },
   {
    "box": {
     "id": "ctl_lfosync",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      360,
      342,
      22,
      22
     ]
    }
   },
   {
    "box": {
     "id": "pp_lfosync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      342,
      116,
      22
     ],
     "text": "prepend lfosync"
    }
   },
   {
    "box": {
     "id": "ld_lfosync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      342,
      96,
      22
     ],
     "text": "loadmess 1"
    }
   },
   {
    "box": {
     "id": "lbl_freezesync",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      270,
      372,
      86,
      18
     ],
     "text": "freezesync"
    }
   },
   {
    "box": {
     "id": "ctl_freezesync",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      360,
      372,
      22,
      22
     ]
    }
   },
   {
    "box": {
     "id": "pp_freezesync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      372,
      116,
      22
     ],
     "text": "prepend freezesync"
    }
   },
   {
    "box": {
     "id": "ld_freezesync",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      372,
      96,
      22
     ],
     "text": "loadmess 1"
    }
   },
   {
    "box": {
     "id": "arch_lbl",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1160,
      900,
      18
     ],
     "text": "PERSONAS - Phase A audition (full states, like presets). Percutiendo: try FREEZE for quantized stutter. Patinando: FREEZE = the cut. Hablando: hit reroll = new utterance."
    }
   },
   {
    "box": {
     "id": "amsg_drummer",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1184,
      940,
      34
     ],
     "text": "cloud 0, playspeed 1, spmode 6, spA 0.9, spB 1.4, cloudhold 0, sync 1, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 8, basems 150, mode 3, A 1, B 1, fbk 0.7, lopass 9000, freeze 0, freezelen 500, lforate 0.1, lfomode 6, lfoA 1, lfoB 2, lfodepth 0, lfoshape 0, morph 0, gateon 1, gatediv 0.25, gatedepth 1, gateduty 0.45, crushbits 16, downsamp 1, evolve 0, evolverate 0.03, width 0.7, panmode 6, panA -0.6, panB 0.6, mix 0.9, outgain 1, diffusion 0.1, tapsync 1, lfosync 1, freezesync 1"
    }
   },
   {
    "box": {
     "id": "albl_drummer",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1191,
      150,
      20
     ],
     "text": "PERCUTIENDO"
    }
   },
   {
    "box": {
     "id": "amsg_dancer",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1228,
      940,
      34
     ],
     "text": "cloud 0.4, playspeed 1, spmode 7, spA 0.06, spB 1, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 12, basems 420, mode 6, A 1, B 8, fbk 1, lopass 4500, freeze 0, freezelen 2000, lforate 0.12, lfomode 6, lfoA 0.5, lfoB 2, lfodepth 0.3, lfoshape 0, morph 0, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 16, downsamp 1, evolve 0.5, evolverate 0.03, width 1, panmode 6, panA -1, panB 1, mix 0.9, outgain 1, diffusion 0.75, tapsync 1, lfosync 1, freezesync 1"
    }
   },
   {
    "box": {
     "id": "albl_dancer",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1235,
      150,
      20
     ],
     "text": "BAILANDO"
    }
   },
   {
    "box": {
     "id": "amsg_talker",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1272,
      940,
      34
     ],
     "text": "cloud 0.25, playspeed 1, spmode 7, spA 0.5, spB 1, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 7, basems 130, mode 7, A 2.5, B 3, fbk 0.55, lopass 6500, freeze 0, freezelen 800, lforate 2.8, lfomode 7, lfoA 1.5, lfoB 2, lfodepth 0.3, lfoshape 1, morph 0, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 16, downsamp 1, evolve 0.15, evolverate 0.08, width 1, panmode 7, panA 0.7, panB 0.5, mix 0.9, outgain 1, diffusion 0.15, tapsync 0, lfosync 0, freezesync 0"
    }
   },
   {
    "box": {
     "id": "albl_talker",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1279,
      150,
      20
     ],
     "text": "HABLANDO"
    }
   },
   {
    "box": {
     "id": "amsg_skater",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1316,
      940,
      34
     ],
     "text": "cloud 0.15, playspeed 1.3, spmode 6, spA 0.9, spB 1.6, cloudhold 0, sync 1, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 0.5, tapcount 10, basems 240, mode 1, A -1.2, B 2, fbk 0.88, lopass 5500, freeze 0, freezelen 220, lforate 0.4, lfomode 6, lfoA 1, lfoB 2, lfodepth 0.12, lfoshape 0, morph 0.4, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 8, downsamp 6, evolve 0, evolverate 0.03, width 1, panmode 6, panA -1, panB 1, mix 0.9, outgain 1, diffusion 0.3, tapsync 1, lfosync 1, freezesync 1"
    }
   },
   {
    "box": {
     "id": "albl_skater",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1323,
      150,
      20
     ],
     "text": "PATINANDO"
    }
   },
   {
    "box": {
     "id": "src_lbl",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1360,
      900,
      18
     ],
     "text": "SOURCE PRESETS (simple, non-persona) - dial MIX for live+texture blend. Harmonic Shadows: melodic/guitar. Vocal Halo: voice (spoken/sung)."
    }
   },
   {
    "box": {
     "id": "srclbl_harmonicshadows",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1391,
      150,
      20
     ],
     "text": "Harmonic Shadows"
    }
   },
   {
    "box": {
     "id": "srcmsg_harmonicshadows",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1384,
      940,
      34
     ],
     "text": "cloud 0.3, playspeed 1, spmode 4, spA 1, spB 1, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 10, basems 140, mode 4, A 1, B 1, fbk 0.62, lopass 6500, freeze 0, freezelen 2000, lforate 0.15, lfomode 6, lfoA 1, lfoB 2, lfodepth 0.15, lfoshape 0, morph 0, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 16, downsamp 1, evolve 0.2, evolverate 0.03, width 1, panmode 6, panA -1, panB 1, mix 0.4, outgain 1, diffusion 0.4, tapsync 1, lfosync 1, freezesync 1"
    }
   },
   {
    "box": {
     "id": "srclbl_vocalhalo",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      40,
      1435,
      150,
      20
     ],
     "text": "Vocal Halo"
    }
   },
   {
    "box": {
     "id": "srcmsg_vocalhalo",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1428,
      940,
      34
     ],
     "text": "cloud 0.5, playspeed 1, spmode 4, spA 0.5, spB 1, cloudhold 0, sync 0, bpm 120, tapdiv 0.5, lfodiv 1, freezediv 1, tapcount 10, basems 320, mode 6, A 1, B 8, fbk 0.7, lopass 5000, freeze 0, freezelen 2000, lforate 0.1, lfomode 6, lfoA 0.5, lfoB 2, lfodepth 0.25, lfoshape 0, morph 0, gateon 0, gatediv 0.25, gatedepth 1, gateduty 0.5, crushbits 16, downsamp 1, evolve 0.3, evolverate 0.04, width 1, panmode 7, panA 0.8, panB 0.5, mix 0.5, outgain 1, diffusion 0.6, tapsync 1, lfosync 1, freezesync 1"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "ld_A",
      0
     ],
     "order": 26,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_B",
      0
     ],
     "order": 25,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_basems",
      0
     ],
     "order": 28,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_bpm",
      0
     ],
     "order": 33,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_cloud",
      0
     ],
     "order": 40,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_cloudhold",
      0
     ],
     "order": 35,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_crushbits",
      0
     ],
     "order": 9,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_downsamp",
      0
     ],
     "order": 8,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_evolve",
      0
     ],
     "order": 7,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_evolverate",
      0
     ],
     "order": 6,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_fbk",
      0
     ],
     "order": 24,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_freeze",
      0
     ],
     "order": 22,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_freezediv",
      0
     ],
     "order": 30,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_freezelen",
      0
     ],
     "order": 21,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_gatedepth",
      0
     ],
     "order": 11,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_gatediv",
      0
     ],
     "order": 12,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_gateduty",
      0
     ],
     "order": 10,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_gateon",
      0
     ],
     "order": 13,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lfoA",
      0
     ],
     "order": 18,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lfoB",
      0
     ],
     "order": 17,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lfodepth",
      0
     ],
     "order": 16,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lfodiv",
      0
     ],
     "order": 31,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lfomode",
      0
     ],
     "order": 19,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lforate",
      0
     ],
     "order": 20,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lfoshape",
      0
     ],
     "order": 15,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_lopass",
      0
     ],
     "order": 23,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_mix",
      0
     ],
     "order": 1,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_mode",
      0
     ],
     "order": 27,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_morph",
      0
     ],
     "order": 14,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_outgain",
      0
     ],
     "order": 0,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_panA",
      0
     ],
     "order": 3,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_panB",
      0
     ],
     "order": 2,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_panmode",
      0
     ],
     "order": 4,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_playspeed",
      0
     ],
     "order": 39,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_spA",
      0
     ],
     "order": 37,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_spB",
      0
     ],
     "order": 36,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_spmode",
      0
     ],
     "order": 38,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_sync",
      0
     ],
     "order": 34,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_tapcount",
      0
     ],
     "order": 29,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_tapdiv",
      0
     ],
     "order": 32,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ld_width",
      0
     ],
     "order": 5,
     "source": [
      "b_clr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "d_panic",
      0
     ],
     "order": 0,
     "source": [
      "b_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "m1_panic",
      0
     ],
     "order": 1,
     "source": [
      "b_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "d_reroll",
      0
     ],
     "order": 0,
     "source": [
      "b_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "m1_reroll",
      0
     ],
     "order": 1,
     "source": [
      "b_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "sel",
      3
     ],
     "source": [
      "clk",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_A",
      0
     ],
     "source": [
      "ctl_A",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_B",
      0
     ],
     "source": [
      "ctl_B",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_basems",
      0
     ],
     "source": [
      "ctl_basems",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_bpm",
      0
     ],
     "source": [
      "ctl_bpm",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_cloud",
      0
     ],
     "source": [
      "ctl_cloud",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_cloudhold",
      0
     ],
     "source": [
      "ctl_cloudhold",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_crushbits",
      0
     ],
     "source": [
      "ctl_crushbits",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_downsamp",
      0
     ],
     "source": [
      "ctl_downsamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_evolve",
      0
     ],
     "source": [
      "ctl_evolve",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_evolverate",
      0
     ],
     "source": [
      "ctl_evolverate",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_fbk",
      0
     ],
     "source": [
      "ctl_fbk",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_freeze",
      0
     ],
     "source": [
      "ctl_freeze",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_freezediv",
      0
     ],
     "source": [
      "ctl_freezediv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_freezelen",
      0
     ],
     "source": [
      "ctl_freezelen",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_gatedepth",
      0
     ],
     "source": [
      "ctl_gatedepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_gatediv",
      0
     ],
     "source": [
      "ctl_gatediv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_gateduty",
      0
     ],
     "source": [
      "ctl_gateduty",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_gateon",
      0
     ],
     "source": [
      "ctl_gateon",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lfoA",
      0
     ],
     "source": [
      "ctl_lfoA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lfoB",
      0
     ],
     "source": [
      "ctl_lfoB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lfodepth",
      0
     ],
     "source": [
      "ctl_lfodepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lfodiv",
      0
     ],
     "source": [
      "ctl_lfodiv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lfomode",
      0
     ],
     "source": [
      "ctl_lfomode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lforate",
      0
     ],
     "source": [
      "ctl_lforate",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lfoshape",
      0
     ],
     "source": [
      "ctl_lfoshape",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_lopass",
      0
     ],
     "source": [
      "ctl_lopass",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_mix",
      0
     ],
     "source": [
      "ctl_mix",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_mode",
      0
     ],
     "source": [
      "ctl_mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_morph",
      0
     ],
     "source": [
      "ctl_morph",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_outgain",
      0
     ],
     "source": [
      "ctl_outgain",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_panA",
      0
     ],
     "source": [
      "ctl_panA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_panB",
      0
     ],
     "source": [
      "ctl_panB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_panmode",
      0
     ],
     "source": [
      "ctl_panmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_playspeed",
      0
     ],
     "source": [
      "ctl_playspeed",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_spA",
      0
     ],
     "source": [
      "ctl_spA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_spB",
      0
     ],
     "source": [
      "ctl_spB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_spmode",
      0
     ],
     "source": [
      "ctl_spmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_sync",
      0
     ],
     "source": [
      "ctl_sync",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_tapcount",
      0
     ],
     "source": [
      "ctl_tapcount",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_tapdiv",
      0
     ],
     "source": [
      "ctl_tapdiv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_width",
      0
     ],
     "source": [
      "ctl_width",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "m0_panic",
      0
     ],
     "source": [
      "d_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "m0_reroll",
      0
     ],
     "source": [
      "d_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "osc",
      0
     ],
     "source": [
      "freq",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "mgl",
      0
     ],
     "source": [
      "gen",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "mgr",
      0
     ],
     "source": [
      "gen",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_A",
      0
     ],
     "source": [
      "ld_A",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_B",
      0
     ],
     "source": [
      "ld_B",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_basems",
      0
     ],
     "source": [
      "ld_basems",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_bpm",
      0
     ],
     "source": [
      "ld_bpm",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_cloud",
      0
     ],
     "source": [
      "ld_cloud",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_cloudhold",
      0
     ],
     "source": [
      "ld_cloudhold",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_crushbits",
      0
     ],
     "source": [
      "ld_crushbits",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_downsamp",
      0
     ],
     "source": [
      "ld_downsamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_evolve",
      0
     ],
     "source": [
      "ld_evolve",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_evolverate",
      0
     ],
     "source": [
      "ld_evolverate",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_fbk",
      0
     ],
     "source": [
      "ld_fbk",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_freeze",
      0
     ],
     "source": [
      "ld_freeze",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_freezediv",
      0
     ],
     "source": [
      "ld_freezediv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_freezelen",
      0
     ],
     "source": [
      "ld_freezelen",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_gatedepth",
      0
     ],
     "source": [
      "ld_gatedepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_gatediv",
      0
     ],
     "source": [
      "ld_gatediv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_gateduty",
      0
     ],
     "source": [
      "ld_gateduty",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_gateon",
      0
     ],
     "source": [
      "ld_gateon",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lfoA",
      0
     ],
     "source": [
      "ld_lfoA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lfoB",
      0
     ],
     "source": [
      "ld_lfoB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lfodepth",
      0
     ],
     "source": [
      "ld_lfodepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lfodiv",
      0
     ],
     "source": [
      "ld_lfodiv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lfomode",
      0
     ],
     "source": [
      "ld_lfomode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lforate",
      0
     ],
     "source": [
      "ld_lforate",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lfoshape",
      0
     ],
     "source": [
      "ld_lfoshape",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_lopass",
      0
     ],
     "source": [
      "ld_lopass",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_mix",
      0
     ],
     "source": [
      "ld_mix",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_mode",
      0
     ],
     "source": [
      "ld_mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_morph",
      0
     ],
     "source": [
      "ld_morph",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_outgain",
      0
     ],
     "source": [
      "ld_outgain",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_panA",
      0
     ],
     "source": [
      "ld_panA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_panB",
      0
     ],
     "source": [
      "ld_panB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_panmode",
      0
     ],
     "source": [
      "ld_panmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_playspeed",
      0
     ],
     "source": [
      "ld_playspeed",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_spA",
      0
     ],
     "source": [
      "ld_spA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_spB",
      0
     ],
     "source": [
      "ld_spB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_spmode",
      0
     ],
     "source": [
      "ld_spmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_sync",
      0
     ],
     "source": [
      "ld_sync",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_tapcount",
      0
     ],
     "source": [
      "ld_tapcount",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_tapdiv",
      0
     ],
     "source": [
      "ld_tapdiv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "ctl_width",
      0
     ],
     "source": [
      "ld_width",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_panic",
      0
     ],
     "source": [
      "m0_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_reroll",
      0
     ],
     "source": [
      "m0_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_panic",
      0
     ],
     "source": [
      "m1_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pp_reroll",
      0
     ],
     "source": [
      "m1_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "clk",
      0
     ],
     "source": [
      "met",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "met",
      0
     ],
     "source": [
      "mettog",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "dac",
      0
     ],
     "source": [
      "mgl",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "dac",
      1
     ],
     "source": [
      "mgr",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "sel",
      2
     ],
     "source": [
      "noi",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "sel",
      1
     ],
     "source": [
      "osc",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "sel",
      4
     ],
     "source": [
      "pl",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pl",
      0
     ],
     "source": [
      "pl_loop",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "pl",
      0
     ],
     "source": [
      "pl_tog",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "sel",
      0
     ],
     "source": [
      "plus",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_A",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_B",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_basems",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_bpm",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_cloud",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_cloudhold",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_crushbits",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_downsamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_evolve",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_evolverate",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_fbk",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_freeze",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_freezediv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_freezelen",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_gatedepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_gatediv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_gateduty",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_gateon",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lfoA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lfoB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lfodepth",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lfodiv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lfomode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lforate",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lfoshape",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_lopass",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_mix",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_mode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_morph",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_outgain",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_panA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_panB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_panic",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_panmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_playspeed",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_reroll",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_spA",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_spB",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_spmode",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_sync",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_tapcount",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_tapdiv",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "source": [
      "pp_width",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "plus",
      0
     ],
     "source": [
      "rg",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      1
     ],
     "order": 0,
     "source": [
      "sel",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "gen",
      0
     ],
     "order": 1,
     "source": [
      "sel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pmsg_0",
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
      "pmsg_1",
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
      "pmsg_2",
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
      "pmsg_3",
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
      "bphasor",
      0
     ],
     "destination": [
      "gen",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ctl_diffusion",
      0
     ],
     "destination": [
      "pp_diffusion",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_diffusion",
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
      "ld_diffusion",
      0
     ],
     "destination": [
      "ctl_diffusion",
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
      "ld_diffusion",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ctl_tapsync",
      0
     ],
     "destination": [
      "pp_tapsync",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_tapsync",
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
      "ld_tapsync",
      0
     ],
     "destination": [
      "ctl_tapsync",
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
      "ld_tapsync",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ctl_lfosync",
      0
     ],
     "destination": [
      "pp_lfosync",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_lfosync",
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
      "ld_lfosync",
      0
     ],
     "destination": [
      "ctl_lfosync",
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
      "ld_lfosync",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ctl_freezesync",
      0
     ],
     "destination": [
      "pp_freezesync",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pp_freezesync",
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
      "ld_freezesync",
      0
     ],
     "destination": [
      "ctl_freezesync",
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
      "ld_freezesync",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "amsg_drummer",
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
      "amsg_dancer",
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
      "amsg_talker",
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
      "amsg_skater",
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
      "srcmsg_harmonicshadows",
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
      "srcmsg_vocalhalo",
      0
     ],
     "destination": [
      "gen",
      0
     ]
    }
   }
  ],
  "parameters": {
   "inherited_shortname": 1
  },
  "autosave": 0
 }
}