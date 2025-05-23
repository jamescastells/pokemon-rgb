SetDefaultNames:
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
	ld a, [wd732]
	push af
	ld hl, wPlayerName
	ld bc, wBoxDataEnd - wPlayerName
	xor a
	call FillMemory
	ld hl, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	xor a
	call FillMemory
	pop af
	ld [wd732], a
	pop af
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	ld hl, NintenText
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, SonyText
	ld de, wRivalName
	ld bc, NAME_LENGTH
	jp CopyData

OakSpeech:
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld a, 0 ; BANK(Music_Routes2)
	ld c, a
	ld a, MUSIC_ROUTES2
	call PlayMusic
	call ClearScreen
	call LoadTextBoxTilePatterns
	call SetDefaultNames
	predef InitPlayerData2
	ld hl, wNumBoxItems
	ld a, POTION
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
	call AddItemToInventory  ; give one potion
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call SpecialWarpIn
	xor a
	ldh [hTileAnimations], a
IF GEN_2_GRAPHICS
	ld a, PAL_OAK
ELSE
	ld a, PAL_BROWNMON
ENDC
	call GotPalID ; HAX
	nop
	nop
	nop
	;ld a, [wd732]
	;bit 1, a ; possibly a debug mode bit
	;jp nz, .skipChoosingNames
	ld de, ProfOakPic
	lb bc, BANK(ProfOakPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, OakSpeechText1
	call PrintText
	call GBFadeOutToWhite

	call GetNidorinoPalID ; HAX
	ld a, GLOOM
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, OakSpeechText2
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen

IF GEN_2_GRAPHICS
	ld a, PAL_OAK
ELSE
	ld a, PAL_BROWNMON
ENDC
	call GotPalID ; HAX
	nop
	nop
	nop
	ld de, ProfOakPic
	lb bc, BANK(ProfOakPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, BoyGirlText  ; added to the same file as the other oak text
  	call PrintText     ; show this text
  	call BoyGirlChoice ; added routine at the end of this file
   	ld a, [wCurrentMenuItem]
   	ld [wPlayerGender], a ; store player's gender. 00 for boy, 01 for girl

	and a
	jr z, .notGirl
	ld hl, girlConfirm
	jr .isAGirl
.notGirl
	ld hl, boyConfirm
.isAGirl
  	call PrintText
	call GBFadeOutToWhite

	call GetRedPalID ; HAX
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	ld a, [wPlayerGender] 	; check gender
	and a      				; check gender
	jr z, .NotGreen1
	ld de, GreenPicFront
	lb bc, BANK(GreenPicFront), $00
.NotGreen1:
	call IntroDisplayPicCenteredOrUpperRight
	call MovePicLeft
	ld hl, IntroducePlayerText
	call PrintText
	call ChoosePlayerName
	call GBFadeOutToWhite
	call GetRivalPalID ; HAX
	ld de, Rival1Pic
	lb bc, BANK(Rival1Pic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IntroduceRivalText
	call PrintText
	call ChooseRivalName
.skipChoosingNames
	call GBFadeOutToWhite
	call GetRedPalID ; HAX
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
  	ld a, [wPlayerGender] ; check gender
  	and a      ; check gender
  	jr z, .NotGreen2
  	ld de, GreenPicFront
       	lb bc, Bank(GreenPicFront), $00
.NotGreen2:
	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a, [wd72d]
	and a
	jr nz, .next
	ld hl, OakSpeechText3
	call PrintText
.next
	ldh a, [hLoadedROMBank]
	push af
	ld a, SFX_SHRINK
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 4
	call DelayFrames
	ld de, RedSprite
	ld hl, vSprites
	lb bc, BANK(RedSprite), $0C
	ld a, [wPlayerGender] ; check gender
	and a      ; check gender
	jr z, .NotGreen3
	ld de,GreenSprite
	lb bc, BANK(GreenSprite), $0C
.NotGreen3:
 	ld hl, vSprites
	call CopyVideoData
	ld de,ShrinkPic1
	lb bc, BANK(ShrinkPic1), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2
	lb bc, BANK(ShrinkPic2), $00
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ldh a, [hLoadedROMBank]
	push af
;	ld a, 0 ; BANK(Music_PalletTown)
;	ld [wAudioROMBank], a
;	ld [wAudioSavedROMBank], a

	ld a, 10
	ld [wMusicFade], a
	xor a
	ld [wMusicFadeID], a

	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 20
	call DelayFrames
	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearScreenArea
	call LoadTextBoxTilePatterns
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld c, 50
	call DelayFrames
	call GBFadeOutToWhite
	jp ClearScreen
OakSpeechText1:
	text_far _OakSpeechText1
	text_end
OakSpeechText2:
	text_far _OakSpeechText2A
	sound_cry_gloom
	text_far _OakSpeechText2B
	text_end
IntroducePlayerText:
	text_far _IntroducePlayerText
	text_end
IntroduceRivalText:
	text_far _IntroduceRivalText
	text_end
OakSpeechText3:
	text_far _OakSpeechText3
	text_end
BoyGirlText: ; This is new so we had to add a reference to get it to compile
	text_far _BoyGirlText
	text_end
boyConfirm:
	text_far _boyConfirm
	text_end
girlConfirm:
	text_far _girlConfirm
	text_end
FadeInIntroPic:
	ld hl, IntroFadePalettes
	ld b, 6
.next
	ld a, [hli]
	ldh [rBGP], a
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .next
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a, 119
	ldh [rWX], a
	call DelayFrame

	ld a, %11100100
	ldh [rBGP], a
.next
	call DelayFrame
	ldh a, [rWX]
	sub 8
	cp $FF
	ret z
	ldh [rWX], a
	jr .next

DisplayPicCenteredOrUpperRight:
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight:
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a, c
	and a
	hlcoord 15, 1
	jr nz, .next
	hlcoord 6, 4
.next
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

	; displays boy/girl choice
	BoyGirlChoice::
 	   call SaveScreenTilesToBuffer1
 	   call InitBoyGirlTextBoxParameters
 	   jr DisplayBoyGirlChoice
    
	InitBoyGirlTextBoxParameters::
	   ld a, $1 ; loads the value for the unused North/West choice, that was changed to say Boy/Girl
 	   ld [wTwoOptionMenuID], a
 	   coord hl, 13, 7 
 	   ld bc, $80e
 	   ret
 	   
	DisplayBoyGirlChoice::
   	   ld a, $14
   	   ld [wTextBoxID], a
   	   call DisplayTextBoxID
   	   jp LoadScreenTilesFromBuffer1