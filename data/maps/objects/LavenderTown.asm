LavenderTown_Object:
	db $2c ; border block

	def_warp_events
	warp_event  7,  7, LAVENDER_POKECENTER, 1
	warp_event 18,  7, POKEMON_TOWER_1F, 1
	warp_event 11, 11, MR_FUJIS_HOUSE, 1
	warp_event 19, 15, LAVENDER_MART, 1
	warp_event  7, 15, LAVENDER_CUBONE_HOUSE, 1
	warp_event 11, 15, NAME_RATERS_HOUSE, 1

	def_bg_events
	bg_event 15, 11, 4 ; LavenderTownText4
	bg_event 13,  5, 5 ; LavenderTownText5
	bg_event 20, 15, 6 ; MartSignText
	bg_event  8,  7, 7 ; PokeCenterSignText
	bg_event  9, 11, 8 ; LavenderTownText8
	bg_event 21,  9, 9 ; LavenderTownText9

	def_object_events
	object_event 19, 11, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, 1 ; person
	object_event 13, 12, SPRITE_COOLTRAINER_M, STAY, NONE, 2 ; person
	object_event 12,  9, SPRITE_SUPER_NERD, STAY, NONE, 3 ; person

	def_warps_to LAVENDER_TOWN
