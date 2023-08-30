
; Variables
DACSwap_VCount:				= 1

; =============== S U B R O U T I N E =======================================

Main_DAC_Swap:
		disableInts
		bsr.w	ClearPlaneMap
		lea	DACSwap_MainText(pc),a1
		locVRAM	$C104,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		moveq	#0,d0
		move.b	(DACPointer_Count).w,d0
		bsr.w	DACSwap_Change_DAC_Pointer_LoadText
		move.l	#DACSwap_TextInfoIndex,(TextInfo_Pointer).w
		enableInts
		stopCPU

-		stopCPU
		bsr.w	Select_ScrollingBG
		disableInts
		move.w	(v_Select2_VCount).w,d0
		locVRAM	$C102,d1
		move.l	#$2000000,d2
		moveq	#DACSwap_VCount-1,d7
		bsr.w	Select_DrawVCount
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		bsr.s	DACSwap_Change_DAC_Pointer
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText

; =============== S U B R O U T I N E =======================================

DACSwap_Change_DAC_Pointer:
		moveq	#0,d0
		move.w	#(DACSwap_PointerTextIndex_End-DACSwap_PointerTextIndex)/2-1,d2
		move.b	(DACPointer_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(DACPointer_Count).w
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyLeftRight,d1
		beq.s	DACSwap_Change_DAC_Pointer_Return

DACSwap_Change_DAC_Pointer_LoadText:
		lea	DACSwap_PointerTextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		locVRAM	$C138,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText

DACSwap_Change_DAC_Pointer_Return:
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

DACSwap_MainText:
		dc.b "DAC:",-1
	even

DACSwap_TextInfoIndex:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO SWAPPING CHANNEL. "
		dc.b "PRESS START BUTTON TO RETURN."
		dc.b "                                        ",-1
	even

DACSwap_PointerTextIndex: offsetTable
		offsetTableEntry.w DACSwap_PointerText_n0
		offsetTableEntry.w DACSwap_PointerText_n1
		offsetTableEntry.w DACSwap_PointerText_n2
		offsetTableEntry.w DACSwap_PointerText_n3
		offsetTableEntry.w DACSwap_PointerText_n4
		offsetTableEntry.w DACSwap_PointerText_n5
		offsetTableEntry.w DACSwap_PointerText_n6
		offsetTableEntry.w DACSwap_PointerText_n7
		offsetTableEntry.w DACSwap_PointerText_n8
		offsetTableEntry.w DACSwap_PointerText_n9
		offsetTableEntry.w DACSwap_PointerText_nA
		offsetTableEntry.w DACSwap_PointerText_nB
		offsetTableEntry.w DACSwap_PointerText_nC
		offsetTableEntry.w DACSwap_PointerText_nD
		offsetTableEntry.w DACSwap_PointerText_nE
		offsetTableEntry.w DACSwap_PointerText_nF
		offsetTableEntry.w DACSwap_PointerText_n10
		offsetTableEntry.w DACSwap_PointerText_n11
		offsetTableEntry.w DACSwap_PointerText_n12
		offsetTableEntry.w DACSwap_PointerText_n13
		offsetTableEntry.w DACSwap_PointerText_n14
		offsetTableEntry.w DACSwap_PointerText_n15
		offsetTableEntry.w DACSwap_PointerText_n16
		offsetTableEntry.w DACSwap_PointerText_n17
		offsetTableEntry.w DACSwap_PointerText_n18
		offsetTableEntry.w DACSwap_PointerText_n19
		offsetTableEntry.w DACSwap_PointerText_n1A
		offsetTableEntry.w DACSwap_PointerText_n1B
		offsetTableEntry.w DACSwap_PointerText_n1C
		offsetTableEntry.w DACSwap_PointerText_n1D
		offsetTableEntry.w DACSwap_PointerText_n1E
		offsetTableEntry.w DACSwap_PointerText_n1F
		offsetTableEntry.w DACSwap_PointerText_n20
		offsetTableEntry.w DACSwap_PointerText_n21
		offsetTableEntry.w DACSwap_PointerText_n22
		offsetTableEntry.w DACSwap_PointerText_n23
		offsetTableEntry.w DACSwap_PointerText_n24
		offsetTableEntry.w DACSwap_PointerText_n25
		offsetTableEntry.w DACSwap_PointerText_n26
		offsetTableEntry.w DACSwap_PointerText_n27
		offsetTableEntry.w DACSwap_PointerText_n28
		offsetTableEntry.w DACSwap_PointerText_n29
		offsetTableEntry.w DACSwap_PointerText_n2A
		offsetTableEntry.w DACSwap_PointerText_n2B
		offsetTableEntry.w DACSwap_PointerText_n2C
		offsetTableEntry.w DACSwap_PointerText_n2D
		offsetTableEntry.w DACSwap_PointerText_n2E
		offsetTableEntry.w DACSwap_PointerText_n2F
		offsetTableEntry.w DACSwap_PointerText_n30
		offsetTableEntry.w DACSwap_PointerText_n31
		offsetTableEntry.w DACSwap_PointerText_n32
		offsetTableEntry.w DACSwap_PointerText_n33
		offsetTableEntry.w DACSwap_PointerText_n34
		offsetTableEntry.w DACSwap_PointerText_n35
		offsetTableEntry.w DACSwap_PointerText_n36
		offsetTableEntry.w DACSwap_PointerText_n37
		offsetTableEntry.w DACSwap_PointerText_n38
		offsetTableEntry.w DACSwap_PointerText_n39
		offsetTableEntry.w DACSwap_PointerText_n3A
		offsetTableEntry.w DACSwap_PointerText_n3B
		offsetTableEntry.w DACSwap_PointerText_n3C
		offsetTableEntry.w DACSwap_PointerText_n3D
		offsetTableEntry.w DACSwap_PointerText_n3E
		offsetTableEntry.w DACSwap_PointerText_n3F
		offsetTableEntry.w DACSwap_PointerText_n40
		offsetTableEntry.w DACSwap_PointerText_n41
		offsetTableEntry.w DACSwap_PointerText_n42
		offsetTableEntry.w DACSwap_PointerText_n43
		offsetTableEntry.w DACSwap_PointerText_n44
		offsetTableEntry.w DACSwap_PointerText_n45
		offsetTableEntry.w DACSwap_PointerText_n46

DACSwap_PointerTextIndex_End

DACSwap_PointerText_n0:
		dc.b "NONE        ",-1
DACSwap_PointerText_n1:
		dc.b "AIZ1        ",-1
DACSwap_PointerText_n2:
		dc.b "AIZ2        ",-1
DACSwap_PointerText_n3:
		dc.b "HCZ1        ",-1
DACSwap_PointerText_n4:
		dc.b "HCZ2        ",-1
DACSwap_PointerText_n5:
		dc.b "MGZ1        ",-1
DACSwap_PointerText_n6:
		dc.b "MGZ2        ",-1
DACSwap_PointerText_n7:
		dc.b "CNZ1        ",-1
DACSwap_PointerText_n8:
		dc.b "CNZ2        ",-1
DACSwap_PointerText_n9:
		dc.b "FBZ1        ",-1
DACSwap_PointerText_nA:
		dc.b "FBZ2        ",-1
DACSwap_PointerText_nB:
		dc.b "ICZ1        ",-1
DACSwap_PointerText_nC:
		dc.b "ICZ2        ",-1
DACSwap_PointerText_nD:
		dc.b "LBZ1        ",-1
DACSwap_PointerText_nE:
		dc.b "LBZ2        ",-1
DACSwap_PointerText_nF:
		dc.b "MHZ1        ",-1
DACSwap_PointerText_n10:
		dc.b "MHZ2        ",-1
DACSwap_PointerText_n11:
		dc.b "SOZ1        ",-1
DACSwap_PointerText_n12:
		dc.b "SOZ2        ",-1
DACSwap_PointerText_n13:
		dc.b "LRZ1        ",-1
DACSwap_PointerText_n14:
		dc.b "LRZ2        ",-1
DACSwap_PointerText_n15:
		dc.b "SSZ         ",-1
DACSwap_PointerText_n16:
		dc.b "DEZ1        ",-1
DACSwap_PointerText_n17:
		dc.b "DEZ2        ",-1
DACSwap_PointerText_n18:
		dc.b "MID BOSS    ",-1
DACSwap_PointerText_n19:
		dc.b "BOSS        ",-1
DACSwap_PointerText_n1A:
		dc.b "DDZ         ",-1
DACSwap_PointerText_n1B:
		dc.b "PACH BONUS  ",-1
DACSwap_PointerText_n1C:
		dc.b "SPEC STAGE  ",-1
DACSwap_PointerText_n1D:
		dc.b "SLOT BONUS  ",-1
DACSwap_PointerText_n1E:
		dc.b "GUM BONUS   ",-1
DACSwap_PointerText_n1F:
		dc.b "KNUX        ",-1
DACSwap_PointerText_n20:
		dc.b "ALZ         ",-1
DACSwap_PointerText_n21:
		dc.b "BPZ         ",-1
DACSwap_PointerText_n22:
		dc.b "DPZ         ",-1
DACSwap_PointerText_n23:
		dc.b "CGZ         ",-1
DACSwap_PointerText_n24:
		dc.b "EMZ         ",-1
DACSwap_PointerText_n25:
		dc.b "TITLE       ",-1
DACSwap_PointerText_n26:
		dc.b "S3 CREDITS  ",-1
DACSwap_PointerText_n27:
		dc.b "GAME OVER   ",-1
DACSwap_PointerText_n28:
		dc.b "CONTINUE    ",-1
DACSwap_PointerText_n29:
		dc.b "LEVEL OUTRO ",-1
DACSwap_PointerText_n2A:
		dc.b "1UP         ",-1
DACSwap_PointerText_n2B:
		dc.b "EMERALD     ",-1
DACSwap_PointerText_n2C:
		dc.b "INVIC       ",-1
DACSwap_PointerText_n2D:
		dc.b "2P MENU     ",-1
DACSwap_PointerText_n2E:
		dc.b "S3 MID BOSS ",-1
DACSwap_PointerText_n2F:
		dc.b "MENU        ",-1
DACSwap_PointerText_n30:
		dc.b "FINAL BOSS  ",-1
DACSwap_PointerText_n31:
		dc.b "DROWN       ",-1
DACSwap_PointerText_n32:
		dc.b "ENDING      ",-1
DACSwap_PointerText_n33:
		dc.b "SK CREDITS  ",-1
DACSwap_PointerText_n34:
		dc.b "S3C CREDITS ",-1
DACSwap_PointerText_n35:
		dc.b "S3 KNUX     ",-1
DACSwap_PointerText_n36:
		dc.b "S3 TITLE    ",-1
DACSwap_PointerText_n37:
		dc.b "S3 1UP      ",-1
DACSwap_PointerText_n38:
		dc.b "S3 INVIC    ",-1
DACSwap_PointerText_n39:
		dc.b "S3 ENDING   ",-1
DACSwap_PointerText_n3A:
		dc.b "BOSS 2      ",-1
DACSwap_PointerText_n3B:
		dc.b "SPEC STAGE 2",-1
DACSwap_PointerText_n3C:
		dc.b "FINAL BOSS 2",-1
DACSwap_PointerText_n3D:
		dc.b "CNZ1 BETA   ",-1
DACSwap_PointerText_n3E:
		dc.b "CNZ2 BETA   ",-1
DACSwap_PointerText_n3F:
		dc.b "ICZ1 BETA   ",-1
DACSwap_PointerText_n40:
		dc.b "ICZ2 BETA   ",-1
DACSwap_PointerText_n41:
		dc.b "LBZ1 BETA   ",-1
DACSwap_PointerText_n42:
		dc.b "LBZ2 BETA   ",-1
DACSwap_PointerText_n43:
		dc.b "KNUX BETA   ",-1
DACSwap_PointerText_n44:
		dc.b "STAFF ROLL  ",-1
DACSwap_PointerText_n45:
		dc.b "2P BETA     ",-1
DACSwap_PointerText_n46:
		dc.b "UNK 45 BETA ",-1
	even

		CHARSET ; reset character set
