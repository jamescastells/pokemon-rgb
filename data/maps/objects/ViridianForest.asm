ViridianForest_Object:
	db $2 ; border block

	def_warp_events
	warp_event  1,  5, VIRIDIAN_FOREST_NORTH_GATE, 3
	warp_event  2,  5, VIRIDIAN_FOREST_NORTH_GATE, 4
	warp_event 15, 53, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 16, 53, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 17, 53, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 18, 53, VIRIDIAN_FOREST_SOUTH_GATE, 2

	def_bg_events
	bg_event 24, 46,  9 ; ViridianForestText9
	bg_event 16, 38, 10 ; ViridianForestText10
	bg_event 26, 23, 11 ; ViridianForestText11
	bg_event  4, 30, 12 ; ViridianForestText12
	bg_event 18, 51, 13 ; ViridianForestText13
	bg_event  2,  7, 14 ; ViridianForestText14

	def_object_events
	object_event 16, 49, SPRITE_YOUNGSTER, STAY, NONE, 1 ; person
	object_event 30, 39, SPRITE_YOUNGSTER, STAY, LEFT, 2, OPP_BUG_CATCHER, 1
	object_event 30, 25, SPRITE_YOUNGSTER, STAY, LEFT, 3, OPP_BUG_CATCHER, 2
	object_event  2, 24, SPRITE_YOUNGSTER, STAY, LEFT, 4, OPP_BUG_CATCHER, 3
	object_event 25, 17, SPRITE_POKE_BALL, STAY, NONE, 5, ANTIDOTE
	object_event 12, 35, SPRITE_POKE_BALL, STAY, NONE, 6, POTION
	object_event  1, 37, SPRITE_POKE_BALL, STAY, NONE, 7, POKE_BALL
	object_event 27, 46, SPRITE_YOUNGSTER, STAY, NONE, 8 ; person

	def_warps_to VIRIDIAN_FOREST
