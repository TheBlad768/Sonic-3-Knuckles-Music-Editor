
; =============== S U B R O U T I N E =======================================

Main_FM_Swap:
		disableInts
		bsr.w	ClearPlaneMap
		lea	FMTone_MainText(pc),a1
		locVRAM	$C104,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		move.l	#FMSwap_TextInfoIndex,(TextInfo_Pointer).w
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
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	FMSwap_Index(pc,d0.w),d1
		jsr	FMSwap_Index(pc,d1.w)
		bsr.w	FMSwap_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		bsr.w	FMTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

FMSwap_Index: offsetTable
		offsetTableEntry.w FMSwap_Change_FM1_Swap	; 0
		offsetTableEntry.w FMSwap_Change_FM2_Swap	; 1
		offsetTableEntry.w FMSwap_Change_FM3_Swap	; 2
		offsetTableEntry.w FMSwap_Change_FM4_Swap	; 3
		offsetTableEntry.w FMSwap_Change_FM5_Swap	; 4
		offsetTableEntry.w FMSwap_Change_FM6_Swap	; 5

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM1_Swap:
		tst.b	(FM1Pointer_Count).w
		beq.s	FMSwap_Change_FM1_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	FMSwap_Change_FM1_Swap_LoadIndex

FMSwap_Change_FM1_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(FM1Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM1Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

FMSwap_Change_FM1_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#6-1,d2
		move.b	(FM1Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM1Addr_Count).w
		locVRAM	$C138,d1
		bra.w	FMSwap_Change_FM_Swap_LoadText

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM2_Swap:
		tst.b	(FM2Pointer_Count).w
		beq.s	FMSwap_Change_FM2_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	FMSwap_Change_FM2_Swap_LoadIndex

FMSwap_Change_FM2_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(FM2Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM2Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

FMSwap_Change_FM2_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#6-1,d2
		move.b	(FM2Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM2Addr_Count).w
		locVRAM	$C338,d1
		bra.w	FMSwap_Change_FM_Swap_LoadText

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM3_Swap:
		tst.b	(FM3Pointer_Count).w
		beq.s	FMSwap_Change_FM3_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	FMSwap_Change_FM3_Swap_LoadIndex

FMSwap_Change_FM3_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(FM3Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM3Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

FMSwap_Change_FM3_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#6-1,d2
		move.b	(FM3Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM3Addr_Count).w
		locVRAM	$C538,d1
		bra.w	FMSwap_Change_FM_Swap_LoadText

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM4_Swap:
		tst.b	(FM4Pointer_Count).w
		beq.s	FMSwap_Change_FM4_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	FMSwap_Change_FM4_Swap_LoadIndex

FMSwap_Change_FM4_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(FM4Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM4Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

FMSwap_Change_FM4_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#6-1,d2
		move.b	(FM4Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM4Addr_Count).w
		locVRAM	$C738,d1
		bra.w	FMSwap_Change_FM_Swap_LoadText

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM5_Swap:
		tst.b	(FM5Pointer_Count).w
		beq.s	FMSwap_Change_FM5_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	FMSwap_Change_FM5_Swap_LoadIndex

FMSwap_Change_FM5_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(FM5Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM5Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

FMSwap_Change_FM5_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#6-1,d2
		move.b	(FM5Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM5Addr_Count).w
		locVRAM	$C938,d1
		bra.s	FMSwap_Change_FM_Swap_LoadText

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM6_Swap:
		tst.b	(FM6Pointer_Count).w
		beq.s	FMSwap_Change_FM6_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	FMSwap_Change_FM6_Swap_LoadIndex

FMSwap_Change_FM6_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(FM6Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM6Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

FMSwap_Change_FM6_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#6-1,d2
		move.b	(FM6Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(FM6Addr_Count).w
		locVRAM	$CB38,d1

; =============== S U B R O U T I N E =======================================

FMSwap_Change_FM_Swap_LoadText:
		lea	FMSwap_TextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$A000,d3
		bra.w	System_LoadText

; =============== S U B R O U T I N E =======================================

FMSwap_UpdateTextInfo:
		tst.w	(HoldMode_Flag).w
		bne.s	FMSwap_UpdateTextInfo_Return
		lea	(FM1Pointer_Count).w,a2
		locVRAM	$C138,d4
		moveq	#6-1,d7

FMSwap_UpdateTextInfo_Loop:
		move.l	d4,d1
		moveq	#0,d0
		move.b	(a2),d0
		lea	DACSwap_PointerTextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		addi.l	#$2000000,d4
		addq.w	#5,a2
		dbf	d7,FMSwap_UpdateTextInfo_Loop

FMSwap_UpdateTextInfo_Return:
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

FMSwap_TextIndex: offsetTable
		offsetTableEntry.w FMSwap_TextIndex_n0
		offsetTableEntry.w FMSwap_TextIndex_n1
		offsetTableEntry.w FMSwap_TextIndex_n2
		offsetTableEntry.w FMSwap_TextIndex_n3
		offsetTableEntry.w FMSwap_TextIndex_n4
		offsetTableEntry.w FMSwap_TextIndex_n5

FMSwap_TextIndex_n0:
		dc.b "FM1         ",-1
FMSwap_TextIndex_n1:
		dc.b "FM2         ",-1
FMSwap_TextIndex_n2:
		dc.b "FM3         ",-1
FMSwap_TextIndex_n3:
		dc.b "FM4         ",-1
FMSwap_TextIndex_n4:
		dc.b "FM5         ",-1
FMSwap_TextIndex_n5:
		dc.b "FM6         ",-1
	even

FMSwap_TextInfoIndex:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO SWAPPING CHANNEL. "
		dc.b "HOLD ABC TO CHANGE CHANNEL. "
		dc.b "PRESS START BUTTON TO RETURN."
		dc.b "                                        ",-1
	even

		CHARSET ; reset character set
