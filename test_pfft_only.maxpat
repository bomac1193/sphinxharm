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
		"rect" : [ 100.0, 100.0, 500.0, 350.0 ],
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
					"id" : "obj-lbl",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 10.0, 400.0, 20.0 ],
					"text" : "TEST pfft~ + gizmo~ with hardcoded +7 semitone shift"
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
					"id" : "obj-pfft",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 100.0, 250.0, 22.0 ],
					"text" : "pfft~ test_gizmo_fixed 2048 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-gain",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 150.0, 42.0, 22.0 ],
					"text" : "*~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-dac",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 200.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-lbl2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 260.0, 450.0, 20.0 ],
					"text" : "Should hear voice shifted UP a 5th (7 semitones). Hardcoded inside subpatch."
				}

			}
 ],
		"lines" : [ 			{
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