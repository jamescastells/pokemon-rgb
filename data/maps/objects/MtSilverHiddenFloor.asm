	object_const_def
	const_export MT_SILVERHIDDENFLOOR_GIOVANNI

MtSilverHiddenFloor_Object:
	db $7D ; border block

	def_warp_events
	warp_event  3,  7, MT_SILVER_CAVE_2F, 3

	def_bg_events

	def_object_events
	object_event 11,  3, SPRITE_GIOVANNI, STAY, RIGHT, TEXT_MT_SILVERHIDDENFLOOR_GIOVANNI, OPP_GIOVANNI, 4

	def_warps_to MT_SILVER_HIDDEN_FLOOR
