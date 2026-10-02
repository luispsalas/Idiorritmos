{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 2, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 700.0, 400.0 ],
		"boxes" : [
			{ "box" : { "comment" : "manual value", "id" : "in-manual", "index" : 1, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "envelope value", "id" : "in-env", "index" : 2, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 110.0, 20.0, 30.0, 30.0 ] } },
			{ "box" : { "comment" : "env enable 0/1", "id" : "in-enable", "index" : 3, "maxclass" : "inlet", "numinlets" : 0, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 180.0, 20.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "eq0", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "int" ], "patching_rect" : [ 180.0, 70.0, 50.0, 22.0 ], "text" : "== 0" } },

			{ "box" : { "id" : "gM", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 40.0, 120.0, 60.0, 22.0 ], "text" : "gate" } },
			{ "box" : { "id" : "gE", "maxclass" : "newobj", "numinlets" : 2, "numoutlets" : 1, "outlettype" : [ "" ], "patching_rect" : [ 120.0, 120.0, 60.0, 22.0 ], "text" : "gate" } },

			{ "box" : { "comment" : "value out", "id" : "out", "index" : 1, "maxclass" : "outlet", "numinlets" : 1, "numoutlets" : 0, "patching_rect" : [ 40.0, 170.0, 30.0, 30.0 ] } },

			{ "box" : { "id" : "guide", "maxclass" : "comment", "numinlets" : 1, "numoutlets" : 0, "fontsize" : 11.0, "patching_rect" : [ 250.0, 70.0, 420.0, 200.0 ], "text" : "PARAM SLOT — makes an envelope OPTIONAL on one parameter.\n\nENABLE 0 = manual passes (change the value freely). ENABLE 1 = envelope passes (predefined movement). The unused source is gated off, so they never fight.\n\nWire: manual control -> in-manual; an env_drift/env_ramp out -> in-env; an enable toggle -> in-enable; OUT -> the target parameter inlet (a distribution A/B, global speed, width, gain...).\n\n⚠️ Host patch must send an initial enable (loadmess 0 = manual default), else nothing passes until enable is set. Switching enable holds the last value until the now-active source next emits (no jump)." } }
		],
		"lines" : [
			{ "patchline" : { "source" : [ "in-enable", 0 ], "destination" : [ "eq0", 0 ] } },
			{ "patchline" : { "source" : [ "in-enable", 0 ], "destination" : [ "gE", 0 ] } },
			{ "patchline" : { "source" : [ "eq0", 0 ], "destination" : [ "gM", 0 ] } },
			{ "patchline" : { "source" : [ "in-manual", 0 ], "destination" : [ "gM", 1 ] } },
			{ "patchline" : { "source" : [ "in-env", 0 ], "destination" : [ "gE", 1 ] } },
			{ "patchline" : { "source" : [ "gM", 0 ], "destination" : [ "out", 0 ] } },
			{ "patchline" : { "source" : [ "gE", 0 ], "destination" : [ "out", 0 ] } }
		]
	}
}
