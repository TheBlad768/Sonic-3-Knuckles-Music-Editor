
; =============== S U B R O U T I N E =======================================

Main_Change_PSG_Vol:
		disableInts
		bsr.w	ClearPlaneMap
		lea	PSGTone_MainText(pc),a1
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
		locVRAM	$C502,d1
		move.l	#$2000000,d2
		moveq	#PSGTone_VCount-1,d7
		bsr.w	Select_DrawVCount
		bsr.w	PSGVol_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		moveq	#0,d0
		move.w	(v_Select2_VCount).w,d0
		add.w	d0,d0
		move.w	PSGVol_Index(pc,d0.w),d1
		jsr	PSGVol_Index(pc,d1.w)
		bsr.w	PSGTone_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText
; ---------------------------------------------------------------------------

PSGVol_Index: offsetTable
		offsetTableEntry.w PSGVol_Change_PSG1_Vol	; 0
		offsetTableEntry.w PSGVol_Change_PSG2_Vol	; 1
		offsetTableEntry.w PSGVol_Change_PSG3_Vol	; 2

; =============== S U B R O U T I N E =======================================

PSGVol_Change_PSG1_Vol:
		moveq	#0,d0
		move.b	(PSG1Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(PSG1Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

PSGVol_Change_PSG2_Vol:
		moveq	#0,d0
		move.b	(PSG2Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(PSG2Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

PSGVol_Change_PSG3_Vol:
		moveq	#0,d0
		move.b	(PSG3Vol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(PSG3Vol_Count).w
		rts

; =============== S U B R O U T I N E =======================================

PSGVol_UpdateTextInfo:
		lea	(PSG1Vol_Count).l,a1
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
