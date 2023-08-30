
; Variables
FMTone_VCount:					= 6

; =============== S U B R O U T I N E =======================================

Main_Change_FM_Tone:
		disableInts
		bsr.w	ClearPlaneMap
		lea	FMTone_MainText(pc),a1
		locVRAM	$C104,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		move.l	#FMTone_TextInfoIndex,(TextInfo_Pointer).w
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
		bsr.w	FMTone_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	FMTone_Index(pc,d0.w),d1
		jsr	FMTone_Index(pc,d1.w)
		bsr.w	FMTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

FMTone_Index: offsetTable
		offsetTableEntry.w FMTone_Change_FM1_Tone	; 0
		offsetTableEntry.w FMTone_Change_FM2_Tone	; 1
		offsetTableEntry.w FMTone_Change_FM3_Tone	; 2
		offsetTableEntry.w FMTone_Change_FM4_Tone	; 3
		offsetTableEntry.w FMTone_Change_FM5_Tone	; 4
		offsetTableEntry.w FMTone_Change_FM6_Tone	; 5

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM1_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_fm1_track.Transpose).l,a2
		lea	(FM1Tone_Count).w,a1
		bra.s	FMTone_Control

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM2_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_fm2_track.Transpose).l,a2
		lea	(FM2Tone_Count).w,a1
		bra.s	FMTone_Control

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM3_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_fm3_track.Transpose).l,a2
		lea	(FM3Tone_Count).w,a1
		bra.s	FMTone_Control

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM4_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_fm4_track.Transpose).l,a2
		lea	(FM4Tone_Count).w,a1
		bra.s	FMTone_Control

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM5_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_fm5_track.Transpose).l,a2
		lea	(FM5Tone_Count).w,a1
		bra.s	FMTone_Control

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM6_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_fm6_track.Transpose).l,a2
		lea	(FM6Tone_Count).w,a1
		bra.s	FMTone_Control

; =============== S U B R O U T I N E =======================================

FMTone_UpdateTextInfo:
		lea	(FM1Tone_Count).w,a1
		move.w	#$8001,d3
		locVRAM	$C138,d2
		moveq	#6-1,d7

-		move.l	d2,VDP_control_port-VDP_control_port(a5)
		moveq	#0,d0
		move.b	(a1),d0
		bsr.w	UpdateTextInfo_Draw
		addi.l	#$2000000,d2
		addq.w	#5,a1
		dbf	d7,-
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Control:
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#JoyLeftRight,d1
		beq.s	+
		move.w	#$10,(Sound_test_timer).w
		bra.s	++
; ---------------------------------------------------------------------------
+		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyLeftRight,d1
		beq.s	++
		subq.w	#1,(Sound_test_timer).w
		bpl.s	++
		move.w	#3,(Sound_test_timer).w
+		btst	#button_Left,d1
		beq.s	++
		subq.b	#1,(a1)
		subq.b	#1,(a2)
+		rts
; ---------------------------------------------------------------------------
+		addq.b	#1,(a1)
		addq.b	#1,(a2)
		rts

; =============== S U B R O U T I N E =======================================

FMTone_TextInfo_LoadText:
		subq.w	#1,(TextInfo_Timer).w
		bpl.s	FMTone_VCount_Control_Return
		move.w	#9,(TextInfo_Timer).w
		movea.l	(TextInfo_Pointer).w,a1
		locVRAM	$CD02
		adda.w	(TextInfo_Addr).w,a1
		move.w	#38-1,d7
		bra.w	Select_TextInfo_LoadText_Loop

; =============== S U B R O U T I N E =======================================

FMTone_VCount_Control:
		tst.w	(HoldMode_Flag).w
		bne.s	FMTone_VCount_Control_Return
		move.w	#FMTone_VCount-1,d2
		move.w	(v_Select2_VCount).w,d0
		bsr.w	Select_FindUpDownControls
		move.w	d0,(v_Select2_VCount).w

FMTone_VCount_Control_Return:
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

FMTone_MainText:
		dc.b "FM1:",$83
		dc.b "FM2:",$83
		dc.b "FM3:",$83
		dc.b "FM4:",$83
		dc.b "FM5:",$83
		dc.b "FM6:",-1
	even
FMTone_TextInfoIndex:
		dc.b "                                        "
		dc.b "PRESS UP OR DOWN TO SELECT CHANNEL. "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE TONE. "
		dc.b "PRESS START BUTTON TO RETURN."
		dc.b "                                        ",-1
	even

		CHARSET ; reset character set
