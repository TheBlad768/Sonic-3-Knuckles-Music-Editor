; ===========================================================================
; Player
; ===========================================================================

; Assembly options
OptimiseSound:	  		= 1	; change to 1 to optimise sound queuing
ZeroOffsetOptimization:	= 1	; If 1, makes a handful of zero-offset instructions smaller
AllOptimizations:			= 1	; If 1, enables all optimizations
; ---------------------------------------------------------------------------

; Assembler code
		cpu 68000
		include "MacroSetup.asm"			; include a few basic macros
		include "Constants.asm"			; include constants
		include "Variables.asm"			; include RAM variables
		include "Macros.asm"				; include some simplifying macros and functions
		include "Sound/Definitions.asm"	; include sound driver macros and functions
		include "Data/Debugger/ErrorHandler/Debugger.asm"
; ---------------------------------------------------------------------------

StartOfROM:
	if * <> 0
		fatal "StartOfROM was $\{*} but it should be 0"
	endif
Vectors:
		dc.l $00000000, Security, BusError, AddressError				; 0
		dc.l IllegalInstr, ZeroDivide, ChkInstr, TrapvInstr				; 4
		dc.l PrivilegeViol, Trace, Line1010Emu, Line1111Emu			; 8
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 12
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 16
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 20
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 24
		dc.l ErrorExcept, ErrorExcept, VInt, ErrorExcept				; 28
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 32
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 36
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 40
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 44
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 48
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 52
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 56
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept		; 60
Header:			dc.b "SEGA GENESIS    "
Copyright:		dc.b "(C)SEGA 2020.DEC"
Domestic_Name:	dc.b "SONIC 3 & KNUCKLES MUSIC EDITOR                 "
Overseas_Name:	dc.b "SONIC 3 & KNUCKLES MUSIC EDITOR                 "
Serial_Number:	dc.b "GM MK-0000 -00"
Checksum:		dc.w 0
Input:			dc.b "J               "
RomStartLoc:		dc.l StartOfROM
RomEndLoc:		dc.l EndOfROM-1
RamStartLoc:		dc.l (RAM_start&$FFFFFF)
RamEndLoc:		dc.l (RAM_start&$FFFFFF)+$FFFF
SRAMSupport:
CartRAM_Info:	dc.b "  "
CartRAM_Type:	dc.w %10000000100000
CartRAMStartLoc:dc.l $20202020	; SRAM start ($200000)
CartRAMEndLoc:	dc.l $20202020	; SRAM end ($20xxxx)
Modem_Info:		dc.b "By TheBlad768                                       "
Country_Code:	dc.b "JUE             "
EndOfHeader:
; ---------------------------------------------------------------------------
; Interrupt Handler Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Interrupt Handler.asm"

; ---------------------------------------------------------------------------
; VDP Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/VDP.asm"

; ---------------------------------------------------------------------------
; Controllers Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Controllers.asm"


; ---------------------------------------------------------------------------
; Plane Map To VRAM Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/PlaneMap.asm"

; ---------------------------------------------------------------------------
; Random Number Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Random Number.asm"

; ---------------------------------------------------------------------------
; Decompression Subroutine
; ---------------------------------------------------------------------------

		include "Data/Decompression/Enigma Decompression.asm"
		include "Data/Decompression/Kosinski Decompression.asm"

; ---------------------------------------------------------------------------
; Clone Driver - Functions Subroutine
; ---------------------------------------------------------------------------

		include "Sound/Engine/Functions.asm"

; ---------------------------------------------------------------------------
; Security Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Security.asm"

; ---------------------------------------------------------------------------
; Startup System Subroutine
; ---------------------------------------------------------------------------

		include "Data/Screens/Main.asm"
		include "Data/Screens/Main FM Tone.asm"
		include "Data/Screens/Main PSG Tone.asm"
		include "Data/Screens/Main FM Vol.asm"
		include "Data/Screens/Main PSG Vol.asm"
		include "Data/Screens/Main FM Mute.asm"
		include "Data/Screens/Main PSG Mute.asm"
		include "Data/Screens/Main FM Swap.asm"
		include "Data/Screens/Main DAC Swap.asm"
		include "Data/Screens/Main PSG Swap.asm"
		include "Data/Screens/Main Channels Data.asm"

; ---------------------------------------------------------------------------
; Load Text Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Load Text.asm"

; ---------------------------------------------------------------------------
; Art Data
; ---------------------------------------------------------------------------

ArtKos_StandartText:		binclude "Data/Compressed Data/Art - Text.bin"
	even
ArtKos_MainBG:			binclude "Data/Compressed Data/Art - Main BG.bin"
	even
MapEni_MainBG:			binclude "Data/Compressed Data/Map - Main BG.bin"
	even
Pal_MainScreen:			binclude "Data/Compressed Data/Palette.bin"
	even

; ---------------------------------------------------------------------------
; Clone sound driver subroutines
; ---------------------------------------------------------------------------

	align $8000

		include "Sound/Engine/Sonic 2 Clone Driver v2.asm"

; ---------------------------------------------------------------------------
; Error handling module
; ---------------------------------------------------------------------------

		include "Data/Debugger/ErrorHandler/ErrorHandler.asm"

; end of 'ROM'
EndOfROM:

		END
