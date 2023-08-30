
; =============== S U B R O U T I N E =======================================

Main_ChannelsData:
		disableInts
		bsr.w	ClearPlaneMap
		lea	ChannelsData_MainText(pc),a1
		locVRAM	$C104,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		move.l	#ChannelsData_TextInfoIndex,(TextInfo_Pointer).w
		enableInts
		stopCPU

-		stopCPU
		bsr.w	Select_ScrollingBG
		disableInts
		bsr.w	ChannelsData_UpdateTextInfo
		bsr.w	FMTone_TextInfo_LoadText
		enableInts
		tst.b (Ctrl_1_pressed).w
		bpl.s	-
		disableInts
		bsr.w	ClearPlaneMap
		bra.w	Select_LoadText

; =============== S U B R O U T I N E =======================================

ChannelsData_UpdateTextInfo:
		lea	(Buffer_Values).w,a1
		move.w	#$8001,d3
		locVRAM	$C212,d2
		moveq	#10-1,d7

-		moveq	#6-1,d6

-		move.l	d2,VDP_control_port-VDP_control_port(a5)
		moveq	#0,d0
		move.b	(a1)+,d0
		cmpi.w	#3,d6
		bne.s	+
		ori.b	#$80,d0
+		bsr.w	UpdateTextInfo_Draw
		addi.l	#$80000,d2
		dbf	d6,-
		addi.l	#$D00000,d2
		dbf	d7,--
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

ChannelsData_MainText:
		dc.b "CHAN.  KEY.VOL.FRE.TIM.DUR.VOICE",$81
		dc.b "DAC:",$81
		dc.b "FM1:",$81
		dc.b "FM2:",$81
		dc.b "FM3:",$81
		dc.b "FM4:",$81
		dc.b "FM5:",$81
		dc.b "FM6:",$81
		dc.b "PSG1:",$81
		dc.b "PSG2:",$81
		dc.b "PSG3:",-1
	even

ChannelsData_TextInfoIndex:
		dc.b "                                        "
		dc.b "PRESS START BUTTON TO RETURN."
		dc.b "                                        ",-1
	even

		CHARSET ; reset character set
