; ---------------------------------------------------------------------------
; Sound IDs
; ---------------------------------------------------------------------------
; Background music
offset :=	MusicIndex
ptrsize :=	4
idstart :=	1
; $00 is reserved for silence

bgm__First = idstart

bgm_MainMenu =	SMPS_id(ptr_mus_46)

bgm__Last =			SMPS_id(ptr_musend)-1

; Sound effects
offset :=	SoundIndex
ptrsize :=	4
idstart :=	$80

sfx__First = idstart
sfx__Last =			SMPS_id(ptr_sndend)-1

; Sound commands
offset :=	Sound_ExIndex
ptrsize :=	2
idstart :=	$FA

flg__First = idstart
sfx_Fade =			SMPS_id(ptr_flgFA)
bgm_Fade =			SMPS_id(ptr_flgFB)
sfx_Sega =			SMPS_id(ptr_flgFC)
bgm_Speedup =		SMPS_id(ptr_flgFD)
bgm_Slowdown =		SMPS_id(ptr_flgFE)
bgm_Stop =			SMPS_id(ptr_flgFF)
flg__Last =			SMPS_id(ptr_flgend)-1
