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
		"rect" : [ 100.0, 100.0, 600.0, 450.0 ],
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
					"patching_rect" : [ 20.0, 10.0, 550.0, 20.0 ],
					"text" : "TEST: pfft~ with name + embedded patcher + in~ 1"
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
					"patching_rect" : [ 300.0, 50.0, 250.0, 20.0 ],
					"text" : "RATIO (1.5=fifth, 2.0=octave):"
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
					"patching_rect" : [ 300.0, 110.0, 45.0, 22.0 ],
					"text" : "sig~ 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-pfft",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 30.0, 160.0, 200.0, 22.0 ],
					"text" : "pfft~ gizmo_embed 2048 4",
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 1,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						},
						"classnamespace" : "box",
						"rect" : [ 200.0, 200.0, 400.0, 300.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-fftin",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "signal" ],
									"patching_rect" : [ 30.0, 30.0, 80.0, 22.0 ],
									"text" : "fftin~ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-in1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 200.0, 30.0, 40.0, 22.0 ],
									"text" : "in~ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-gizmo",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "signal" ],
									"patching_rect" : [ 30.0, 100.0, 190.0, 22.0 ],
									"text" : "gizmo~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-fftout",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 170.0, 80.0, 22.0 ],
									"text" : "fftout~ 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-fftin", 0 ],
									"destination" : [ "obj-gizmo", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-in1", 0 ],
									"destination" : [ "obj-gizmo", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-gizmo", 0 ],
									"destination" : [ "obj-fftout", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-gizmo", 1 ],
									"destination" : [ "obj-fftout", 1 ]
								}

							}
 ],
						"autosave" : 0
					}

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
					"id" : "obj-inst",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 340.0, 550.0, 20.0 ],
					"text" : "1. DSP on  2. Type 1.5  3. Check: does pfft~ have 2 inlets? Is wire connected?"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-inst2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 360.0, 550.0, 20.0 ],
					"text" : "If 'inlet out of range' error: double-click pfft~ to see if subpatch loaded."
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
					"destination" : [ "obj-pfft", 1 ]
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