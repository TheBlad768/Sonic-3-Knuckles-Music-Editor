; ===========================================================================
; RAM variables
; ===========================================================================

; sign-extends a 32-bit integer to 64-bit
; all RAM addresses are run through this function to allow them to work in both 16-bit and 32-bit addressing modes
ramaddr function x,(-(x&$80000000)<<1)|x

; RAM variables - General
	phase	ramaddr($FFFF0000)	; Pretend we're in the RAM
RAM_Start:							ds.b $7000				; Chunk (128x128) definitions, $80 bytes per definition
v_snddriver_ram:						ds.b $1000				; Start of RAM for the sound driver data

DMA_data_thunk:											; Used as a RAM holder for the final DMA command word. Data will NOT be preserved across V-INTs, so consider this space reserved
DMA_trigger_word:					ds.w 1					; Transferred from RAM to avoid crashing the Mega Drive
H_scroll_buffer:						ds.l 224					; Horizontal scroll table is built up here and then DMAed to VRAM
V_scroll_value:												; Both foreground and background
v_scrposy_dup:
V_scroll_value_FG:					ds.w 1
V_scroll_value_BG:					ds.w 1
H_scroll_value:
v_scrposx_dup:
H_scroll_value_FG:					ds.w 1
H_scroll_value_BG:					ds.w 1
RNG_seed:							ds.l 1

Buffer_Values:						ds.b 10*6				; $40 bytes (Equalizer data)
Buffer_Values_End

long_464A:							ds.l 1
long_464E:							ds.l 1
word_4652:							ds.w 1
word_4654:							ds.w 1
word_4656:							ds.w 1
word_4658:							ds.w 1

Ctrl_1:
Ctrl_1_held:							ds.b 1
Ctrl_1_pressed:						ds.b 1
MusicPlay_Count:						ds.w 1
v_Select_VCount:						ds.w 1
v_Select2_VCount:					ds.w 1
Sound_test_timer:					ds.w 1
MusicVoice_Count:					ds.w 1
MusicVoice_Index:					ds.w 1
ToneMode_Count:						ds.w 1
VolMode_Count:						ds.w 1
MuteMode_Count:					ds.w 1
SwapMode_Count:					ds.w 1
HoldMode_Flag:						ds.w 1
TextInfo_Timer:						ds.w 1
TextInfo_Addr:						ds.w 1
TextInfo_Pointer:						ds.l 1

UniFMTone_Count:					ds.b 1
UniPSGTone_Count:					ds.b 1
UniFMVol_Count:						ds.b 1
UniPSGVol_Count:					ds.b 1
UniFMMute_Count:					ds.b 1
UniDACMute_Count:					ds.b 1
UniPSGMute_Count:					ds.b 1
Tempo_Count:						ds.b 1

; Channel data
DACPointer_Count:					ds.b 1
DACAddr_Count:						ds.b 1
DACTone_Count:						ds.b 1
DACVol_Count:						ds.b 1
DACMute_Count:						ds.b 1

FM1Pointer_Count:					ds.b 1
FM1Addr_Count:						ds.b 1
FM1Tone_Count:						ds.b 1
FM1Vol_Count:						ds.b 1
FM1Mute_Count:						ds.b 1

FM2Pointer_Count:					ds.b 1
FM2Addr_Count:						ds.b 1
FM2Tone_Count:						ds.b 1
FM2Vol_Count:						ds.b 1
FM2Mute_Count:						ds.b 1

FM3Pointer_Count:					ds.b 1
FM3Addr_Count:						ds.b 1
FM3Tone_Count:						ds.b 1
FM3Vol_Count:						ds.b 1
FM3Mute_Count:						ds.b 1

FM4Pointer_Count:					ds.b 1
FM4Addr_Count:						ds.b 1
FM4Tone_Count:						ds.b 1
FM4Vol_Count:						ds.b 1
FM4Mute_Count:						ds.b 1

FM5Pointer_Count:					ds.b 1
FM5Addr_Count:						ds.b 1
FM5Tone_Count:						ds.b 1
FM5Vol_Count:						ds.b 1
FM5Mute_Count:						ds.b 1

FM6Pointer_Count:					ds.b 1
FM6Addr_Count:						ds.b 1
FM6Tone_Count:						ds.b 1
FM6Vol_Count:						ds.b 1
FM6Mute_Count:						ds.b 1

PSG1Pointer_Count:					ds.b 1
PSG1Addr_Count:						ds.b 1
PSG1Tone_Count:						ds.b 1
PSG1Vol_Count:						ds.b 1
PSG1Mute_Count:						ds.b 1

PSG2Pointer_Count:					ds.b 1
PSG2Addr_Count:					ds.b 1
PSG2Tone_Count:						ds.b 1
PSG2Vol_Count:						ds.b 1
PSG2Mute_Count:					ds.b 1

PSG3Pointer_Count:					ds.b 1
PSG3Addr_Count:						ds.b 1
PSG3Tone_Count:						ds.b 1
PSG3Vol_Count:						ds.b 1
PSG3Mute_Count:					ds.b 1


Current_RAM_start					!align $FFF0				; Unused data
Current_RAM_end
									ds.l 4					; (Unused)
	if * > 0	; Don't declare more space than the RAM can contain!
		fatal "The RAM variable declarations are too large by $\{*} bytes."
	endif

	dephase		; Stop pretending
	!org	0		; Reset the program counter