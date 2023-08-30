; ---------------------------------------------------------------------------
; Vertical interrupt handler
; ---------------------------------------------------------------------------

VInt:
		movem.l	d0-a6,-(sp)							; save all the registers to the stack
		move.l	#vdpComm($0000,VSRAM,WRITE),VDP_control_port-VDP_control_port(a5)
		move.l	(V_scroll_value).w,VDP_data_port-VDP_data_port(a6)
		bsr.w	Poll_Controllers
		dma68kToVDP H_scroll_buffer,vram_hscroll,$380,VRAM
		SMPS_UpdateSoundDriver						; Update SMPS
		bsr.s	Sound_CopyData
		movem.l	(sp)+,d0-a6							; return saved registers from the stack
		rte
; ---------------------------------------------------------------------------

Sound_CopyData:
		lea	(Buffer_Values).w,a1
		lea	(Clone_Driver_RAM+SMPS_Track.PlaybackControl).l,a0
		moveq	#10-1,d7

-		move.b	SMPS_Track.Transpose(a0),(a1)+
		move.b	SMPS_Track.Volume(a0),(a1)+
		move.b	SMPS_Track.Freq(a0),(a1)+
		move.b	SMPS_Track.DurationTimeout(a0),(a1)+
		move.b	SMPS_Track.SavedDuration(a0),(a1)+
		move.b	SMPS_Track.VoiceIndex(a0),(a1)+
		lea	SMPS_Track.GoSubStack(a0),a0
		dbf	d7,-
		rts