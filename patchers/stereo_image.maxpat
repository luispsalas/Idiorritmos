{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 720.0, 480.0 ],
		"boxes" : [
			{ "box" : { "comment" : "in (mc 10ch texture)", "id" : "in-mc",   "index" : 1, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "width 0-1",            "id" : "in-width", "index" : 2, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 300.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "sig-pan", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 300.0, 80.0, 360.0, 22.0 ], "text" : "mc.sig~ @values 0 0.111 0.222 0.333 0.444 0.556 0.667 0.778 0.889 1 @chans 10" } },
			{ "box" : { "id" : "center",  "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 300.0, 120.0, 70.0, 22.0 ], "text" : "mc.-~ 0.5" } },
			{ "box" : { "id" : "scalew",  "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 300.0, 160.0, 50.0, 22.0 ], "text" : "mc.*~" } },
			{ "box" : { "id" : "recenter","maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 300.0, 200.0, 70.0, 22.0 ], "text" : "mc.+~ 0.5" } },

			{ "box" : { "id" : "mixdown", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 260.0, 240.0, 22.0 ], "text" : "mc.mixdown~ 2 @pancontrolmode 1 @autogain 1" } },

			{ "box" : { "comment" : "out (mc stereo)", "id" : "out", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 320.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 40.0, 370.0, 620.0, 80.0 ], "text" : "STEREO IMAGE: spreads the 10 mc taps across the stereo field. Each tap has a fixed pan position (0=left .. 1=right); WIDTH scales them around center (0 = all centered/mono, 1 = full spread). mc.mixdown~ @pancontrolmode 1 reads pan as 0-1; @autogain keeps level constant as the image narrows." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "in-mc", 0 ], "destination" : [ "mixdown", 0 ] } },
			{ "patchline" : { "source" : [ "sig-pan", 0 ], "destination" : [ "center", 0 ] } },
			{ "patchline" : { "source" : [ "center", 0 ], "destination" : [ "scalew", 0 ] } },
			{ "patchline" : { "source" : [ "in-width", 0 ], "destination" : [ "scalew", 1 ] } },
			{ "patchline" : { "source" : [ "scalew", 0 ], "destination" : [ "recenter", 0 ] } },
			{ "patchline" : { "source" : [ "recenter", 0 ], "destination" : [ "mixdown", 1 ] } },
			{ "patchline" : { "source" : [ "mixdown", 0 ], "destination" : [ "out", 0 ] } }
		]
	}
}
