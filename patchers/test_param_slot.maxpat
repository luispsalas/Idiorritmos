{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 560.0, 360.0 ],
		"boxes" : [
			{ "box" : { "id" : "nman", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 40.0, 40.0, 60.0, 22.0 ] } },
			{ "box" : { "id" : "c-man", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 105.0, 42.0, 100.0, 20.0 ], "text" : "manual (change me)" } },

			{ "box" : { "id" : "lm-en", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 210.0, 20.0, 90.0, 22.0 ], "text" : "loadmess 0" } },
			{ "box" : { "id" : "tog-en", "maxclass" : "toggle", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 210.0, 50.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "c-en", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 240.0, 52.0, 90.0, 20.0 ], "text" : "env enable" } },

			{ "box" : { "id" : "lm-run", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 350.0, 20.0, 90.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "tog-run", "maxclass" : "toggle", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 350.0, 50.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "c-run", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 380.0, 52.0, 60.0, 20.0 ], "text" : "env run" } },
			{ "box" : { "id" : "lm-min", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 350.0, 90.0, 90.0, 22.0 ], "text" : "loadmess 0" } },
			{ "box" : { "id" : "lm-max", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 350.0, 118.0, 100.0, 22.0 ], "text" : "loadmess 100" } },
			{ "box" : { "id" : "lm-time", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 350.0, 146.0, 100.0, 22.0 ], "text" : "loadmess 4000" } },

			{ "box" : { "id" : "env", "maxclass" : "newobj", "numinlets" : 4, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 150.0, 160.0, 22.0 ], "text" : "env_drift" } },

			{ "box" : { "id" : "slot", "maxclass" : "newobj", "numinlets" : 3, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 210.0, 160.0, 22.0 ], "text" : "param_slot" } },

			{ "box" : { "id" : "disp", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 40.0, 260.0, 80.0, 30.0 ], "fontsize" : 18.0 } },
			{ "box" : { "id" : "c-disp", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 130.0, 268.0, 360.0, 20.0 ], "text" : "VALUE OUT — toggle 'env enable': switches manual <-> drifting" } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "lm-en", 0 ], "destination" : [ "tog-en", 0 ] } },
			{ "patchline" : { "source" : [ "tog-en", 0 ], "destination" : [ "slot", 2 ] } },
			{ "patchline" : { "source" : [ "nman", 0 ], "destination" : [ "slot", 0 ] } },

			{ "patchline" : { "source" : [ "lm-run", 0 ], "destination" : [ "tog-run", 0 ] } },
			{ "patchline" : { "source" : [ "tog-run", 0 ], "destination" : [ "env", 0 ] } },
			{ "patchline" : { "source" : [ "lm-min", 0 ], "destination" : [ "env", 1 ] } },
			{ "patchline" : { "source" : [ "lm-max", 0 ], "destination" : [ "env", 2 ] } },
			{ "patchline" : { "source" : [ "lm-time", 0 ], "destination" : [ "env", 3 ] } },
			{ "patchline" : { "source" : [ "env", 0 ], "destination" : [ "slot", 1 ] } },

			{ "patchline" : { "source" : [ "slot", 0 ], "destination" : [ "disp", 0 ] } }
		]
	}
}
