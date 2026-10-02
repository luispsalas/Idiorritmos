{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 820.0, 640.0 ],
		"boxes" : [
			{ "box" : { "id" : "b-load", "maxclass" : "button", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 40.0, 40.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "msg-replace", "maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 72.0, 70.0, 22.0 ], "text" : "replace" } },
			{ "box" : { "id" : "c-load", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 115.0, 74.0, 130.0, 20.0 ], "text" : "load clip" } },

			{ "box" : { "id" : "lm-play", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 110.0, 90.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "tog-play", "maxclass" : "toggle", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 135.0, 110.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "c-play", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 165.0, 112.0, 50.0, 20.0 ], "text" : "play" } },
			{ "box" : { "id" : "b-restart", "maxclass" : "button", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 230.0, 108.0, 28.0, 28.0 ] } },
			{ "box" : { "id" : "c-restart", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 262.0, 112.0, 60.0, 20.0 ], "text" : "restart" } },

			{ "box" : { "id" : "lm-gs", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 150.0, 90.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "ngs", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 135.0, 150.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "c-gs", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 195.0, 152.0, 110.0, 20.0 ], "text" : "global speed (x)" } },

			{ "box" : { "id" : "c-spd", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 12.0, "patching_rect" : [ 300.0, 40.0, 300.0, 20.0 ], "text" : "SPEED DISTRIBUTION  (mode + drifting A / B)" } },
			{ "box" : { "id" : "umenu-spd", "maxclass" : "umenu", "numinlets" : 1, "numoutlets" : 3, "outlettype" : [ "int", "", "" ], "patching_rect" : [ 300.0, 62.0, 160.0, 22.0 ], "items" : [ "deviate", ",", "exponential", ",", "scaledexponential", ",", "increment", ",", "harmonic", ",", "subharmonic", ",", "spread", ",", "spreadinclusive", ",", "spreadexclusive", ",", "spreadincludesecond", ",", "spreadincludefirst", ",", "replicatevalues" ] } },
			{ "box" : { "id" : "lm-spdmenu", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 300.0, 90.0, 70.0, 22.0 ], "text" : "loadmess 6" } },
			{ "box" : { "id" : "b-reroll", "maxclass" : "button", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 480.0, 62.0, 28.0, 28.0 ] } },
			{ "box" : { "id" : "c-reroll", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 512.0, 66.0, 140.0, 20.0 ], "text" : "RE-ROLL (deviate)" } },

			{ "box" : { "id" : "c-row", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 340.0, 130.0, 200.0, 18.0 ], "text" : "run   /   min   /   max   /   time(ms)" } },

			{ "box" : { "id" : "c-env1", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 300.0, 152.0, 36.0, 20.0 ], "text" : "A:" } },
			{ "box" : { "id" : "tog-e1", "maxclass" : "toggle", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 340.0, 150.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "lm-e1run", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 340.0, 180.0, 80.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "nmin1", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 375.0, 150.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "lm-min1", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 425.0, 180.0, 90.0, 22.0 ], "text" : "loadmess 0.8" } },
			{ "box" : { "id" : "nmax1", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 435.0, 150.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "lm-max1", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 525.0, 180.0, 90.0, 22.0 ], "text" : "loadmess 1.2" } },
			{ "box" : { "id" : "ntime1", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 495.0, 150.0, 60.0, 22.0 ] } },
			{ "box" : { "id" : "lm-time1", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 625.0, 180.0, 100.0, 22.0 ], "text" : "loadmess 8000" } },
			{ "box" : { "id" : "env1", "maxclass" : "newobj", "numinlets" : 4, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 300.0, 215.0, 200.0, 22.0 ], "text" : "env_drift" } },

			{ "box" : { "id" : "c-env2", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 300.0, 255.0, 36.0, 20.0 ], "text" : "B:" } },
			{ "box" : { "id" : "tog-e2", "maxclass" : "toggle", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 340.0, 253.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "lm-e2run", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 340.0, 283.0, 80.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "nmin2", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 375.0, 253.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "lm-min2", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 425.0, 283.0, 90.0, 22.0 ], "text" : "loadmess 1." } },
			{ "box" : { "id" : "nmax2", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 435.0, 253.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "lm-max2", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 525.0, 283.0, 90.0, 22.0 ], "text" : "loadmess 2." } },
			{ "box" : { "id" : "ntime2", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 495.0, 253.0, 60.0, 22.0 ] } },
			{ "box" : { "id" : "lm-time2", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 625.0, 283.0, 100.0, 22.0 ], "text" : "loadmess 12000" } },
			{ "box" : { "id" : "env2", "maxclass" : "newobj", "numinlets" : 4, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 300.0, 318.0, 200.0, 22.0 ], "text" : "env_drift" } },

			{ "box" : { "id" : "pak-spd", "maxclass" : "newobj", "numinlets" : 3, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 300.0, 375.0, 140.0, 22.0 ], "text" : "pak spread 1. 1." } },

			{ "box" : { "id" : "playback", "maxclass" : "newobj", "numinlets" : 5, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 430.0, 300.0, 22.0 ], "text" : "playback" } },
			{ "box" : { "id" : "limi", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 470.0, 130.0, 22.0 ], "text" : "mc.limi~ @chans 2" } },
			{ "box" : { "id" : "dac", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 510.0, 90.0, 22.0 ], "text" : "mc.ezdac~" } },
			{ "box" : { "id" : "c-dac", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 145.0, 512.0, 320.0, 20.0 ], "text" : "click mc.ezdac~ to start, LOAD a clip — speed cloud drifts via env A/B" } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "b-load", 0 ], "destination" : [ "msg-replace", 0 ] } },
			{ "patchline" : { "source" : [ "msg-replace", 0 ], "destination" : [ "playback", 0 ] } },
			{ "patchline" : { "source" : [ "lm-play", 0 ], "destination" : [ "tog-play", 0 ] } },
			{ "patchline" : { "source" : [ "tog-play", 0 ], "destination" : [ "playback", 3 ] } },
			{ "patchline" : { "source" : [ "b-restart", 0 ], "destination" : [ "playback", 4 ] } },
			{ "patchline" : { "source" : [ "lm-gs", 0 ], "destination" : [ "ngs", 0 ] } },
			{ "patchline" : { "source" : [ "ngs", 0 ], "destination" : [ "playback", 2 ] } },

			{ "patchline" : { "source" : [ "lm-spdmenu", 0 ], "destination" : [ "umenu-spd", 0 ] } },
			{ "patchline" : { "source" : [ "umenu-spd", 1 ], "destination" : [ "pak-spd", 0 ] } },
			{ "patchline" : { "source" : [ "b-reroll", 0 ], "destination" : [ "umenu-spd", 0 ] } },

			{ "patchline" : { "source" : [ "lm-e1run", 0 ], "destination" : [ "tog-e1", 0 ] } },
			{ "patchline" : { "source" : [ "tog-e1", 0 ], "destination" : [ "env1", 0 ] } },
			{ "patchline" : { "source" : [ "lm-min1", 0 ], "destination" : [ "nmin1", 0 ] } },
			{ "patchline" : { "source" : [ "nmin1", 0 ], "destination" : [ "env1", 1 ] } },
			{ "patchline" : { "source" : [ "lm-max1", 0 ], "destination" : [ "nmax1", 0 ] } },
			{ "patchline" : { "source" : [ "nmax1", 0 ], "destination" : [ "env1", 2 ] } },
			{ "patchline" : { "source" : [ "lm-time1", 0 ], "destination" : [ "ntime1", 0 ] } },
			{ "patchline" : { "source" : [ "ntime1", 0 ], "destination" : [ "env1", 3 ] } },
			{ "patchline" : { "source" : [ "env1", 0 ], "destination" : [ "pak-spd", 1 ] } },

			{ "patchline" : { "source" : [ "lm-e2run", 0 ], "destination" : [ "tog-e2", 0 ] } },
			{ "patchline" : { "source" : [ "tog-e2", 0 ], "destination" : [ "env2", 0 ] } },
			{ "patchline" : { "source" : [ "lm-min2", 0 ], "destination" : [ "nmin2", 0 ] } },
			{ "patchline" : { "source" : [ "nmin2", 0 ], "destination" : [ "env2", 1 ] } },
			{ "patchline" : { "source" : [ "lm-max2", 0 ], "destination" : [ "nmax2", 0 ] } },
			{ "patchline" : { "source" : [ "nmax2", 0 ], "destination" : [ "env2", 2 ] } },
			{ "patchline" : { "source" : [ "lm-time2", 0 ], "destination" : [ "ntime2", 0 ] } },
			{ "patchline" : { "source" : [ "ntime2", 0 ], "destination" : [ "env2", 3 ] } },
			{ "patchline" : { "source" : [ "env2", 0 ], "destination" : [ "pak-spd", 2 ] } },

			{ "patchline" : { "source" : [ "pak-spd", 0 ], "destination" : [ "playback", 1 ] } },

			{ "patchline" : { "source" : [ "playback", 0 ], "destination" : [ "limi", 0 ] } },
			{ "patchline" : { "source" : [ "limi", 0 ], "destination" : [ "dac", 0 ] } }
		]
	}
}
