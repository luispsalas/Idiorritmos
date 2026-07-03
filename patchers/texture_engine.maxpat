{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 1200.0, 820.0 ],
		"boxes" : [
			{ "box" : { "comment" : "in L",          "id" : "in-L",        "index" : 1,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "signal" ], "patching_rect" : [ 40.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "in R",          "id" : "in-R",        "index" : 2,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "signal" ], "patching_rect" : [ 90.0,  20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "tap count 1-10","id" : "in-tapcount", "index" : 3,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 140.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "base tap ms",   "id" : "in-base",     "index" : 4,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 190.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "TAP dist msg (mode A B)", "id" : "in-tapdist", "index" : 5, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 240.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "feedback 0-0.99","id" : "in-fb",       "index" : 6,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 290.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "lopass Hz",      "id" : "in-lopass",   "index" : 7,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 340.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "lfo rate Hz",    "id" : "in-lforate",  "index" : 8,  "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 390.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "LFO dist msg (mode A B)", "id" : "in-lfodist", "index" : 9, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 440.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "lfo depth ms",   "id" : "in-lfodepth", "index" : 10, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 490.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "freeze 0/1",     "id" : "in-freeze",   "index" : 11, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 540.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "PANIC (bang)",   "id" : "in-panic",    "index" : 12, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 590.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "sig-index", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 200.0, 90.0, 280.0, 22.0 ], "text" : "mc.sig~ @values 0 1 2 3 4 5 6 7 8 9 @chans 10" } },
			{ "box" : { "id" : "mask",      "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 200.0, 150.0, 70.0, 22.0 ], "text" : "mc.<~ 10" } },

			{ "box" : { "id" : "sig-tap",  "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 560.0, 90.0, 160.0, 22.0 ], "text" : "mc.sig~ 1. @chans 10" } },
			{ "box" : { "id" : "taptime",  "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 560.0, 150.0, 50.0, 22.0 ], "text" : "mc.*~" } },

			{ "box" : { "id" : "sig-lfo",  "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 760.0, 90.0, 160.0, 22.0 ], "text" : "mc.sig~ 1. @chans 10" } },
			{ "box" : { "id" : "lfofreq",  "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 760.0, 150.0, 50.0, 22.0 ], "text" : "mc.*~" } },
			{ "box" : { "id" : "osc",      "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 760.0, 190.0, 140.0, 22.0 ], "text" : "mc.cycle~ @chans 10" } },
			{ "box" : { "id" : "lfoamt",   "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 760.0, 230.0, 50.0, 22.0 ], "text" : "mc.*~" } },
			{ "box" : { "id" : "tmod",     "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 560.0, 270.0, 50.0, 22.0 ], "text" : "mc.+~" } },

			{ "box" : { "id" : "pak-fb",  "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 290.0, 110.0, 60.0, 22.0 ], "text" : "pak f 50" } },
			{ "box" : { "id" : "line-fb", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 2, "outlettype" : [ "signal", "bang" ], "patching_rect" : [ 290.0, 150.0, 45.0, 22.0 ], "text" : "line~" } },

			{ "box" : { "id" : "prep-frz", "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 540.0, 70.0, 100.0, 22.0 ], "text" : "prepend freeze" } },

			{ "box" : { "id" : "t-panic",  "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 3, "outlettype" : [ "bang", "bang", "bang" ], "patching_rect" : [ 1000.0, 70.0, 60.0, 22.0 ], "text" : "t b b b" } },
			{ "box" : { "id" : "msg-clear","maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 960.0, 110.0, 45.0, 22.0 ], "text" : "clear" } },
			{ "box" : { "id" : "msg-frz0", "maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 1015.0, 110.0, 60.0, 22.0 ], "text" : "freeze 0" } },
			{ "box" : { "id" : "msg-fb0",  "maxclass" : "message", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 1085.0, 110.0, 30.0, 22.0 ], "text" : "0" } },

			{ "box" : { "id" : "summono", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "signal" ], "patching_rect" : [ 40.0, 70.0,  35.0, 22.0 ], "text" : "+~" } },
			{ "box" : { "id" : "half",    "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "signal" ], "patching_rect" : [ 40.0, 110.0, 50.0, 22.0 ], "text" : "*~ 0.5" } },
			{ "box" : { "id" : "upmix",   "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 160.0, 160.0, 22.0 ], "text" : "mc.onepole~ 18000 @chans 10" } },
			{ "box" : { "id" : "addin",   "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 330.0, 50.0, 22.0 ], "text" : "mc.+~" } },
			{ "box" : { "id" : "tapin",   "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 380.0, 120.0, 22.0 ], "text" : "mc.tapin~ 2000." } },
			{ "box" : { "id" : "tapout",  "maxclass" : "newobj", "numinlets" : 1, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 430.0, 90.0,  22.0 ], "text" : "mc.tapout~" } },
			{ "box" : { "id" : "maskmul", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 40.0, 480.0, 50.0, 22.0 ], "text" : "mc.*~" } },

			{ "box" : { "id" : "fbfilter","maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 200.0, 480.0, 130.0, 22.0 ], "text" : "mc.onepole~ 8000" } },
			{ "box" : { "id" : "fbgain",  "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "multichannelsignal" ], "patching_rect" : [ 200.0, 520.0, 50.0,  22.0 ], "text" : "mc.*~" } },

			{ "box" : { "comment" : "out (mc N-channel texture)", "id" : "out", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 550.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 560.0, 330.0, 620.0, 460.0 ], "text" : "mc TEXTURES — ENGINE PARAMETER GUIDE\n\nSignal path: in L/R summed to mono, upmixed to 10 channels, fed through a 10-tap modulated delay matrix with a feedback loop, output as a 10-channel mc signal.\n\nTAP COUNT (1-10): active taps (gain mask). More = denser. Judge with CLICK source.\nBASE TAP (ms): overall delay size. ~30-80 = metallic/comb; ~200-600 = spacious echoes.\nFEEDBACK (0-0.99): regeneration. 0 = single pass, 0.9+ = long tail. (Output limiter guards runaway.)\nFEEDBACK LOPASS (Hz): tone of repeats. Low = dark/dub, high = bright.\nLFO RATE (Hz): base speed of per-tap delay modulation. LFO DEPTH (ms): wobble amount (pitch/chorus).\nFREEZE (0/1): native mc.tapin~ buffer lock. PANIC: clear + unfreeze + fb 0 = instant silence.\n\nDISTRIBUTION MODES (the texture core — TAP DIST shapes delay spacing, LFO DIST shapes per-tap modulation rates). Each message OVERWRITES the per-channel values with a different math (they are modes, not layers). Format: <mode> <A> <B>.\n  deviate A=width B=center : random in center±width (re-roll changes it)\n  spread A=start B=end : linear ramp across taps (also spreadinclusive/exclusive/includesecond)\n  increment A=step B=start : arithmetic series start, start+step, ...\n  exponential A=exponent B=base : exponential spacing (negative A grows, positive A -> 0)\n  scaledexponential : exponential, normalized by channel count\n  harmonic A=1 B=fundamental : 1f,2f,3f... (comb/resonant)\n  subharmonic A=1 B=fundamental : f, f/2, f/3... (clustered)\n  replicatevalues : repeat a supplied value set\nThe value set MULTIPLIES base ms (tap) / lfo rate Hz (lfo). e.g. tap 'harmonic 1 1' = harmonic delay series; 'spread 1 8' = delay rake; 'deviate 0.5 1' = organic random.\n\nNOTE (RNBO export): these distribution messages are a Max MC-wrapper authoring feature and will NOT export. At Checkpoint 5, snapshot the chosen per-channel values into mc.sig~ @values constants.\n\nTEST SOURCES: Oscillator/tonal -> freeze drones & LFO wobble. Noise -> diffuse wash. Click/impulse -> hear taps, base, distributions." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "sig-index", 0 ], "destination" : [ "mask", 0 ] } },
			{ "patchline" : { "source" : [ "in-tapcount", 0 ], "destination" : [ "mask", 1 ] } },
			{ "patchline" : { "source" : [ "mask", 0 ], "destination" : [ "maskmul", 1 ] } },

			{ "patchline" : { "source" : [ "in-tapdist", 0 ], "destination" : [ "sig-tap", 0 ] } },
			{ "patchline" : { "source" : [ "sig-tap", 0 ], "destination" : [ "taptime", 0 ] } },
			{ "patchline" : { "source" : [ "in-base", 0 ], "destination" : [ "taptime", 1 ] } },
			{ "patchline" : { "source" : [ "taptime", 0 ], "destination" : [ "tmod", 0 ] } },

			{ "patchline" : { "source" : [ "in-lfodist", 0 ], "destination" : [ "sig-lfo", 0 ] } },
			{ "patchline" : { "source" : [ "sig-lfo", 0 ], "destination" : [ "lfofreq", 0 ] } },
			{ "patchline" : { "source" : [ "in-lforate", 0 ], "destination" : [ "lfofreq", 1 ] } },
			{ "patchline" : { "source" : [ "lfofreq", 0 ], "destination" : [ "osc", 0 ] } },
			{ "patchline" : { "source" : [ "osc", 0 ], "destination" : [ "lfoamt", 0 ] } },
			{ "patchline" : { "source" : [ "in-lfodepth", 0 ], "destination" : [ "lfoamt", 1 ] } },
			{ "patchline" : { "source" : [ "lfoamt", 0 ], "destination" : [ "tmod", 1 ] } },
			{ "patchline" : { "source" : [ "tmod", 0 ], "destination" : [ "tapout", 0 ] } },

			{ "patchline" : { "source" : [ "in-L", 0 ], "destination" : [ "summono", 0 ] } },
			{ "patchline" : { "source" : [ "in-R", 0 ], "destination" : [ "summono", 1 ] } },
			{ "patchline" : { "source" : [ "summono", 0 ], "destination" : [ "half", 0 ] } },
			{ "patchline" : { "source" : [ "half", 0 ], "destination" : [ "upmix", 0 ] } },
			{ "patchline" : { "source" : [ "upmix", 0 ], "destination" : [ "addin", 0 ] } },
			{ "patchline" : { "source" : [ "addin", 0 ], "destination" : [ "tapin", 0 ] } },
			{ "patchline" : { "source" : [ "tapin", 0 ], "destination" : [ "tapout", 0 ] } },
			{ "patchline" : { "source" : [ "tapout", 0 ], "destination" : [ "maskmul", 0 ] } },
			{ "patchline" : { "source" : [ "maskmul", 0 ], "destination" : [ "out", 0 ] } },

			{ "patchline" : { "source" : [ "maskmul", 0 ], "destination" : [ "fbfilter", 0 ] } },
			{ "patchline" : { "source" : [ "in-lopass", 0 ], "destination" : [ "fbfilter", 1 ] } },
			{ "patchline" : { "source" : [ "fbfilter", 0 ], "destination" : [ "fbgain", 0 ] } },
			{ "patchline" : { "source" : [ "fbgain", 0 ], "destination" : [ "addin", 1 ] } },

			{ "patchline" : { "source" : [ "in-fb", 0 ], "destination" : [ "pak-fb", 0 ] } },
			{ "patchline" : { "source" : [ "pak-fb", 0 ], "destination" : [ "line-fb", 0 ] } },
			{ "patchline" : { "source" : [ "line-fb", 0 ], "destination" : [ "fbgain", 1 ] } },

			{ "patchline" : { "source" : [ "in-freeze", 0 ], "destination" : [ "prep-frz", 0 ] } },
			{ "patchline" : { "source" : [ "prep-frz", 0 ], "destination" : [ "tapin", 0 ] } },

			{ "patchline" : { "source" : [ "in-panic", 0 ], "destination" : [ "t-panic", 0 ] } },
			{ "patchline" : { "source" : [ "t-panic", 0 ], "destination" : [ "msg-clear", 0 ] } },
			{ "patchline" : { "source" : [ "t-panic", 1 ], "destination" : [ "msg-frz0", 0 ] } },
			{ "patchline" : { "source" : [ "t-panic", 2 ], "destination" : [ "msg-fb0", 0 ] } },
			{ "patchline" : { "source" : [ "msg-clear", 0 ], "destination" : [ "tapin", 0 ] } },
			{ "patchline" : { "source" : [ "msg-frz0", 0 ], "destination" : [ "tapin", 0 ] } },
			{ "patchline" : { "source" : [ "msg-fb0", 0 ], "destination" : [ "line-fb", 0 ] } }
		]
	}
}
