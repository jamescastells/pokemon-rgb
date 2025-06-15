MtSilverHiddenFloor_Script:
	call EnableAutoTextBoxDrawing
	ld de, MtSilverHiddenFloor_ScriptPointers
	ld a, [wMtSilverHiddenFloorCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtSilverHiddenFloorCurScript], a
	ret

MtSilverHiddenFloor_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              		SCRIPT_MT_SILVERHIDDENFLOOR_DEFAULT
	dw_const MtSilverHiddenFloorGiovanniPostBattle,		    SCRIPT_MT_SILVERHIDDENFLOOR_GIOVANNI_POST_BATTLE

MtSilverHiddenFloorGiovanniPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	ret z
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, TEXT_MT_SILVERHIDDENFLOOR_GIOVANNI_POSTBATTLE
	ldh [hTextID], a
	SetEvents EVENT_GIOVANNI_REMATCH_BEAT
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, HS_MT_SILVERHIDDENFLOOR_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SS_ANNE_BOW_OAK
	ld [wMissableObjectIndex], a
	predef ShowObject
	CheckEventReuseA EVENT_GOT_TM27
	jr nz, .skip ; in-case you never got the TM
	ld a, HS_VIRIDIAN_GYM_GIOVANNI
	ld [wMissableObjectIndex], a
	predef ShowObject
.skip
	call UpdateSprites
	call GBFadeInFromBlack
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_MT_SILVERHIDDENFLOOR_DEFAULT
	ld [wMtSilverHiddenFloorCurScript], a
	ld [wCurMapScript], a
	ret

MtSilverHiddenFloor_TextPointers:
	def_text_pointers
	dw_const MtSilverHiddenFloorGiovanniText,           TEXT_MT_SILVERHIDDENFLOOR_GIOVANNI
	dw_const MtSilverHiddenFloorGiovanniPostBattleText, TEXT_MT_SILVERHIDDENFLOOR_GIOVANNI_POSTBATTLE
	
MtSilverHiddenFloorGiovanniText:
	text_asm
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .MtSilverHiddenFloorGiovanniEndBattleText
	ld de, .MtSilverHiddenFloorGiovanniEndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_MT_SILVERHIDDENFLOOR_GIOVANNI_POST_BATTLE
	ld [wMtSilverHiddenFloorCurScript], a
	jp TextScriptEnd
	
.PreBattleText:
	text_far _MtSilverHiddenFloorGiovanniPreBattleText
	text_end

.MtSilverHiddenFloorGiovanniEndBattleText:
	text_far _MtSilverHiddenFloorGiovanniEndBattleText
	text_end
	
MtSilverHiddenFloorGiovanniPostBattleText:
	text_far _MtSilverHiddenFloorGiovanniPostBattleText
	text_end
	