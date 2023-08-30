
; =============== S U B R O U T I N E =======================================

System_LoadText:
		move.l	#$800000,d2

System_LoadText_SetPos:
		move.l	d1,VDP_control_port-VDP_control_port(a5)

System_LoadText_Loop:
		moveq	#0,d0
		move.b	(a1)+,d0
		bmi.s	System_LoadText_Options
		add.w	d3,d0						; VRAM shift
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		bra.s	System_LoadText_Loop
; ---------------------------------------------------------------------------

System_LoadText_Options:
		cmpi.b	#-1,d0						; If $FF flag, stop loading letters
		beq.s	System_LoadText_Return

System_LoadText_NextLine:
		andi.w	#$1F,d0						; If $80-$9F flag, load letters to the next line

-		add.l	d2,d1
		dbf	d0,-
		bra.s	System_LoadText_SetPos
; ---------------------------------------------------------------------------

System_LoadText_Return:
		rts
; End of function Load_PlaneText