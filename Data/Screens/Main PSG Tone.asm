
; Variables
PSGTone_VCount:				= 3

; =============== S U B R O U T I N E =======================================

Main_Change_PSG_Tone:
		disableInts
		bsr.w	ClearPlaneMap
		lea	PSGTone_MainText(pc),a1
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
		locVRAM	$C502,d1
		move.l	#$2000000,d2
		moveq	#PSGTone_VCount-1,d7
		bsr.w	Select_DrawVCount
		bsr.w	PSGTone_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	PSGTone_Index(pc,d0.w),d1
		jsr	PSGTone_Index(pc,d1.w)
		bsr.w	PSGTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

PSGTone_Index: offsetTable
		offsetTableEntry.w PSGTone_Change_PSG1_Tone	; 0
		offsetTableEntry.w PSGTone_Change_PSG2_Tone	; 1
		offsetTableEntry.w PSGTone_Change_PSG3_Tone	; 2

; =============== S U B R O U T I N E =======================================

PSGTone_Change_PSG1_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_psg1_track.Transpose).l,a2
		lea	(PSG1Tone_Count).w,a1
		bra.w	FMTone_Control

; =============== S U B R O U T I N E =======================================

PSGTone_Change_PSG2_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_psg2_track.Transpose).l,a2
		lea	(PSG2Tone_Count).w,a1
		bra.w	FMTone_Control

; =============== S U B R O U T I N E =======================================

PSGTone_Change_PSG3_Tone:
		lea	(Clone_Driver_RAM+SMPS_RAM.v_music_psg3_track.Transpose).l,a2
		lea	(PSG3Tone_Count).w,a1
		bra.w	FMTone_Control

; =============== S U B R O U T I N E =======================================

PSGTone_UpdateTextInfo:
		lea	(PSG1Tone_Count).l,a1
		move.w	#$8001,d3
		locVRAM	$C138,d2
		moveq	#3-1,d7

-		move.l	d2,VDP_control_port-VDP_control_port(a5)
		moveq	#0,d0
		move.b	(a1),d0
		bsr.w	UpdateTextInfo_Draw
		addi.l	#$2000000,d2
		addq.w	#5,a1
		dbf	d7,-
		rts

; =============== S U B R O U T I N E =======================================

PSGTone_VCount_Control:
		tst.w	(HoldMode_Flag).w
		bne.s	PSGTone_VCount_Control_Return
		move.w	#PSGTone_VCount-1,d2
		move.w	(v_Select2_VCount).w,d0
		bsr.w	Select_FindUpDownControls
		move.w	d0,(v_Select2_VCount).w

PSGTone_VCount_Control_Return:
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

PSGTone_MainText:
		dc.b "PSG1:",$83
		dc.b "PSG2:",$83
		dc.b "PSG3:",-1
	even

		CHARSET ; reset character set
