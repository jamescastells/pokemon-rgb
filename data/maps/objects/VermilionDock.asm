VermilionDock_Object:
	db $0D ; border block

	def_warp_events
	warp_event 17,  4, LAST_MAP, 6
	warp_event 18,  4, LAST_MAP, 7
	warp_event 17,  6, SS_ANNE_1F, 1
	warp_event 18,  6, SS_ANNE_1F, 2

	def_bg_events

	def_object_events
	object_event 25,  4, SPRITE_FAIRY, STAY, DOWN, 1, MEW, 50

	def_warps_to VERMILION_DOCK
