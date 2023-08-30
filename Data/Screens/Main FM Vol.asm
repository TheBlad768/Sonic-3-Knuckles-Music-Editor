
; =============== S U B R O U T I N E =======================================

Main_Change_FM_Vol:
		disableInts
		bsr.w	ClearPlaneMap
		lea	FMTone_MainText(pc),a1
		locVRAM	$C104,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		move.l	#FMVol_TextInfoIndex,(TextInfo_Pointer).w
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
		bsr.w	FMVol_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	FMVol_Index(pc,d0.w),d1
		jsr	FMVol_Index(pc,d1.w)
		bsr.w	FMTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

FMVol_Index: offsetTable
		offsetTableEntry.w FMTone_Change_FM1_Vol		; 0
		offsetTableEntry.w FMTone_Change_FM2_Vol	; 1
		offsetTableEntry.w FMTone_Change_FM3_Vol	; 2
		offsetTableEntry.w FMTone_Change_FM4_Vol	; 3
		offsetTableEntry.w FMTone_Change_FM5_Vol	; 4
		offsetTableEntry.w FMTone_Change_FM6_Vol	; 5

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM1_Vol:
		moveq	#0,d0
		move.b	(FM1Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(FM1Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM2_Vol:
		moveq	#0,d0
		move.b	(FM2Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(FM2Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM3_Vol:
		moveq	#0,d0
		move.b	(FM3Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(FM3Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM4_Vol:
		moveq	#0,d0
		move.b	(FM4Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(FM4Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM5_Vol:
		moveq	#0,d0
		move.b	(FM5Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(FM5Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

FMTone_Change_FM6_Vol:
		moveq	#0,d0
		move.b	(FM6Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(FM6Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

FMVol_UpdateTextInfo:
		lea	(FM1Vol_Count).w,a1
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

FMVol_TextInfoIndex:
		dc.b "                                        "
		dc.b "PRESS UP OR DOWN TO SELECT CHANNEL. "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE VOLUME. "
		dc.b "PRESS START BUTTON TO RETURN."
		dc.b "                                        ",-1
	even

		CHARSET ; reset character set
