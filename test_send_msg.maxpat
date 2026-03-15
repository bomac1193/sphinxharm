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
		"rect" : [ 100.0, 100.0, 650.0, 450.0 ],
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
					"patching_rect" : [ 20.0, 10.0, 600.0, 20.0 ],
					"text" : "TEST: message-rate send/receive (no tilde) to pass ratio into pfft~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-adc",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 60.0, 45.0, 22.0 ],
					"text" : "adc~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-ratio-lbl",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 50.0, 250.0, 20.0 ],
					"text" : "RATIO (1.5=fifth, 2.0=octave, 0.5=down):"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-ratio",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 350.0, 75.0, 60.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-loadbang",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 500.0, 50.0, 60.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-initval",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 80.0, 30.0, 22.0 ],
					"text" : "1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-send",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 120.0, 80.0, 22.0 ],
					"text" : "s ratio_msg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-pfft",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 150.0, 200.0, 22.0 ],
					"text" : "pfft~ sr_gizmo_sub 2048 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-gain",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 210.0, 42.0, 22.0 ],
					"text" : "*~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-dac",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 270.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-inst1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 340.0, 600.0, 20.0 ],
					"text" : "1. USE HEADPHONES  2. DSP on  3. Type 1.5 in ratio  4. Hear pitch shift up"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-inst2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 360.0, 600.0, 20.0 ],
					"text" : "Ratio via message send/receive (NOT send~/receive~). pfft~ has 1 inlet only."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-inst3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 380.0, 600.0, 20.0 ],
					"text" : "loadbang inits ratio to 1.0 (no shift). Change flonum to hear shift."
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-loadbang", 0 ],
					"destination" : [ "obj-initval", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-initval", 0 ],
					"destination" : [ "obj-send", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-ratio", 0 ],
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