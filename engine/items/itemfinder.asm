HiddenItemNear:
	ld hl, HiddenItemCoords
	ld b, 0 ; item index counter
	ld a, [wCurMap]
	ld c, a ; save current map in C
.loop
	ld a, [hl] ; read map from table
	cp -1
	ret z ; end of table, no item found nearby
	cp c ; does map match current map?
	jr nz, .next_entry
	; Map matches, check if item was already obtained
	push hl
	push bc
	ld hl, wObtainedHiddenItemsFlags
	ld c, b ; item index
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop bc
	pop hl
	and a
	jr nz, .next_entry ; item already obtained
	; Item not yet obtained, check coordinates
	inc hl
	ld d, [hl] ; load Y coordinate
	inc hl
	ld e, [hl] ; load X coordinate
	dec hl
	dec hl
; check if the item is within 4-5 tiles (depending on the direction of item)
	ld a, [wYCoord]
	call Sub5ClampTo0
	cp d
	jr nc, .next_entry
	ld a, [wYCoord]
	add 4
	cp d
	jr c, .next_entry
	ld a, [wXCoord]
	call Sub5ClampTo0
	cp e
	jr nc, .next_entry
	ld a, [wXCoord]
	add 5
	cp e
	jr c, .next_entry
	scf
	ret
.next_entry
	ld de, 3
	add hl, de
	inc b
	jr .loop

Sub5ClampTo0:
; subtract 5 but clamp to 0
	sub 5
	cp $f0
	ret c
	xor a
	ret
