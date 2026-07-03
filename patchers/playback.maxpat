{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 900.0, 560.0 ],
		"boxes" : [
			{ "box" : { "comment" : "load msg (replace/read)", "id" : "in-load",  "index" : 1, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "SPEED dist msg (mode A B)", "id" : "in-speeddist", "index" : 2, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 120.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "global speed (x)", "id" : "in-globalspeed", "index" : 3, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 200.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "play 0/1", "id" : "in-play", "index" : 4, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 280.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "restart (bang) — re-aligns all voices to start", "id" : "in-restart", "index" : 5, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 360.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "buf", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "bang" ], "patching_rect" : [ 40.0, 90.0, 160.0, 22.0 ], "text" : "buffer~ mctex_clip" } },

			{ "box" : { "id" : "sig-speed", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 120.0, 90.0, 170.0, 22.0 ], "text" : "mc.sig~ 1. @chans 16" } },
			{ "box" : { "id" : "spdmul", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 120.0, 140.0, 50.0, 22.0 ], "text" : "mc.*~" } },

			{ "box" : { "id" : "selplay", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 3, "outlettype" : [ "bang", "bang", "" ], "patching_rect" : [ 280.0, 70.0, 60.0, 22.0 ], "text" : "sel 1 0" } },
			{ "box" : { "id" : "msg-startloop", "maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 280.0, 110.0, 70.0, 22.0 ], "text" : "startloop" } },
			{ "box" : { "id" : "msg-stop", "maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 360.0, 110.0, 50.0, 22.0 ], "text" : "stop" } },

			{ "box" : { "id" : "groove", "maxclass" : "newobj", "numinlets" : 3, "numoutlets" : 2, "outlettype" : [ "multichannelsignal", "multichannelsignal" ], "patching_rect" : [ 120.0, 190.0, 260.0, 22.0 ], "text" : "mc.groove~ mctex_clip @chans 16 @loop 1" } },
			{ "box" : { "id" : "mixdown", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 120.0, 250.0, 200.0, 22.0 ], "text" : "mc.mixdown~ 2 @autogain 1" } },

			{ "box" : { "comment" : "out (stereo)", "id" : "out", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 120.0, 310.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 420.0, 90.0, 460.0, 280.0 ], "text" : "PLAYBACK — 16-voice looped clip player (mc.groove~).\n\nEach of the 16 voices plays the same buffer (mctex_clip) at its OWN playback increment (speed). The SPEED DISTRIBUTION message sets the per-voice increments via the MC wrapper, then GLOBAL SPEED scales them all.\n  speed = 1 -> normal, 2 -> double (octave up), 0.5 -> half (octave down).\nDistribution modes (same family as the texture engine): spread <lo> <hi> = even fan of speeds; harmonic 1 1 = 1x,2x,3x... (chord); deviate <w> 1 = subtle detune cloud (re-roll changes it); subharmonic 1 1 = downward cluster.\n\nLOAD: send 'replace' (file dialog) or 'read <name>' to load a clip into the buffer.\nPLAY 0/1: startloop / stop.\n\nThis is the Haiku-style source: one recording becomes a shimmering multi-speed texture, then feeds pre_process -> texture_engine. Envelopes (next module) will animate the distribution A/B over time." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "in-load", 0 ], "destination" : [ "buf", 0 ] } },
			{ "patchline" : { "source" : [ "buf", 0 ], "destination" : [ "msg-startloop", 0 ] } },
			{ "patchline" : { "source" : [ "in-restart", 0 ], "destination" : [ "msg-startloop", 0 ] } },
			{ "patchline" : { "source" : [ "in-speeddist", 0 ], "destination" : [ "sig-speed", 0 ] } },
			{ "patchline" : { "source" : [ "sig-speed", 0 ], "destination" : [ "spdmul", 0 ] } },
			{ "patchline" : { "source" : [ "in-globalspeed", 0 ], "destination" : [ "spdmul", 1 ] } },
			{ "patchline" : { "source" : [ "spdmul", 0 ], "destination" : [ "groove", 0 ] } },
			{ "patchline" : { "source" : [ "in-play", 0 ], "destination" : [ "selplay", 0 ] } },
			{ "patchline" : { "source" : [ "selplay", 0 ], "destination" : [ "msg-startloop", 0 ] } },
			{ "patchline" : { "source" : [ "selplay", 1 ], "destination" : [ "msg-stop", 0 ] } },
			{ "patchline" : { "source" : [ "msg-startloop", 0 ], "destination" : [ "groove", 0 ] } },
			{ "patchline" : { "source" : [ "msg-stop", 0 ], "destination" : [ "groove", 0 ] } },
			{ "patchline" : { "source" : [ "groove", 0 ], "destination" : [ "mixdown", 0 ] } },
			{ "patchline" : { "source" : [ "mixdown", 0 ], "destination" : [ "out", 0 ] } }
		]
	}
}
