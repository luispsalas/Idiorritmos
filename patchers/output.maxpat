{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 700.0, 420.0 ],
		"boxes" : [
			{ "box" : { "comment" : "in (mc stereo)", "id" : "in-sig", "index" : 1, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "master gain 0-1", "id" : "in-gain", "index" : 2, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 120.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "pak-g", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 120.0, 70.0, 60.0, 22.0 ], "text" : "pak f 30" } },
			{ "box" : { "id" : "line-g", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 2, "outlettype" : [ "signal", "bang" ], "patching_rect" : [ 120.0, 110.0, 45.0, 22.0 ], "text" : "line~" } },

			{ "box" : { "id" : "gain", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 160.0, 50.0, 22.0 ], "text" : "mc.*~" } },
			{ "box" : { "id" : "limi", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 200.0, 130.0, 22.0 ], "text" : "mc.limi~ @chans 2" } },

			{ "box" : { "comment" : "out (mc stereo, limited)", "id" : "out", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 250.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 220.0, 70.0, 440.0, 180.0 ], "text" : "OUTPUT — master gain + brickwall limiter.\n\nGAIN 0-1 is smoothed over 30 ms (line~) so moves are click-free; mc.limi~ @chans 2 catches feedback/freeze runaway before the DAC.\n\n⚠️ line~ starts at 0, so the host patch MUST send an initial gain (e.g. loadmess 0.8) or there is silence. Gain 0 = mute.\n\nConnect this last in the chain: ...stereo_image -> output -> mc.ezdac~ (or the plugin out at RNBO stage)." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "in-gain", 0 ], "destination" : [ "pak-g", 0 ] } },
			{ "patchline" : { "source" : [ "pak-g", 0 ], "destination" : [ "line-g", 0 ] } },
			{ "patchline" : { "source" : [ "line-g", 0 ], "destination" : [ "gain", 1 ] } },
			{ "patchline" : { "source" : [ "in-sig", 0 ], "destination" : [ "gain", 0 ] } },
			{ "patchline" : { "source" : [ "gain", 0 ], "destination" : [ "limi", 0 ] } },
			{ "patchline" : { "source" : [ "limi", 0 ], "destination" : [ "out", 0 ] } }
		]
	}
}
