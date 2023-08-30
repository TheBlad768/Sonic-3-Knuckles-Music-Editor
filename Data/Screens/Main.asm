
; Variables
Select_VCount:					= 7

; =============== S U B R O U T I N E =======================================

Startup:
		movea.l	SetupValues.VDP(pc),a6
		lea	VDP_control_port-VDP_data_port(a6),a5
-		move.w	VDP_control_port-VDP_control_port(a5),d0
		btst	#1,d0
		bne.s	-
		lea	((RAM_start&$FFFFFF)).l,a1
		moveq	#0,d0
		move.w	#bytesToLcnt($FFF0),d1
-		move.l	d0,(a1)+
		dbf	d1,-
		bsr.w	Init_VDP
		bsr.w	SoundDriverLoad
		bsr.w	Init_Controllers

; Loading text art
		lea	(ArtKos_StandartText).l,a0
		lea	(RAM_start).l,a1
		jsr	(Kos_Decomp).l
		dma68kToVDP RAM_Start,$20,tiles_to_bytes($29),VRAM

; Loading BG art
		lea	(ArtKos_MainBG).l,a0
		lea	(RAM_start).l,a1
		jsr	(Kos_Decomp).l
		dma68kToVDP RAM_Start,$800,tiles_to_bytes($105),VRAM

; Loading BG map
		lea	(MapEni_MainBG).l,a0
		lea	(RAM_start).l,a1
		move.w	#$6040,d0
		bsr.w	Eni_Decomp
		CopyTileMap	$E000,512,256

; Loading palette
		lea	(Pal_MainScreen).l,a0
		lea	(RAM_start).l,a1
		moveq	#0,d0
		bsr.w	Eni_Decomp
		move.l	#vdpComm($0000,CRAM,WRITE),VDP_control_port-VDP_control_port(a5)
		moveq	#(64/2)-1,d0

-		move.l	(a1)+,VDP_data_port-VDP_data_port(a6)
		dbf	d0,-

; Set BG scroll parameter
		move.w	#1,(word_4656).w
		move.w	#1,(word_4658).w
		music	bgm_MainMenu,0,0,0

Select_LoadText:
		lea	Player_MainText(pc),a1
		locVRAM	$C584,d1
		move.w	#$8000,d3
		bsr.w	System_LoadText
		clr.w	(HoldMode_Flag).w
		clr.w	(TextInfo_Addr).w
		move.w	(MusicVoice_Count).w,d0
		bsr.w	Settings_Change_VoiceBank_LoadText
		bsr.w	Select_MainText_LoadText
		bsr.w	Select_Main2Text_LoadText
		bsr.w	Select_Main3Text_LoadText
		bsr.w	Select_MuteInfo_LoadText
		move.w	(SwapMode_Count).w,d0
		bsr.w	Select_SwapInfo_LoadText
		bsr.w	Select_ScrollingBG
		enableInts
		stopCPU

Select_Loop:
		stopCPU
		bsr.w	Select_ScrollingBG
		disableInts
		move.w	(v_Select_VCount).w,d0
		locVRAM	$CA02,d1
		move.l	#$1800000,d2
		moveq	#Select_VCount-1,d7
		bsr.w	Select_DrawVCount
		bsr.w	UpdateTextInfo
		bsr.w	Select_TextInfo_LoadText
		moveq	#0,d0
		move.w	(v_Select_VCount).w,d0
		add.w	d0,d0
		move.w	Select_Index(pc,d0.w),d0
		jsr	Select_Index(pc,d0.w)
		enableInts
		bsr.w	Select_VCount_Control
		tst.b (Ctrl_1_pressed).w
		bpl.s	Select_Loop
		moveq	#0,d0
		move.w	d0,(v_Select2_VCount).w
		move.w	d0,(HoldMode_Flag).w
		move.w	(v_Select_VCount).w,d0
		add.w	d0,d0
		move.w	Select2_Index(pc,d0.w),d0
		beq.s	Select_Loop
		clr.w	(TextInfo_Addr).w
		jmp	Select2_Index(pc,d0.w)
; ---------------------------------------------------------------------------

Select_Index: offsetTable
		offsetTableEntry.w Select_Change_Tone_LoadIndex	; 0
		offsetTableEntry.w Select_Change_Vol_LoadIndex		; 1
		offsetTableEntry.w Select_Change_Mute_LoadIndex	; 2
		offsetTableEntry.w Select_Swap_Channel				; 3
		offsetTableEntry.w Settings_Change_Tempo			; 4
		offsetTableEntry.w Settings_Change_VoiceBank		; 5
		offsetTableEntry.w Select_Music						; 6
Select2_Index: offsetTable
		offsetTableEntry.w Load_Change_Tone_Menu			; 0
		offsetTableEntry.w Load_Change_Vol_Menu			; 1
		offsetTableEntry.w Load_Change_Mute_Menu			; 2
		offsetTableEntry.w Load_Change_Swap_Menu		; 3
		offsetTableEntry.w Select2_Index					; 4
		offsetTableEntry.w Select2_Index					; 5
		offsetTableEntry.w Main_ChannelsData				; 6

; =============== S U B R O U T I N E =======================================

Load_Change_Tone_Menu:
		lea	Main_Change_FM_Tone(pc),a1
		tst.w	(ToneMode_Count).w
		beq.s	+
		lea	Main_Change_PSG_Tone(pc),a1
+		jmp	(a1)

; =============== S U B R O U T I N E =======================================

Load_Change_Vol_Menu:
		lea	Main_Change_FM_Vol(pc),a1
		tst.w	(VolMode_Count).w
		beq.s	+
		lea	Main_Change_PSG_Vol(pc),a1
+		jmp	(a1)

; =============== S U B R O U T I N E =======================================

Load_Change_Mute_Menu:
		move.w	(MuteMode_Count).w,d0
		lea	Load_Change_Mute_Menu_Index(pc),a1
		bra.s	Load_Change_Swap_Menu_Jump
; ---------------------------------------------------------------------------

Load_Change_Mute_Menu_Index: offsetTable
		offsetTableEntry.w Main_Change_FM_Mute	; 0
		offsetTableEntry.w Select_Loop				; 1
		offsetTableEntry.w Main_Change_PSG_Mute	; 2
Load_Change_Swap_Menu_Index: offsetTable
		offsetTableEntry.w Main_FM_Swap			; 0
		offsetTableEntry.w Main_DAC_Swap			; 1
		offsetTableEntry.w Main_PSG_Swap			; 2

; =============== S U B R O U T I N E =======================================

Load_Change_Swap_Menu:
		move.w	(SwapMode_Count).w,d0
		lea	Load_Change_Swap_Menu_Index(pc),a1

Load_Change_Swap_Menu_Jump:
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		jmp	(a1)

; =============== S U B R O U T I N E =======================================

Select_Change_Tone_LoadIndex:
		pea	Select_MainText_LoadText(pc)
		move.w	#-1,(HoldMode_Flag).w
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	Select_Change_ToneMode
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	(ToneMode_Count).w,d0
		add.w	d0,d0
		move.w	Select_Change_FM_Index(pc,d0.w),d0
		jmp	Select_Change_FM_Index(pc,d0.w)
; ---------------------------------------------------------------------------

Select_Change_FM_Index: offsetTable
		offsetTableEntry.w Select_Change_FM_Tone		; 0
		offsetTableEntry.w Select_Change_PSG_Tone		; 1
; ---------------------------------------------------------------------------

Select_Change_FM_Tone:
		moveq	#0,d0
		move.b	(UniFMTone_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(UniFMTone_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_PSG_Tone:
		moveq	#0,d0
		move.b	(UniPSGTone_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(UniPSGTone_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_ToneMode:
		move.w	#2-1,d2
		move.w	(ToneMode_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(ToneMode_Count).w
		bsr.w	Select_FindUpDownControls_Inversion
		move.w	d0,(ToneMode_Count).w
		rts

; =============== S U B R O U T I N E =======================================

Select_Change_Vol_LoadIndex:
		pea	Select_Main2Text_LoadText(pc)
		move.w	#-1,(HoldMode_Flag).w
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	Select_Change_VolMode
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	(VolMode_Count).w,d0
		add.w	d0,d0
		move.w	Select_Change_Vol_Index(pc,d0.w),d0
		jmp	Select_Change_Vol_Index(pc,d0.w)
; ---------------------------------------------------------------------------

Select_Change_Vol_Index: offsetTable
		offsetTableEntry.w Select_Change_FM_Vol		; 0
		offsetTableEntry.w Select_Change_PSG_Vol		; 1
; ---------------------------------------------------------------------------

Select_Change_FM_Vol:
		moveq	#0,d0
		move.b	(UniFMVol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(UniFMVol_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_PSG_Vol:
		moveq	#0,d0
		move.b	(UniPSGVol_Count).w,d0
		bsr.w	Select_Control
		move.b	d0,(UniPSGVol_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_VolMode:
		move.w	#2-1,d2
		move.w	(VolMode_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(VolMode_Count).w
		bsr.w	Select_FindUpDownControls_Inversion
		move.w	d0,(VolMode_Count).w
		rts

; =============== S U B R O U T I N E =======================================

Select_Change_Mute_LoadIndex:
		pea	Select_Main3Text_LoadText(pc)
		pea	Select_MuteInfo_LoadText(pc)
		move.w	#-1,(HoldMode_Flag).w
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	Select_Change_MuteMode
		moveq	#0,d0
		move.w	d0,(HoldMode_Flag).w
		move.w	(MuteMode_Count).w,d0
		add.w	d0,d0
		move.w	Select_Change_Mute_Index(pc,d0.w),d0
		jmp	Select_Change_Mute_Index(pc,d0.w)
; ---------------------------------------------------------------------------

Select_Change_Mute_Index: offsetTable
		offsetTableEntry.w Select_Change_FM_Mute		; 0
		offsetTableEntry.w Select_Change_DAC_Mute		; 1
		offsetTableEntry.w Select_Change_PSG_Mute		; 2
; ---------------------------------------------------------------------------

Select_Change_FM_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(UniFMMute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(UniFMMute_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_DAC_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(UniDACMute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(UniDACMute_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_PSG_Mute:
		moveq	#0,d0
		move.w	#2-1,d2
		move.b	(UniPSGMute_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.b	d0,(UniPSGMute_Count).w
		rts
; ---------------------------------------------------------------------------

Select_Change_MuteMode:
		move.w	#3-1,d2
		move.w	(MuteMode_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(MuteMode_Count).w
		bsr.w	Select_FindUpDownControls_Inversion
		move.w	d0,(MuteMode_Count).w

Select_Change_MuteMode_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_MuteInfo_LoadText:
		move.w	(MuteMode_Count).w,d0
		add.w	d0,d0
		movea.w	UpdateTextInfo_RAMIndex(pc,d0.w),a0
		moveq	#0,d0
		move.b	(a0),d0

Select_MuteInfo_LoadText2:
		lea	Player_MuteTextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		locVRAM	$C438,d1
		move.w	#$8000,d3
		bra.w	System_LoadText
; ---------------------------------------------------------------------------

UpdateTextInfo_RAMIndex:
		dc.w UniFMMute_Count
		dc.w UniDACMute_Count
		dc.w UniPSGMute_Count

; =============== S U B R O U T I N E =======================================

Select_Swap_Channel:
		move.w	#3-1,d2
		move.w	(SwapMode_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(SwapMode_Count).w
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyLeftRight,d1
		beq.s	Select_Change_MuteMode_Return

Select_SwapInfo_LoadText:
		lea	Player_SwapTextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		locVRAM	$C5B8,d1
		move.w	#$8000,d3
		bra.w	System_LoadText

; =============== S U B R O U T I N E =======================================

Settings_Change_Tempo:
		lea	(Clone_Driver_RAM+SMPS_RAM.variables.v_main_tempo).l,a2
		lea	(Tempo_Count).w,a1
		bra.w	FMTone_Control

; =============== S U B R O U T I N E =======================================

Settings_Change_VoiceBank:
		tst.w	(MusicVoice_Count).w
		beq.s	Settings_Change_VoiceBank_Change
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyABC,d1
		bne.s	Settings_Change_VoiceBank_LoadIndex

Settings_Change_VoiceBank_Change:
		clr.w	(HoldMode_Flag).w
		move.w	#(Player_TextIndex_End-Player_TextIndex)/2-1,d2
		move.w	(MusicVoice_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(MusicVoice_Count).w

Settings_Change_VoiceBank_LoadText:
		lea	Player_TextIndex(pc),a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		locVRAM	$C8B8,d1
		move.w	#$8000,d3
		bra.w	System_LoadText
; ---------------------------------------------------------------------------

Settings_Change_VoiceBank_LoadIndex:
		move.w	#-1,(HoldMode_Flag).w
		move.w	#$24,d2
		move.w	(MusicVoice_Index).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(MusicVoice_Index).w
		bsr.w	Select_FindUpDownControls_Inversion
		move.w	d0,(MusicVoice_Index).w
		locVRAM	$C8BC
		moveq	#0,d0		; VRAM
		moveq	#10-1,d7

-		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d7,-
		locVRAM	$C8B8
		move.w	(MusicVoice_Index).w,d0
		move.w	#$A001,d3
		bra.w	UpdateTextInfo_Draw

; =============== S U B R O U T I N E =======================================

Select_Music:
		move.w	#(ptr_musend-MusicIndex)/4,d2
		move.w	(MusicPlay_Count).w,d0
		bsr.w	Select_FindLeftRightControls
		move.w	d0,(MusicPlay_Count).w
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#JoyABC,d1
		beq.s	Select_Control_Return
		move.b	d0,(Clone_Driver_RAM+SMPS_RAM.variables.queue.v_playsnd2).l

Select_Control_Return:
		rts

; =============== S U B R O U T I N E =======================================

UpdateTextInfo:
		move.w	#$8001,d3

; Tone
		locVRAM	$C138
		moveq	#0,d0
		move.b	(UniFMTone_Count).w,d0
		tst.w	(ToneMode_Count).w
		beq.s	+
		move.b	(UniPSGTone_Count).w,d0
+		bsr.s	UpdateTextInfo_Draw

; Vol
		locVRAM	$C2B8
		moveq	#0,d0
		move.b	(UniFMVol_Count).w,d0
		tst.w	(VolMode_Count).w
		beq.s	+
		move.b	(UniPSGVol_Count).w,d0
+		bsr.s	UpdateTextInfo_Draw

; Tempo
		locVRAM	$C738
		moveq	#0,d0
		move.b	(Tempo_Count).w,d0
		bsr.s	UpdateTextInfo_Draw

; Music ID
		locVRAM	$CA38
		move.w	(MusicPlay_Count).w,d0

UpdateTextInfo_Draw:
		move.b	d0,d1
		lsr.b	#4,d0
		bsr.s	+
		move.b	d1,d0
+		andi.w	#16-1,d0
		cmpi.b	#10,d0
		blo.s		+
		addq.b	#4,d0
+		add.w	d3,d0
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		rts

; =============== S U B R O U T I N E =======================================

Select_VCount_Control:
		tst.w	(HoldMode_Flag).w
		bne.s	Select_VCount_Control_Return
		move.w	#Select_VCount-1,d2
		move.w	(v_Select_VCount).w,d0
		bsr.s	Select_FindUpDownControls
		move.w	d0,(v_Select_VCount).w
		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyUpDown,d1
		beq.s	Select_VCount_Control_Return
		clr.w	(TextInfo_Addr).w

Select_VCount_Control_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_FindUpDownControls:
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#JoyUpDown,d1
		beq.s	+
		move.w	#$10,(Sound_test_timer).w
		bra.s	++
+		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyUpDown,d1
		beq.s	Select_FindUpDownControls_Return
		subq.w	#1,(Sound_test_timer).w
		bpl.s	Select_FindUpDownControls_Return
		move.w	#3,(Sound_test_timer).w
+		btst	#button_up,d1
		beq.s	+
		subq.w	#1,d0
		bpl.s	+
		move.w	d2,d0
+		btst	#button_down,d1
		beq.s	Select_FindUpDownControls_Return
		addq.w	#1,d0
		cmp.w	d2,d0
		ble.s		Select_FindUpDownControls_Return
		moveq	#0,d0

Select_FindUpDownControls_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_FindUpDownControls_Inversion:
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#JoyUpDown,d1
		beq.s	+
		move.w	#$10,(Sound_test_timer).w
		bra.s	++
+		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyUpDown,d1
		beq.s	Select_FindUpDownControls_Inversion_Return
		subq.w	#1,(Sound_test_timer).w
		bpl.s	Select_FindUpDownControls_Inversion_Return
		move.w	#3,(Sound_test_timer).w
+		btst	#button_down,d1
		beq.s	+
		subq.w	#1,d0
		bpl.s	+
		move.w	d2,d0
+		btst	#button_up,d1
		beq.s	Select_FindUpDownControls_Inversion_Return
		addq.w	#1,d0
		cmp.w	d2,d0
		ble.s		Select_FindUpDownControls_Inversion_Return
		moveq	#0,d0

Select_FindUpDownControls_Inversion_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_FindLeftRightControls:
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#JoyLeftRight,d1
		beq.s	+
		move.w	#$10,(Sound_test_timer).w
		bra.s	++
+		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyLeftRight,d1
		beq.s	Select_FindLeftRightControls_Return
		subq.w	#1,(Sound_test_timer).w
		bpl.s	Select_FindLeftRightControls_Return
		move.w	#3,(Sound_test_timer).w
+		btst	#button_left,d1
		beq.s	+
		subq.w	#1,d0
		bpl.s	+
		move.w	d2,d0
+		btst	#button_right,d1
		beq.s	Select_FindLeftRightControls_Return
		addq.w	#1,d0
		cmp.w	d2,d0
		ble.s		Select_FindLeftRightControls_Return
		moveq	#0,d0

Select_FindLeftRightControls_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_Control:
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
		subq.b	#1,d0
+		rts
; ---------------------------------------------------------------------------
+		addq.b	#1,d0
		rts

; =============== S U B R O U T I N E =======================================

Select_DrawVCount:
;		moveq	#0,d3

-		move.l	d1,VDP_control_port-VDP_control_port(a5)
		moveq	#0,d3			; Пробел
		cmp.w	d0,d7
		bne.s	+
		addi.w	#$800C,d3		; >
+		move.w	d3,VDP_data_port-VDP_data_port(a6)
		sub.l	d2,d1
		dbf	d7,-

Select_DrawVCount_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_MainText_LoadText:
		lea	Player_MainTextIndex(pc),a1
		move.w	(ToneMode_Count).w,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$8000,d3
		tst.w	(HoldMode_Flag).w
		beq.s	+
		addi.w	#$2000,d3
+		locVRAM	$C104,d1
		bra.w	System_LoadText

; =============== S U B R O U T I N E =======================================

Select_Main2Text_LoadText:
		lea	Player_Main2TextIndex(pc),a1
		move.w	(VolMode_Count).w,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$8000,d3
		tst.w	(HoldMode_Flag).w
		beq.s	+
		addi.w	#$2000,d3
+		locVRAM	$C284,d1
		bra.w	System_LoadText

; =============== S U B R O U T I N E =======================================

Select_Main3Text_LoadText:
		lea	Player_Main3TextIndex(pc),a1
		move.w	(MuteMode_Count).w,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	#$8000,d3
		tst.w	(HoldMode_Flag).w
		beq.s	+
		addi.w	#$2000,d3
+		locVRAM	$C404,d1
		bra.w	System_LoadText

; =============== S U B R O U T I N E =======================================

Select_TextInfo_LoadText:
		subq.w	#1,(TextInfo_Timer).w
		bpl.s	Select_TextInfo_LoadText_Loop_Return
		move.w	#9,(TextInfo_Timer).w
		locVRAM	$CD02
		lea	Player_TextInfoIndex(pc),a1
		move.w	(v_Select_VCount).w,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		adda.w	(TextInfo_Addr).w,a1
		move.w	#38-1,d7

Select_TextInfo_LoadText_Loop:
		moveq	#0,d0
		move.b	(a1)+,d0
		bmi.s	Select_TextInfo_LoadText_Restart
		ori.w	#$8000,d0
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d7,Select_TextInfo_LoadText_Loop
		addq.w	#1,(TextInfo_Addr).w

Select_TextInfo_LoadText_Loop_Return:
		rts
; ---------------------------------------------------------------------------

Select_TextInfo_LoadText_Restart:
		clr.w	(TextInfo_Addr).w

Select_TextInfo_LoadText_Return:
		rts

; =============== S U B R O U T I N E =======================================

Select_ScrollingBG:
		tst.w	(word_4652).w
		bmi.s	loc_2FD6
		cmpi.w	#512,(word_4652).w
		bhi.s	loc_2FE6
		bra.s	loc_3014
; ---------------------------------------------------------------------------

loc_2FD6:
		cmpi.w	#-512,(word_4652).w
		blt.s		loc_2FE6
		bra.s	loc_3014
; ---------------------------------------------------------------------------

loc_2FE6:
		neg.w	(word_4656).w
		move.w	(word_4656).w,d0
		add.w	d0,(word_4652).w
		bsr.w	Random_Number
		andi.w	#7,d0
		addq.w	#1,d0
		tst.w (word_4656).w
		bpl.s	+
		neg.w	d0
+		move.w	d0,(word_4656).w

loc_3014:
		move.w	(word_4656).w,d0
		add.w	d0,(word_4652).w
		move.w	(word_4652).w,d0
		ext.l	d0
		lsl.l	#8,d0
		add.l	d0,(long_464A).w
		tst.w	(word_4654).w
		bmi.s	loc_304A
		cmpi.w	#512,(word_4654).w
		bhi.s	loc_305A
		bra.s	loc_3088
; ---------------------------------------------------------------------------

loc_304A:
		cmpi.w	#-512,(word_4654).w
		blt.s		loc_305A
		bra.s	loc_3088
; ---------------------------------------------------------------------------

loc_305A:
		neg.w	(word_4658).w
		move.w	(word_4658).w,d0
		add.w	d0,(word_4654).w
		bsr.w	Random_Number
		andi.w	#7,d0
		addq.w	#1,d0
		tst.w	(word_4658).w
		bpl.s	+
		neg.w	d0
+		move.w	d0,(word_4658).w

loc_3088:
		move.w	(word_4658).w,d0
		add.w	d0,(word_4654).w
		move.w	(word_4654).w,d0
		ext.l	d0
		lsl.l	#8,d0
		add.l	d0,(long_464E).w
		move.w	(long_464A).w,(H_scroll_buffer+2).w
		move.w	(long_464E).w,(V_scroll_value+2).w

Select_ScrollingBG_Return:
		rts
; ---------------------------------------------------------------------------

	; set the character
		CHARSET ' ', 0
		CHARSET '0','9', 1
		CHARSET '<', $B
		CHARSET '>', $C
		CHARSET ':', $D
		CHARSET '.', $E
		CHARSET 'A','Z', $F
		CHARSET 'a','z', $F

Player_MainText:
		dc.b "CURRENT CHANNEL SWAPPING:",$82
		dc.b "CURRENT TEMPO:",$82
		dc.b "CURRENT VOICE BANK:",$82
		dc.b "SOUND TEST:",-1
	even

Player_MainTextIndex: offsetTable
		offsetTableEntry.w Player_MainText_n0
		offsetTableEntry.w Player_MainText_n1

Player_MainText_n0:
		dc.b "CURRENT FM PITCH: ",-1
Player_MainText_n1:
		dc.b "CURRENT PSG PITCH:",-1
	even

Player_Main2TextIndex: offsetTable
		offsetTableEntry.w Player_Main2Text_n0
		offsetTableEntry.w Player_Main2Text_n1

Player_Main2Text_n0:
		dc.b "CURRENT FM VOLUME: ",-1
Player_Main2Text_n1:
		dc.b "CURRENT PSG VOLUME:",-1
	even

Player_Main3TextIndex: offsetTable
		offsetTableEntry.w Player_Main3Text_n0
		offsetTableEntry.w Player_Main3Text_n1
		offsetTableEntry.w Player_Main3Text_n2

Player_Main3Text_n0:
		dc.b "CURRENT FM CHANNELS: ",-1
Player_Main3Text_n1:
		dc.b "CURRENT DAC CHANNEL: ",-1
Player_Main3Text_n2:
		dc.b "CURRENT PSG CHANNELS:",-1
	even

Player_MuteTextIndex: offsetTable
		offsetTableEntry.w Player_MuteText_n0
		offsetTableEntry.w Player_MuteText_n1

Player_MuteText_n0:
		dc.b "UNMUTE",-1
Player_MuteText_n1:
		dc.b "MUTE  ",-1
	even

Player_SwapTextIndex: offsetTable
		offsetTableEntry.w Player_SwapText_n0
		offsetTableEntry.w Player_SwapText_n1
		offsetTableEntry.w Player_SwapText_n2

Player_SwapText_n0:
		dc.b "FM ",-1
Player_SwapText_n1:
		dc.b "DAC",-1
Player_SwapText_n2:
		dc.b "PSG",-1
	even

Player_TextInfoIndex: offsetTable
		offsetTableEntry.w Player_TextInfo_n0
		offsetTableEntry.w Player_TextInfo_n1
		offsetTableEntry.w Player_TextInfo_n2
		offsetTableEntry.w Player_TextInfo_n3
		offsetTableEntry.w Player_TextInfo_n4
		offsetTableEntry.w Player_TextInfo_n5
		offsetTableEntry.w Player_TextInfo_n6

Player_TextInfo_n0:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE TONE. "
		dc.b "HOLD ABC TO CHANGE CHANNELS. "
		dc.b "PRESS START BUTTON TO ENTER SETTINGS."
		dc.b "                                        ",-1
Player_TextInfo_n1:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE VOLUME. "
		dc.b "HOLD ABC TO CHANGE CHANNELS. "
		dc.b "PRESS START BUTTON TO ENTER SETTINGS."
		dc.b "                                        ",-1
Player_TextInfo_n2:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO MUTE CHANNELS. "
		dc.b "HOLD ABC TO CHANGE CHANNELS. "
		dc.b "PRESS START BUTTON TO ENTER SETTINGS."
		dc.b "                                        ",-1
Player_TextInfo_n3:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO SELECT CHANNELS. "
		dc.b "PRESS START BUTTON TO ENTER SETTINGS."
		dc.b "                                        ",-1
Player_TextInfo_n4:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE TEMPO."
		dc.b "                                        ",-1
Player_TextInfo_n5:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE VOICE BANK. "
		dc.b "HOLD ABC TO CHANGE VOICE ID."
		dc.b "                                        ",-1
Player_TextInfo_n6:
		dc.b "                                        "
		dc.b "PRESS LEFT OR RIGHT TO CHANGE MUSIC ID. "
		dc.b "PRESS ABC FOR PLAY CURRENT MUSIC. "
		dc.b "PRESS START BUTTON TO VIEW CHANNELS DATA."
		dc.b "                                        ",-1
	even

Player_TextIndex: offsetTable
		offsetTableEntry.w Player_Text_n0
		offsetTableEntry.w Player_Text_n1
		offsetTableEntry.w Player_Text_n2
		offsetTableEntry.w Player_Text_n3
		offsetTableEntry.w Player_Text_n4
		offsetTableEntry.w Player_Text_n5
		offsetTableEntry.w Player_Text_n6
		offsetTableEntry.w Player_Text_n7
		offsetTableEntry.w Player_Text_n8
		offsetTableEntry.w Player_Text_n9
		offsetTableEntry.w Player_Text_nA
		offsetTableEntry.w Player_Text_nB
		offsetTableEntry.w Player_Text_nC
		offsetTableEntry.w Player_Text_nD
		offsetTableEntry.w Player_Text_nE
		offsetTableEntry.w Player_Text_nF
		offsetTableEntry.w Player_Text_n10
		offsetTableEntry.w Player_Text_n11
		offsetTableEntry.w Player_Text_n12
		offsetTableEntry.w Player_Text_n13
		offsetTableEntry.w Player_Text_n14
		offsetTableEntry.w Player_Text_n15
		offsetTableEntry.w Player_Text_n16
		offsetTableEntry.w Player_Text_n17
		offsetTableEntry.w Player_Text_n18
		offsetTableEntry.w Player_Text_n19
		offsetTableEntry.w Player_Text_n1A
		offsetTableEntry.w Player_Text_n1B
		offsetTableEntry.w Player_Text_n1C
		offsetTableEntry.w Player_Text_n1D
		offsetTableEntry.w Player_Text_n1E
		offsetTableEntry.w Player_Text_n1F
		offsetTableEntry.w Player_Text_n20
		offsetTableEntry.w Player_Text_n21
		offsetTableEntry.w Player_Text_n22
		offsetTableEntry.w Player_Text_n23
		offsetTableEntry.w Player_Text_n24
		offsetTableEntry.w Player_Text_n25
		offsetTableEntry.w Player_Text_n26
		offsetTableEntry.w Player_Text_n27
		offsetTableEntry.w Player_Text_n28
		offsetTableEntry.w Player_Text_n29
		offsetTableEntry.w Player_Text_n2A
		offsetTableEntry.w Player_Text_n2B
		offsetTableEntry.w Player_Text_n2C
		offsetTableEntry.w Player_Text_n2D
		offsetTableEntry.w Player_Text_n2E
		offsetTableEntry.w Player_Text_n2F
		offsetTableEntry.w Player_Text_n30
		offsetTableEntry.w Player_Text_n31
		offsetTableEntry.w Player_Text_n32

Player_TextIndex_End

Player_Text_n0:
		dc.b "NONE        ",-1
Player_Text_n1:
		dc.b "UNI BANK    ",-1
Player_Text_n2:
		dc.b "MGZ1        ",-1
Player_Text_n3:
		dc.b "MGZ2        ",-1
Player_Text_n4:
		dc.b "CNZ         ",-1
Player_Text_n5:
		dc.b "FBZ1        ",-1
Player_Text_n6:
		dc.b "FBZ2        ",-1
Player_Text_n7:
		dc.b "ICZ         ",-1
Player_Text_n8:
		dc.b "LBZ         ",-1
Player_Text_n9:
		dc.b "MHZ1        ",-1
Player_Text_nA:
		dc.b "MHZ2        ",-1
Player_Text_nB:
		dc.b "SOZ1        ",-1
Player_Text_nC:
		dc.b "SOZ2        ",-1
Player_Text_nD:
		dc.b "SSZ         ",-1
Player_Text_nE:
		dc.b "DEZ1        ",-1
Player_Text_nF:
		dc.b "DEZ2        ",-1
Player_Text_n10:
		dc.b "MID BOSS    ",-1
Player_Text_n11:
		dc.b "BOSS        ",-1
Player_Text_n12:
		dc.b "DDZ         ",-1
Player_Text_n13:
		dc.b "PACH BONUS  ",-1
Player_Text_n14:
		dc.b "SPEC STAGE  ",-1
Player_Text_n15:
		dc.b "SLOT BONUS  ",-1
Player_Text_n16:
		dc.b "GUM BONUS   ",-1
Player_Text_n17:
		dc.b "KNUX        ",-1
Player_Text_n18:
		dc.b "ALZ         ",-1
Player_Text_n19:
		dc.b "BPZ         ",-1
Player_Text_n1A:
		dc.b "EMZ         ",-1
Player_Text_n1B:
		dc.b "TITLE       ",-1
Player_Text_n1C:
		dc.b "S3 CREDITS  ",-1
Player_Text_n1D:
		dc.b "GAME OVER   ",-1
Player_Text_n1E:
		dc.b "1UP         ",-1
Player_Text_n1F:
		dc.b "EMERALD     ",-1
Player_Text_n20:
		dc.b "INVIC       ",-1
Player_Text_n21:
		dc.b "2P MENU     ",-1
Player_Text_n22:
		dc.b "S3 MID BOSS ",-1
Player_Text_n23:
		dc.b "FINAL BOSS  ",-1
Player_Text_n24:
		dc.b "DROWN       ",-1
Player_Text_n25:
		dc.b "ENDING      ",-1
Player_Text_n26:
		dc.b "SK CREDITS  ",-1
Player_Text_n27:
		dc.b "S3C CREDITS ",-1
Player_Text_n28:
		dc.b "S3 KNUX     ",-1
Player_Text_n29:
		dc.b "S3 TITLE    ",-1
Player_Text_n2A:
		dc.b "S3 1UP      ",-1
Player_Text_n2B:
		dc.b "S3 INVIC    ",-1
Player_Text_n2C:
		dc.b "S3 ENDING   ",-1
Player_Text_n2D:
		dc.b "ICZ1 BETA   ",-1
Player_Text_n2E:
		dc.b "ICZ2 BETA   ",-1
Player_Text_n2F:
		dc.b "KNUX BETA   ",-1
Player_Text_n30:
		dc.b "STAFF ROLL  ",-1
Player_Text_n31:
		dc.b "2P BETA     ",-1
Player_Text_n32:
		dc.b "UNK 45 BETA ",-1
	even

		CHARSET ; reset character set

; =============== S U B R O U T I N E =======================================

SoundDriver_Banks:
		dc.l UniVoiceBank					; 1
		dc.l Snd_MGZ1_Voices				; 2
		dc.l Snd_MGZ2_Voices			; 3
		dc.l Snd_CNZ_Voices				; 4
		dc.l Snd_FBZ1_Voices				; 5
		dc.l Snd_FBZ2_Voices				; 6
		dc.l Snd_ICZ_Voices				; 7
		dc.l Snd_LBZ_Voices				; 8
		dc.l Snd_MHZ1_Voices				; 9
		dc.l Snd_MHZ2_Voices			; A
		dc.l Snd_SOZ1_Voices				; B
		dc.l Snd_SOZ2_Voices				; C
		dc.l Snd_SSZ_Voices				; D
		dc.l Snd_DEZ1_Voices				; E
		dc.l Snd_DEZ2_Voices				; F
		dc.l Snd_Minib_SK_Voices			; 10
		dc.l Snd_Boss_Voices				; 11
		dc.l Snd_DDZ_Voices				; 12
		dc.l Snd_PachBonus_Voices		; 13
		dc.l Snd_SpecialS_Voices			; 14
		dc.l Snd_SlotBonus_Voices			; 15
		dc.l Snd_GumBonus_Voices		; 16
		dc.l Snd_Knux_Voices				; 17
		dc.l Snd_ALZ_Voices				; 18
		dc.l Snd_BPZ_Voices				; 19
		dc.l Snd_EMZ_Voices				; 1A
		dc.l Snd_Title_Voices				; 1B
		dc.l Snd_S3Credits_Voices			; 1C
		dc.l Snd_GameOver_Voices			; 1D
		dc.l Snd_1UP_Voices				; 1E
		dc.l Snd_Emerald_Voices			; 1F
		dc.l Snd_Invic_Voices				; 20
		dc.l Snd_2PMenu_Voices			; 21
		dc.l Snd_Miniboss_Voices			; 22
		dc.l Snd_FinalBoss_Voices			; 23
		dc.l Snd_Drown_Voices			; 24
		dc.l Snd_PresSega_Voices			; 25
		dc.l Snd_SKCredits_Voices			; 26
		dc.l Sonic_3C_0517_credits_Voices	; 27
		dc.l Snd_KnuxS3_Voices			; 28
		dc.l Snd_TitleS3_Voices			; 29
		dc.l Snd_1UPS3_Voices			; 2A
		dc.l Snd_InvicS3_Voices			; 2B
		dc.l Snd_PresSegaS3_Voices		; 2C
		dc.l Snd_ICZ1Beta_Voices			; 2D
		dc.l Snd_ICZ2Beta_Voices			; 2E
		dc.l Snd_KnuxBeta_Voices			; 2F
		dc.l Snd_StaffRoll_Voices			; 30
		dc.l Snd_2PMenuBeta_Voices		; 31
		dc.l Snd_Music2E_Voices			; 32









