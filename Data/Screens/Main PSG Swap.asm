
; =============== S U B R O U T I N E =======================================

Main_PSG_Swap:
		disableInts
		bsr.w	ClearPlaneMap
		lea	PSGTone_MainText(pc),a1
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
		locVRAM	$C502,d1
		move.l	#$2000000,d2
		moveq	#PSGTone_VCount-1,d7
		bsr.w	Select_DrawVCount
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	PSGSwap_Index(pc,d0.w),d1
		jsr	PSGSwap_Index(pc,d1.w)
		bsr.w	PSGSwap_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		bsr.w	PSGTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

PSGSwap_Index: offsetTable
		offsetTableEntry.w PSGSwap_Change_PSG1_Swap		; 0
		offsetTableEntry.w PSGSwap_Change_PSG2_Swap	; 1
		offsetTableEntry.w PSGSwap_Change_PSG3_Swap		; 2

; =============== S U B R O U T I N E =======================================

PSGSwap_Change_PSG1_Swap:
		tst.b	(PSG1Pointer_Count).w
		beq.s	PSGSwap_Change_PSG1_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	PSGSwap_Change_PSG1_Swap_LoadIndex

PSGSwap_Change_PSG1_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(PSG1Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG1Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

PSGSwap_Change_PSG1_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#3-1,d2
		move.b	(PSG1Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG1Addr_Count).w
		locVRAM	$C138,d1
		bra.w	PSGSwap_Change_PSG_Swap_LoadText

; =============== S U B R O U T I N E =======================================

PSGSwap_Change_PSG2_Swap:
		tst.b	(PSG2Pointer_Count).w
		beq.s	PSGSwap_Change_PSG2_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	PSGSwap_Change_PSG2_Swap_LoadIndex

PSGSwap_Change_PSG2_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(PSG2Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG2Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

PSGSwap_Change_PSG2_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#3-1,d2
		move.b	(PSG2Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG2Addr_Count).w
		locVRAM	$C338,d1
		bra.w	PSGSwap_Change_PSG_Swap_LoadText

; =============== S U B R O U T I N E =======================================

PSGSwap_Change_PSG3_Swap:
		tst.b	(PSG3Pointer_Count).w
		beq.s	PSGSwap_Change_PSG3_Swap_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	PSGSwap_Change_PSG3_Swap_LoadIndex

PSGSwap_Change_PSG3_Swap_Change:
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(PSG3Pointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG3Pointer_Count).w
		rts
; ---------------------------------------------------------------------------

PSGSwap_Change_PSG3_Swap_LoadIndex:
		moveq	#0,d0
		move.w	#-1,(HoldMode_Flag).w
		move.w	#3-1,d2
		move.b	(PSG3Addr_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(PSG3Addr_Count).w
		locVRAM	$C538,d1

; =============== S U B R O U T I N E =======================================

PSGSwap_Change_PSG_Swap_LoadText:
		lea	PSGSwap_TextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$A000,d3
		bra.w	System_LoadText

; =============== S U B R O U T I N E =======================================

PSGSwap_UpdateTextInfo:
		tst.w	(HoldMode_Flag).w
		bne.s	PSGSwap_UpdateTextInfo_Return
		lea	(PSG1Pointer_Count).w,a2
		locVRAM	$C138,d4
		moveq	#3-1,d7
		bsr.w	FMSwap_UpdateTextInfo_Loop

PSGSwap_UpdateTextInfo_Return:
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

PSGSwap_TextIndex: offsetTable
		offsetTableEntry.w PSGSwap_TextIndex_n0
		offsetTableEntry.w PSGSwap_TextIndex_n1
		offsetTableEntry.w PSGSwap_TextIndex_n2

PSGSwap_TextIndex_n0:
		dc.b "PSG1         ",-1
PSGSwap_TextIndex_n1:
		dc.b "PSG2         ",-1
PSGSwap_TextIndex_n2:
		dc.b "PSG3         ",-1
	even

		CHARSET ; reset character set
