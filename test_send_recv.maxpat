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
		"rect" : [ 100.0, 100.0, 550.0, 400.0 ],
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
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 10.0, 500.0, 20.0 ],
					"text" : "TEST send~/receive~ pitch control. Type ratio directly (1.0=no shift, 2.0=octave up)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-adc",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 50.0, 45.0, 22.0 ],
					"text" : "adc~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-ratio-lbl",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 300.0, 50.0, 200.0, 20.0 ],
					"text" : "RATIO (try 1.0, 1.5, 2.0, 0.5):"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-ratio",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 300.0, 75.0, 60.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-sig",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 110.0, 32.0, 22.0 ],
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-send",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 300.0, 145.0, 115.0, 22.0 ],
					"text" : "send~ sharm_test"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-pfft",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 130.0, 220.0, 22.0 ],
					"text" : "pfft~ test_gizmo_recv 2048 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-gain",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 180.0, 42.0, 22.0 ],
					"text" : "*~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-meter",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 30.0, 220.0, 200.0, 14.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-dac",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 250.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-inst",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 310.0, 500.0, 20.0 ],
					"text" : "1. Turn on DSP  2. Type 1.498 in ratio box  3. Hear pitch shift up a 5th"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-inst2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 330.0, 500.0, 20.0 ],
					"text" : "Type 2.0 = octave up.  Type 0.5 = octave down.  Type 1.0 = no shift."
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-ratio", 0 ],
					"destination" : [ "obj-sig", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-sig", 0 ],
					"destination" : [ "obj-send", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-adc", 0 ],
					"destination" : [ "obj-pfft", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-pfft", 0 ],
					"destination" : [ "obj-gain", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-gain", 0 ],
					"destination" : [ "obj-meter", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-gain", 0 ],
					"destination" : [ "obj-dac", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-gain", 0 ],
					"destination" : [ "obj-dac", 1 ]
				}

			}
 ],
		"autosave" : 0
	}

}