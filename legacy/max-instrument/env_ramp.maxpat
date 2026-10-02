{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 720.0, 440.0 ],
		"boxes" : [
			{ "box" : { "comment" : "trigger (bang) — start the timed move", "id" : "in-trig", "index" : 1, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "start (in value)", "id" : "in-start", "index" : 2, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 90.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "end (out value)", "id" : "in-end", "index" : 3, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 140.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "time ms (duration)", "id" : "in-time", "index" : 4, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 190.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "tb", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "bang", "bang" ], "patching_rect" : [ 40.0, 70.0, 60.0, 22.0 ], "text" : "t b b" } },

			{ "box" : { "id" : "f-start", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "float" ], "patching_rect" : [ 40.0, 120.0, 60.0, 22.0 ], "text" : "f" } },
			{ "box" : { "id" : "f-end", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "float" ], "patching_rect" : [ 120.0, 120.0, 60.0, 22.0 ], "text" : "f" } },

			{ "box" : { "id" : "pak", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 120.0, 165.0, 110.0, 22.0 ], "text" : "pack 0. 1000" } },
			{ "box" : { "id" : "line", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 2, "outlettype" : [ "float", "bang" ], "patching_rect" : [ 40.0, 210.0, 60.0, 22.0 ], "text" : "line" } },

			{ "box" : { "comment" : "value (in->out)", "id" : "out-val", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 260.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "done (bang at end)", "id" : "out-done", "index" : 2, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 90.0, 260.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 270.0, 70.0, 430.0, 240.0 ], "text" : "ENV RAMP — a one-shot TIMED move with a clear in and out.\n\nTRIGGER jumps to START (the 'in'), then ramps to END (the 'out') over TIME ms. The DONE outlet bangs exactly when the move finishes.\n\nUse for fixed-length takes: trigger this together with the playback RESTART to begin a recording at a defined point, and use DONE to mark/stop the take. START and END give you a clear in and out value (e.g. fade a distribution arg from tight to wide over exactly 20 s).\n\nDifference vs env_drift: env_drift wanders forever (organic beds); env_ramp is deterministic, timed, one-shot (recordable passes). Both are optional — patch either, or neither (manual control), into a parameter.\n\nFor a clear fade-in AND fade-out within one window, chain two: trigger ramp A (in->peak), its DONE triggers ramp B (peak->out)." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "in-trig", 0 ], "destination" : [ "tb", 0 ] } },
			{ "patchline" : { "source" : [ "tb", 1 ], "destination" : [ "f-start", 0 ] } },
			{ "patchline" : { "source" : [ "tb", 0 ], "destination" : [ "f-end", 0 ] } },
			{ "patchline" : { "source" : [ "in-start", 0 ], "destination" : [ "f-start", 1 ] } },
			{ "patchline" : { "source" : [ "in-end", 0 ], "destination" : [ "f-end", 1 ] } },
			{ "patchline" : { "source" : [ "f-start", 0 ], "destination" : [ "line", 0 ] } },
			{ "patchline" : { "source" : [ "f-end", 0 ], "destination" : [ "pak", 0 ] } },
			{ "patchline" : { "source" : [ "in-time", 0 ], "destination" : [ "pak", 1 ] } },
			{ "patchline" : { "source" : [ "pak", 0 ], "destination" : [ "line", 0 ] } },
			{ "patchline" : { "source" : [ "line", 0 ], "destination" : [ "out-val", 0 ] } },
			{ "patchline" : { "source" : [ "line", 1 ], "destination" : [ "out-done", 0 ] } }
		]
	}
}
