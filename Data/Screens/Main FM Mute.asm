
; =============== S U B R O U T I N E =======================================

Main_Change_FM_Mute:
		disableInts
		bsr.w	ClearPlaneMap
		lea	FMTone_MainText(pc),a1
		locVRAM	$C104,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		move.l	#FMMute_TextInfoIndex,(TextInfo_Pointer).w
		enableInts
		stopCPU

-		stopCPU
		bsr.w	Select_ScrollingBG
		disableInts
		move.w	(v_Select2_VCount).w,d0
		locVRAM	$CB02,d1
		move.l	#$2000000,d2
		moveq	#FMTone_VCount-1,d7
		bsr.w	Select_DrawVCount
		bsr.w	FMMute_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	FMMute_Index(pc,d0.w),d1
		jsr	FMMute_Index(pc,d1.w)
		bsr.w	FMTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

FMMute_Index: offsetTable
		offsetTableEntry.w FMTone_Change_FM1_Mute	; 0
		offsetTableEntry.w FMTone_Change_FM2_Mute	; 1
		offsetTableEntry.w FMTone_Change_FM3_Mute	; 2
		offsetTableEntry.w FMTone_Change_FM4_Mute	; 3
		offsetTableEntry.w FMTone_Change_FM5_Mute	; 4
		offsetTableEntry.w FMTone_Change_FM6_Mute	; 5

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM1_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(FM1Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM1Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_fm1_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM2_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(FM2Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM2Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_fm2_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM3_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(FM3Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM3Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_fm3_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM4_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(FM4Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM4Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_fm4_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM5_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(FM5Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM5Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_fm5_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM6_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(FM6Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM6Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_fm6_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

FMMute_UpdateTextInfo:
		lea	(FM1Mute_Count).w,a2
		locVRAM	$C138,d4
		moveq	#6-1,d7

-		move.l	d4,d1
		moveq	#0,d0
		move.b	(a2),d0
		lea	Player_MuteTextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		addi.l	#$2000000,d4
		addq.w	#5,a2
		dbf	d7,-
		rts
; ---------------------------------------------------------------------------

	; set the character
		CHARSET ' ', $2A
		CHARSET '0','9', 1
		CHARSET '<', $B
		CHARSET '>', $C
		CHARSET ':', $D
		CHARSET '.', $E
		CHARSET 'A','Z', $F
		CHARSET 'a','z', $F

FMMute_TextInfoIndex:
		dc.b "                                        "
		dc.b "PRESS UP DOWN TO SELECT CHANNEL. "
		dc.b "PRESS LEFT OR RIGHT TO MUTE CHANNEL. "
		dc.b "PRESS START BUTTON TO RETURN."
		dc.b "                                        ",-1
	even

		CHARSET ; reset character set
