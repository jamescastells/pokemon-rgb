CeruleanCity_Object:
	db $f ; border block

	def_warp_events
	warp_event 29, 11, CERULEAN_TRASHED_HOUSE, 1
	warp_event 15, 15, CERULEAN_TRADE_HOUSE, 1
	warp_event 21, 17, CERULEAN_POKECENTER, 1
	warp_event 32, 19, CERULEAN_GYM, 1
	warp_event 15, 25, BIKE_SHOP, 1
	warp_event 27, 25, CERULEAN_MART, 1
	warp_event  6, 11, CERULEAN_CAVE_1F, 1
	warp_event 29,  9, CERULEAN_TRASHED_HOUSE, 3
	warp_event 11, 11, CERULEAN_BADGE_HOUSE, 2
	warp_event 11,  9, CERULEAN_BADGE_HOUSE, 1

	def_bg_events
	bg_event 25, 19, 12 ; CeruleanCityText12
	bg_event 19, 29, 13 ; CeruleanCityText13
	bg_event 28, 25, 14 ; MartSignText
	bg_event 22, 17, 15 ; PokeCenterSignText
	bg_event 13, 25, 16 ; CeruleanCityText16
	bg_event 29, 21, 17 ; CeruleanCityText17

	def_object_events
	object_event 22,  2, SPRITE_BLUE, STAY, DOWN, 1 ; person
	object_event 32,  8, SPRITE_ROCKET, STAY, NONE, 2, OPP_ROCKET, 5
	object_event 33, 20, SPRITE_COOLTRAINER_M, STAY, DOWN, 3 ; person
	object_event 17, 18, SPRITE_SUPER_NERD, WALK, UP_DOWN, 4 ; person
	object_event 11, 21, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 5 ; person
	object_event 30, 12, SPRITE_GUARD, STAY, DOWN, 6 ; person
	object_event 31, 26, SPRITE_COOLTRAINER_F, STAY, LEFT, 7 ; person
	object_event 30, 26, SPRITE_MONSTER, STAY, DOWN, 8 ; person
	object_event 11, 27, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, 9 ; person
	object_event  6, 12, SPRITE_SUPER_NERD, STAY, DOWN, 10 ; person
	object_event 29, 12, SPRITE_GUARD, STAY, DOWN, 11 ; person

	def_warps_to CERULEAN_CITY
