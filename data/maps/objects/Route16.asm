Route16_Object:
	db $43 ; border block

	def_warp_events
	warp_event 17, 12, ROUTE_16_GATE_1F, 1
	warp_event 17, 13, ROUTE_16_GATE_1F, 2
	warp_event 24, 12, ROUTE_16_GATE_1F, 3
	warp_event 24, 13, ROUTE_16_GATE_1F, 4
	warp_event 17,  6, ROUTE_16_GATE_1F, 5
	warp_event 17,  7, ROUTE_16_GATE_1F, 6
	warp_event 24,  6, ROUTE_16_GATE_1F, 7
	warp_event 24,  7, ROUTE_16_GATE_1F, 8
	warp_event  7,  7, ROUTE_16_FLY_HOUSE, 1

	def_bg_events
	bg_event 27, 13, 8 ; Route16Text8
	bg_event  5, 17, 9 ; Route16Text9

	def_object_events
	object_event 17, 14, SPRITE_BIKER, STAY, LEFT, 1, OPP_BIKER, 5
	object_event 14, 15, SPRITE_BIKER, STAY, RIGHT, 2, OPP_CUE_BALL, 1
	object_event 11, 14, SPRITE_BIKER, STAY, UP, 3, OPP_CUE_BALL, 2
	object_event  9, 13, SPRITE_BIKER, STAY, LEFT, 4, OPP_BIKER, 6
	object_event  6, 12, SPRITE_BIKER, STAY, RIGHT, 5, OPP_CUE_BALL, 3
	object_event  3, 14, SPRITE_BIKER, STAY, RIGHT, 6, OPP_BIKER, 7
	object_event 26, 12, SPRITE_SNORLAX, STAY, DOWN, 7 ; person

	def_warps_to ROUTE_16
