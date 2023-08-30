
; =============== S U B R O U T I N E =======================================

Main_Change_PSG_Mute:
		disableInts
		bsr.w	ClearPlaneMap
		lea	PSGTone_MainText(pc),a1
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
		locVRAM	$C502,d1
		move.l	#$2000000,d2
		moveq	#PSGTone_VCount-1,d7
		bsr.w	Select_DrawVCount
		bsr.w	PSGMute_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	PSGMute_Index(pc,d0.w),d1
		jsr	PSGMute_Index(pc,d1.w)
		bsr.w	PSGTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

PSGMute_Index: offsetTable
		offsetTableEntry.w PSGMute_Change_PSG1_Mute	; 0
		offsetTableEntry.w PSGMute_Change_PSG2_Mute	; 1
		offsetTableEntry.w PSGMute_Change_PSG3_Mute	; 2

; =============== S U B R O U T I N E =======================================

PSGMute_Change_PSG1_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(PSG1Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG1Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_psg1_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

PSGMute_Change_PSG2_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(PSG2Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG2Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_psg2_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

PSGMute_Change_PSG3_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(PSG3Mute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG3Mute_Count).w
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.v_music_psg3_track.MuteChannel).l
		rts

; =============== S U B R O U T I N E =======================================

PSGMute_UpdateTextInfo:
		lea	(PSG1Mute_Count).l,a2
		locVRAM	$C138,d4
		moveq	#3-1,d7

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
