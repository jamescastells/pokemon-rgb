Route1_Script:
	jp EnableAutoTextBoxDrawing
	ld hl, Route1_ScriptPointers
	ld a, [wRoute1CurScript]
	jp CallFunctionInTable

Route1_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route1_TextPointers:
	dw Route1Text1
	dw Route1Text2
	dw Route1Text3
	dw Route1OakText

Route1Text1:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, Route1ViridianMartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, Route1Text_1cae8
	jr .done
.bag_full
	ld hl, Route1Text_1caf3
	jr .done
.got_item
	ld hl, Route1Text_1caee
.done
	call PrintText
	jp TextScriptEnd

Route1ViridianMartSampleText:
	text_far _Route1ViridianMartSampleText
	text_end

Route1Text_1cae8:
	text_far _Route1Text_1cae8
	sound_get_item_1
	text_end

Route1Text_1caee:
	text_far _Route1Text_1caee
	text_end

Route1Text_1caf3:
	text_far _Route1Text_1caf3
	text_end

Route1Text2:
	text_far _Route1Text2
	text_end

Route1Text3:
	text_far _Route1Text3
	text_end

Route1OakText:
	text_asm
	ld hl, OakBeforeBattleText
	call PrintText
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic

	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	
	call Delay3
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a
	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp $B1
	jr nz, .NotSquirtle
	ld a, $2 ; If rival has squirtle, you have charmander, oak gets venusaur
	jr .done
.NotSquirtle
	cp $B0
	jr z, .Charmander
	ld a, $3 ; If rival got neither squirtle or charmander, he got bulbasaur, you got squirtle, oak gets charizard.
	jr .done
.Charmander
	ld a, $1 ; if rival got charmander, you have bulbasuar, oak gets blastoise 
.done
	ld [wTrainerNo], a

	ld a, $2
	ld [wRoute1CurScript], a
	
	ld hl, OakDefeatedText
	ld de, OakWonText
	call SaveEndBattleTextPointers
	ld a, HS_ROUTE_1_OAK
	ld [wMissableObjectIndex], a
	predef HideObject
	jp TextScriptEnd

OakBeforeBattleText:
	text_far _OakBeforeBattleText
	text_end

OakDefeatedText:
	text_far _OakDefeatedText
	text_end

OakWonText:
	text_far _OakWonText
	text_end
