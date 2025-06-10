CinnabarVolcano_Object:
	db $7D ; border block

	def_warp_events
	warp_event 16, 35, ROUTE_21, 1
	warp_event 17, 35, ROUTE_21, 1
	warp_event 11,  5, ROUTE_21, 2
	warp_event 17, 15, ROUTE_21, 3

	def_bg_events

	def_object_events


	def_warps_to CINNABAR_VOLCANO
