; ===========================================================================
; Constants
; ===========================================================================

; ---------------------------------------------------------------------------
; VDP addresses
; ---------------------------------------------------------------------------

VDP_data_port =					$C00000
VDP_control_port =				$C00004
VDP_counter =					$C00008

PSG_input =						$C00011

; ---------------------------------------------------------------------------
; Address equates
; ---------------------------------------------------------------------------

; Z80 addresses
Z80_RAM =						$A00000	; start of Z80 RAM
Z80_RAM_end =					$A02000	; end of non-reserved Z80 RAM
Z80_bus_request =				$A11100
Z80_reset =						$A11200

; ---------------------------------------------------------------------------
; I/O Area
; ---------------------------------------------------------------------------

HW_Version =					$A10001
HW_Port_1_Data =				$A10003
HW_Port_2_Data =				$A10005
HW_Expansion_Data =			$A10007
HW_Port_1_Control =				$A10009
HW_Port_2_Control =				$A1000B
HW_Expansion_Control =			$A1000D
HW_Port_1_TxData =				$A1000F
HW_Port_1_RxData =				$A10011
HW_Port_1_SCtrl =				$A10013
HW_Port_2_TxData =				$A10015
HW_Port_2_RxData =				$A10017
HW_Port_2_SCtrl =				$A10019
HW_Expansion_TxData =			$A1001B
HW_Expansion_RxData =			$A1001D
HW_Expansion_SCtrl =			$A1001F

; ---------------------------------------------------------------------------
; SRAM addresses
; ---------------------------------------------------------------------------

SRAM_access_flag =				$A130F1
Security_addr =					$A14000

; ---------------------------------------------------------------------------
; Buttons bit numbers
; ---------------------------------------------------------------------------

button_up:						equ	0
button_down:					equ	1
button_left:						equ	2
button_right:						equ	3
button_B:						equ	4
button_C:						equ	5
button_A:						equ	6
button_start:						equ	7

; ---------------------------------------------------------------------------
; Buttons masks
; ---------------------------------------------------------------------------

JoyUp:							equ	1
JoyDown:						equ	2
JoyUpDown:						equ	3
JoyLeft:							equ	4
JoyRight:						equ	8
JoyLeftRight:						equ	$C
JoyCursor:						equ	$F
JoyB:							equ	$10
JoyC:							equ	$20
JoyA:							equ	$40
JoyAB:							equ	$50
JoyAC:							equ	$60
JoyABC:							equ	$70
JoyStart:							equ	$80
JoyBStart:						equ	$90
JoyABCS:						equ	$F0
; ---------------------------------------------------------------------------
; Buttons masks (1 << x == pow(2, x))
button_up_mask:					equ	1<<button_up	; $01
button_down_mask:				equ	1<<button_down	; $02
button_left_mask:					equ	1<<button_left	; $04
button_right_mask:				equ	1<<button_right	; $08
button_B_mask:					equ	1<<button_B		; $10
button_C_mask:					equ	1<<button_C		; $20
button_A_mask:					equ	1<<button_A		; $40
button_start_mask:				equ	1<<button_start	; $80
; ---------------------------------------------------------------------------
; Joypad input
btnStart:		equ %10000000		; Start button	($80)
btnA:		equ %01000000		; A ($40)
btnC:		equ %00100000		; C ($20)
btnB:		equ %00010000		; B ($10)
btnR:		equ %00001000		; Right ($08)
btnL:		equ %00000100		; Left ($04)
btnDn:		equ %00000010		; Down ($02)
btnUp:		equ %00000001		; Up	($01)
btnDir:		equ %00001111		; Any direction ($0F)
btnABC:		equ %01110000		; A, B or C ($70)
bitStart:		equ 7
bitA:		equ 6
bitC:		equ 5
bitB:		equ 4
bitR:		equ 3
bitL:		equ 2
bitDn:		equ 1
bitUp:		equ 0
; ---------------------------------------------------------------------------
iStart		equ	7
iA			equ	6
iB			equ	4
iC			equ	5
iRight		equ	3
iLeft			equ	2
iDown		equ	1
iUp			equ	0

Start		equ	1<<7
A			equ	1<<6
B			equ	1<<4
C			equ	1<<5
Right		equ	1<<3
Left			equ	1<<2
Down		equ	1<<1
Up			equ	1

Held		= 0
Press		= 1
; ---------------------------------------------------------------------------
; VRAM data
vram_fg:				= $C000 ; foreground namespace
vram_window:		= $C000 ; window namespace
vram_bg:			= $E000 ; background namespace
vram_sprites:			= $D400 ; sprite table
vram_hscroll:			= $F000 ; horizontal scroll table