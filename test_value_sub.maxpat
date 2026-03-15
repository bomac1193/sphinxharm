{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 150.0, 150.0, 450.0, 350.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-loadbang",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 200.0, 15.0, 60.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-metro",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 200.0, 45.0, 55.0, 22.0 ],
					"text" : "metro 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-val",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 75.0, 120.0, 22.0 ],
					"text" : "v pitch_ratio_test"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-sig",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 200.0, 105.0, 45.0, 22.0 ],
					"text" : "sig~ 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-fftin",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "signal" ],
					"patching_rect" : [ 30.0, 30.0, 80.0, 22.0 ],
					"text" : "fftin~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-gizmo",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 30.0, 140.0, 190.0, 22.0 ],
					"text" : "gizmo~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-fftout",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 200.0, 80.0, 22.0 ],
					"text" : "fftout~ 1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-loadbang", 0 ],
					"destination" : [ "obj-metro", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-metro", 0 ],
					"destination" : [ "obj-val", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-val", 0 ],
					"destination" : [ "obj-sig", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-sig", 0 ],
					"destination" : [ "obj-gizmo", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-fftin", 0 ],
					"destination" : [ "obj-gizmo", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-gizmo", 0 ],
					"destination" : [ "obj-fftout", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-gizmo", 1 ],
					"destination" : [ "obj-fftout", 1 ]
				}

			}
 ],
		"autosave" : 0
	}

}