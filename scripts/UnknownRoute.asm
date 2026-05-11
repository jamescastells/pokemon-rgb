UnknownRoute_Script:
	ret

UnknownRoute_ScriptPointers:
	def_script_pointers
	dw_const UnknownRouteNoopScript,                 SCRIPT_UNKNOWNROUTE_NOOP

UnknownRouteNoopScript:
	ret

UnknownRoute_TextPointers:
	def_text_pointers
