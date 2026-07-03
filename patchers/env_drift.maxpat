{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 720.0, 480.0 ],
		"boxes" : [
			{ "box" : { "comment" : "run 0/1 (loop drift)", "id" : "in-go",   "index" : 1, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "min", "id" : "in-min", "index" : 2, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 90.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "max", "id" : "in-max", "index" : 3, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 140.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "ramp time ms", "id" : "in-time", "index" : 4, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 190.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "sel1", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 2, "outlettype" : [ "bang", "" ], "patching_rect" : [ 40.0, 70.0, 50.0, 22.0 ], "text" : "sel 1" } },
			{ "box" : { "id" : "gate", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 120.0, 70.0, 50.0, 22.0 ], "text" : "gate" } },

			{ "box" : { "id" : "rng", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 40.0, 130.0, 90.0, 22.0 ], "text" : "random 1001" } },
			{ "box" : { "id" : "div", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "float" ], "patching_rect" : [ 40.0, 165.0, 60.0, 22.0 ], "text" : "/ 1000." } },
			{ "box" : { "id" : "exprt", "maxclass" : "newobj", "numinlets" : 3, "numoutlets" : 1, "outlettype" : [ "float" ], "patching_rect" : [ 40.0, 205.0, 180.0, 22.0 ], "text" : "expr $f1 * ($f2 - $f3) + $f3" } },

			{ "box" : { "id" : "pak", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 250.0, 100.0, 22.0 ], "text" : "pack 0. 1000" } },
			{ "box" : { "id" : "line", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 2, "outlettype" : [ "float", "bang" ], "patching_rect" : [ 40.0, 290.0, 60.0, 22.0 ], "text" : "line" } },

			{ "box" : { "comment" : "out (drifting float)", "id" : "out", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 340.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 260.0, 70.0, 440.0, 250.0 ], "text" : "ENV DRIFT — a wandering control ramp (Haiku-style line envelope).\n\nSet RUN to 1: it ramps to a random target inside [MIN..MAX] over RAMP TIME ms; on arrival it picks a new target and ramps again — endless organic motion. RUN 0 stops after the current ramp finishes.\n\nPatch the OUT into any parameter inlet: a distribution A or B arg (so the texture morphs), GLOBAL SPEED, a gain, WIDTH, etc.\n\nTips: long times (5000-30000 ms) = slow evolving beds; short times = nervous movement. Narrow MIN/MAX = subtle, wide = dramatic. Use several instances on different params for independent breathing rhythms.\n\nRNBO note: line + random + expr are all gen/RNBO-friendly; at CP5 these become signal-rate ramps driving params." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "in-go", 0 ], "destination" : [ "sel1", 0 ] } },
			{ "patchline" : { "source" : [ "in-go", 0 ], "destination" : [ "gate", 0 ] } },
			{ "patchline" : { "source" : [ "sel1", 0 ], "destination" : [ "rng", 0 ] } },
			{ "patchline" : { "source" : [ "gate", 0 ], "destination" : [ "rng", 0 ] } },
			{ "patchline" : { "source" : [ "rng", 0 ], "destination" : [ "div", 0 ] } },
			{ "patchline" : { "source" : [ "div", 0 ], "destination" : [ "exprt", 0 ] } },
			{ "patchline" : { "source" : [ "in-max", 0 ], "destination" : [ "exprt", 1 ] } },
			{ "patchline" : { "source" : [ "in-min", 0 ], "destination" : [ "exprt", 2 ] } },
			{ "patchline" : { "source" : [ "exprt", 0 ], "destination" : [ "pak", 0 ] } },
			{ "patchline" : { "source" : [ "in-time", 0 ], "destination" : [ "pak", 1 ] } },
			{ "patchline" : { "source" : [ "pak", 0 ], "destination" : [ "line", 0 ] } },
			{ "patchline" : { "source" : [ "line", 0 ], "destination" : [ "out", 0 ] } },
			{ "patchline" : { "source" : [ "line", 1 ], "destination" : [ "gate", 1 ] } }
		]
	}
}
