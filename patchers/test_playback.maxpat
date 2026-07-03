{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 720.0, 500.0 ],
		"boxes" : [
			{ "box" : { "id" : "b-load", "maxclass" : "button", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 40.0, 40.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "msg-replace", "maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 72.0, 70.0, 22.0 ], "text" : "replace" } },
			{ "box" : { "id" : "c-load", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 115.0, 74.0, 130.0, 20.0 ], "text" : "load clip into buffer" } },

			{ "box" : { "id" : "c-spd", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 12.0, "patching_rect" : [ 160.0, 110.0, 260.0, 20.0 ], "text" : "SPEED DISTRIBUTION   (mode / A / B)" } },
			{ "box" : { "id" : "umenu-spd", "maxclass" : "umenu", "numinlets" : 1, "numoutlets" : 3, "outlettype" : [ "int", "", "" ], "patching_rect" : [ 160.0, 132.0, 160.0, 22.0 ], "items" : [ "deviate", ",", "exponential", ",", "scaledexponential", ",", "increment", ",", "harmonic", ",", "subharmonic", ",", "spread", ",", "spreadinclusive", ",", "spreadexclusive", ",", "spreadincludesecond", ",", "spreadincludefirst", ",", "replicatevalues" ] } },
			{ "box" : { "id" : "lm-spdmenu", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 160.0, 160.0, 70.0, 22.0 ], "text" : "loadmess 6" } },
			{ "box" : { "id" : "fa-spd", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 330.0, 132.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "lm-spdA", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 330.0, 160.0, 70.0, 22.0 ], "text" : "loadmess 0.9" } },
			{ "box" : { "id" : "fb-spd", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 390.0, 132.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "lm-spdB", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 390.0, 160.0, 70.0, 22.0 ], "text" : "loadmess 1.4" } },
			{ "box" : { "id" : "pak-spd", "maxclass" : "newobj", "numinlets" : 3, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 160.0, 195.0, 140.0, 22.0 ], "text" : "pak spread 1. 1." } },
			{ "box" : { "id" : "b-reroll", "maxclass" : "button", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 470.0, 132.0, 28.0, 28.0 ] } },
			{ "box" : { "id" : "c-reroll", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 470.0, 162.0, 160.0, 20.0 ], "text" : "RE-ROLL (deviate)" } },

			{ "box" : { "id" : "lm-gs", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 160.0, 240.0, 90.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "ngs", "maxclass" : "flonum", "numinlets" : 1, "numoutlets" : 2, "outlettype" : [ "", "bang" ], "patching_rect" : [ 255.0, 240.0, 50.0, 22.0 ] } },
			{ "box" : { "id" : "c-gs", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 312.0, 242.0, 120.0, 20.0 ], "text" : "global speed (x)" } },

			{ "box" : { "id" : "lm-play", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 160.0, 274.0, 90.0, 22.0 ], "text" : "loadmess 1" } },
			{ "box" : { "id" : "tog-play", "maxclass" : "toggle", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 255.0, 272.0, 24.0, 24.0 ] } },
			{ "box" : { "id" : "c-play", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 285.0, 276.0, 120.0, 20.0 ], "text" : "play (startloop/stop)" } },

			{ "box" : { "id" : "b-restart", "maxclass" : "button", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 400.0, 272.0, 28.0, 28.0 ] } },
			{ "box" : { "id" : "c-restart", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 434.0, 276.0, 200.0, 20.0 ], "text" : "RESTART (re-align voices to start)" } },

			{ "box" : { "id" : "playback", "maxclass" : "newobj", "numinlets" : 5, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 320.0, 300.0, 22.0 ], "text" : "playback" } },
			{ "box" : { "id" : "limi", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 360.0, 130.0, 22.0 ], "text" : "mc.limi~ @chans 2" } },
			{ "box" : { "id" : "dac", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 400.0, 90.0, 22.0 ], "text" : "mc.ezdac~" } },
			{ "box" : { "id" : "c-dac", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 145.0, 402.0, 280.0, 20.0 ], "text" : "click mc.ezdac~ to start audio, then LOAD a clip" } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "b-load", 0 ], "destination" : [ "msg-replace", 0 ] } },
			{ "patchline" : { "source" : [ "msg-replace", 0 ], "destination" : [ "playback", 0 ] } },

			{ "patchline" : { "source" : [ "lm-spdmenu", 0 ], "destination" : [ "umenu-spd", 0 ] } },
			{ "patchline" : { "source" : [ "umenu-spd", 1 ], "destination" : [ "pak-spd", 0 ] } },
			{ "patchline" : { "source" : [ "lm-spdA", 0 ], "destination" : [ "fa-spd", 0 ] } },
			{ "patchline" : { "source" : [ "fa-spd", 0 ], "destination" : [ "pak-spd", 1 ] } },
			{ "patchline" : { "source" : [ "lm-spdB", 0 ], "destination" : [ "fb-spd", 0 ] } },
			{ "patchline" : { "source" : [ "fb-spd", 0 ], "destination" : [ "pak-spd", 2 ] } },
			{ "patchline" : { "source" : [ "pak-spd", 0 ], "destination" : [ "playback", 1 ] } },
			{ "patchline" : { "source" : [ "b-reroll", 0 ], "destination" : [ "umenu-spd", 0 ] } },

			{ "patchline" : { "source" : [ "lm-gs", 0 ], "destination" : [ "ngs", 0 ] } },
			{ "patchline" : { "source" : [ "ngs", 0 ], "destination" : [ "playback", 2 ] } },

			{ "patchline" : { "source" : [ "lm-play", 0 ], "destination" : [ "tog-play", 0 ] } },
			{ "patchline" : { "source" : [ "tog-play", 0 ], "destination" : [ "playback", 3 ] } },
			{ "patchline" : { "source" : [ "b-restart", 0 ], "destination" : [ "playback", 4 ] } },

			{ "patchline" : { "source" : [ "playback", 0 ], "destination" : [ "limi", 0 ] } },
			{ "patchline" : { "source" : [ "limi", 0 ], "destination" : [ "dac", 0 ] } }
		]
	}
}
