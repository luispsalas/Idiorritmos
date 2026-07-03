{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 1,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 640.0, 480.0 ],
		"boxes" : [
			{
				"box" : 				{
					"comment" : "file L",
					"id" : "in-fileL",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 30.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "file R",
					"id" : "in-fileR",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 110.0, 30.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "live L",
					"id" : "in-liveL",
					"index" : 3,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 180.0, 30.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "live R",
					"id" : "in-liveR",
					"index" : 4,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 30.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "mode: 0=file 1=live 2=both",
					"id" : "in-mode",
					"index" : 5,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 360.0, 30.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "gate-file",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 360.0, 80.0, 40.0, 22.0 ],
					"text" : "!= 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "gate-live",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 80.0, 40.0, 22.0 ],
					"text" : "!= 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "msg-file",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 360.0, 120.0, 50.0, 22.0 ],
					"text" : "$1 20"
				}

			}
, 			{
				"box" : 				{
					"id" : "msg-live",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 120.0, 50.0, 22.0 ],
					"text" : "$1 20"
				}

			}
, 			{
				"box" : 				{
					"id" : "line-file",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 360.0, 160.0, 45.0, 22.0 ],
					"text" : "line~"
				}

			}
, 			{
				"box" : 				{
					"id" : "line-live",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 460.0, 160.0, 45.0, 22.0 ],
					"text" : "line~"
				}

			}
, 			{
				"box" : 				{
					"id" : "mul-fileL",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 230.0, 35.0, 22.0 ],
					"text" : "*~"
				}

			}
, 			{
				"box" : 				{
					"id" : "mul-fileR",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 110.0, 230.0, 35.0, 22.0 ],
					"text" : "*~"
				}

			}
, 			{
				"box" : 				{
					"id" : "mul-liveL",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 180.0, 230.0, 35.0, 22.0 ],
					"text" : "*~"
				}

			}
, 			{
				"box" : 				{
					"id" : "mul-liveR",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 230.0, 35.0, 22.0 ],
					"text" : "*~"
				}

			}
, 			{
				"box" : 				{
					"id" : "sum-L",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 40.0, 300.0, 35.0, 22.0 ],
					"text" : "+~"
				}

			}
, 			{
				"box" : 				{
					"id" : "sum-R",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 110.0, 300.0, 35.0, 22.0 ],
					"text" : "+~"
				}

			}
, 			{
				"box" : 				{
					"comment" : "out L",
					"id" : "out-L",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 360.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "out R",
					"id" : "out-R",
					"index" : 2,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 360.0, 30.0, 30.0 ]
				}

			}
 ],
		"lines" : [
			{
				"patchline" : 				{
					"destination" : [ "gate-file", 0 ],
					"source" : [ "in-mode", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "gate-live", 0 ],
					"source" : [ "in-mode", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "msg-file", 0 ],
					"source" : [ "gate-file", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "msg-live", 0 ],
					"source" : [ "gate-live", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "line-file", 0 ],
					"source" : [ "msg-file", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "line-live", 0 ],
					"source" : [ "msg-live", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-fileL", 0 ],
					"source" : [ "in-fileL", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-fileR", 0 ],
					"source" : [ "in-fileR", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-liveL", 0 ],
					"source" : [ "in-liveL", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-liveR", 0 ],
					"source" : [ "in-liveR", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-fileL", 1 ],
					"source" : [ "line-file", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-fileR", 1 ],
					"source" : [ "line-file", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-liveL", 1 ],
					"source" : [ "line-live", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mul-liveR", 1 ],
					"source" : [ "line-live", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "sum-L", 0 ],
					"source" : [ "mul-fileL", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "sum-L", 1 ],
					"source" : [ "mul-liveL", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "sum-R", 0 ],
					"source" : [ "mul-fileR", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "sum-R", 1 ],
					"source" : [ "mul-liveR", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "out-L", 0 ],
					"source" : [ "sum-L", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "out-R", 0 ],
					"source" : [ "sum-R", 0 ]
				}

			}
 ]
	}

}
