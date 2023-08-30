Snd_SpecialS2_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     Snd_SpecialS_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $07

	smpsHeaderDAC       Snd_SpecialS2_DAC
	smpsHeaderFM        Snd_SpecialS2_FM1,		$00, $17
	smpsHeaderFM        Snd_SpecialS2_FM2,	$00, $0F
	smpsHeaderFM        Snd_SpecialS2_FM3,		$00, $17
	smpsHeaderFM        Snd_SpecialS2_FM4,	$00, $17
	smpsHeaderFM        Snd_SpecialS2_FM5,		$00, $1F
	smpsHeaderFM        Snd_SpecialS2_FM6,	$00, $00
	smpsHeaderPSG       Snd_SpecialS2_PSG1,	$00, $05, $00, fTone_05
	smpsHeaderPSG       Snd_SpecialS2_PSG2,	$00, $05, $00, fTone_05
	smpsHeaderPSG       Snd_SpecialS2_PSG3,	$00, $04, $00, fTone_02

; FM6 Data
Snd_SpecialS2_FM6:
	smpsStop

; FM1 Data
Snd_SpecialS2_FM1:
	smpsSetvoice        $01
	dc.b	nE5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06, nRst, $06
	smpsAlterVol        $E8
	dc.b	nE4, nB3
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nFs4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nAb4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nB4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nD5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE5, $06, nE5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE5, $06, nE5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE5, $06, nE5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nD5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nD5, $06, nD5, $0C, nE5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $0C, nRst, $54

Snd_SpecialS2_Loop0D:
	smpsAlterVol        $E8
	smpsSetvoice        $03
	smpsModSet          $14, $01, $06, $06
	smpsCall            Snd_SpecialS2_Call07
	dc.b	nE6, $2A
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $12
	smpsAlterVol        $F4
	smpsCall            Snd_SpecialS2_Call07
	smpsModOff
	dc.b	nE6, $0C
	smpsAlterNote       $FC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $EC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $DC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $DC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $EC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $FC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $00
	dc.b	smpsNoAttack, $06
	smpsModSet          $14, $01, $06, $06
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $12
	smpsAlterVol        $0C
	smpsLoop            $00, $02, Snd_SpecialS2_Loop0D
	dc.b	nRst, $60
	smpsAlterVol        $E8
	smpsCall            Snd_SpecialS2_Call08
	dc.b	nE6, $0C, nC6, nF6, nE6, nC6, nF6, nE6, nC6, nF6, nE6, nC6
	dc.b	nF6, nE6, nC6, nD6
	smpsCall            Snd_SpecialS2_Call08
	dc.b	nE6, $0C, nC6, nF6, nE6, $12, nG6, nB6, $0C, nC7, $60
	smpsCall            Snd_SpecialS2_Call02
	dc.b	nA5, $0C, nG5, $60
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0C
	smpsAlterVol        $F4
	smpsCall            Snd_SpecialS2_Call02
	dc.b	nF6, $0C, nE6, nF6, $18, nE6, nF6, nG6
	smpsAlterVol        $06
	smpsSetvoice        $04
	dc.b	nA6, $66, nA5, $06, nA6, nA5, nA6, $0C
	smpsCall            Snd_SpecialS2_Call03
	dc.b	nEb4
	smpsAlterVol        $12
	smpsJump            Snd_SpecialS2_Loop0D

Snd_SpecialS2_Call07:
	dc.b	nE6, $0C, nC6, $06, nE6
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nFs6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	nG6, $06
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA6, $02, nBb6, nB6, $0E, nA6, $54
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $18
	smpsAlterVol        $F4
	dc.b	nE6, $0C, nC6, $06, nE6
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nFs6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	nG6, $06
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA6, $02, nBb6, nB6, $0E, nA6, $18, nG6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nFs6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	smpsReturn

Snd_SpecialS2_Call08:
	dc.b	nE6, $18, $18, nD6, $24, nE6, $18, $18, $0C, nD6, $30, nE6
	dc.b	$18, $18, nD6, $0C, $18, nB5, $18, nC6, $54
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $18
	smpsAlterVol        $F4
	dc.b	nA5, $18, nC6, nA6, nG6, nB6, $0C, nC7, $18, $0C, nG6, $0C
	dc.b	nF6, $18
	smpsReturn

Snd_SpecialS2_Call02:
	dc.b	nE6, $24, $06, $06, $12, nA5, $12, nE6, $0C, nD6, $60, nC6
	dc.b	$24, $06, $06, $12, nA5, $12, nC6, $0C, nB5, nG5, nE5, nG5
	dc.b	$3C, nA5, $24, $06, $06, $12, nC6, $12, nA6, $0C, nG6, $18
	dc.b	nB6, $0C, nC7, $18, $0C, nG6, $18, nF6, $0C, nE6, nC6, nF6
	dc.b	nE6, nC6
	smpsReturn

Snd_SpecialS2_Call03:
	dc.b	nG6, $06, nE6, nD6, $0C, nD6, $02, nE6, $04, nD6, $0C, nE6
	dc.b	nD6, nD5, $06, nB4, nA4, nG4, nE4, nD4, nE4, nG4, nE4, nG4
	dc.b	nA4, nB4, nA4, nB4, nD5, nD5, $03, nE5, $09, nD5, $0C, nB4
	dc.b	$06, nA4, nB4, nD5, nE5, nD5, nE5, nFs5, nG5, nA5, nB5, nCs6
	dc.b	nD6, nCs6, nB5, nG6, nFs6, nE6, nFs6, nE6, nD6, nFs6, nE6, nD6
	dc.b	nCs6, $04, nD6, nCs6, nB5, $06, nA5, nFs5, nE5, nD5, nCs5, $04
	dc.b	nD5, $06, nCs5, $08, nB4, $06, nA4, nG4, $0C, nA4, $06, nG4
	dc.b	$0C, nFs4, nE4, nFs4, $06, nD4, nE4, nFs4, nG4, nA4, nB4, nG4
	dc.b	nA4, nCs5, nD5, nE5, nFs5, nG5, nFs5, nG5, $03, nA5, $09, nG5
	dc.b	$06, nE5, $0C, nD5, $06, nRst, nE5, nRst, nD5, nA4, nG4, smpsNoAttack
	dc.b	$0C, nFs4, $03, nF4, nE4
	smpsReturn

; FM2 Data
Snd_SpecialS2_FM2:
	smpsSetvoice        $00
	dc.b	nRst, $12, nA2, $06, nE2, nRst, nA2, nRst, nB2, nRst, nCs3, nRst
	dc.b	nE2, nRst, nFs2, nRst, nA2, nA2, nE3, nA3, nA3, nRst, nA3, nA3
	dc.b	nRst, nG3, nRst, nG3, nG2, nD3, nG3, $0C, nRst, $60

Snd_SpecialS2_Loop0C:
	smpsCall            Snd_SpecialS2_Call04
	smpsLoop            $00, $04, Snd_SpecialS2_Loop0C
	dc.b	nRst, $60
	smpsCall            Snd_SpecialS2_Call05
	dc.b	nD3, $12, $06, nRst, $0C, nD3, $0C, $12, $12, $0C, nG3, $12
	dc.b	$06, nRst, $0C, nG3, $0C, $18, $18
	smpsCall            Snd_SpecialS2_Call05
	dc.b	nD3, $12, nA3, nD3, $0C, nD3, $12, nG3, nC3, $0C, nC3, $06
	dc.b	nC3, nG3, nC4, nC4, nRst, nC4, nC4, nRst, nBb3, nRst, nBb3, nBb2
	dc.b	nF3, nBb3, $0C
	smpsCall            Snd_SpecialS2_Call06
	dc.b	nG3, $0C, nC3, $54, nD3, $0C, nE3
	smpsCall            Snd_SpecialS2_Call06
	dc.b	nG3, $18, nF3, nE3, nD3, nB2
	smpsCall            Snd_SpecialS2_Call04
	dc.b	nA2, $12, nA3, nB2, $0C, nC3, $12, nC4, nE3, $0C, nD3, $12
	dc.b	nD4, nD3, $0C, nD3, $12, nC4, nC3, $0C, nA2, $12, nA3, nB2
	dc.b	$0C, nC3, $12, nC4, nE3, $0C, nD3, $12, nD4, nD3, $0C, nD3
	dc.b	$12, nD4, nG3, $0C
	smpsJump            Snd_SpecialS2_Loop0C

Snd_SpecialS2_Call04:
	dc.b	nA2, $12, nA3, nB2, $0C, nC3, $12, nC4, nE3, $0C, nD3, $12
	dc.b	nD4, nD3, $0C, nD3, $12, nC4, nC3, $0C, nA2, $12, nA3, nB2
	dc.b	$0C, nC3, $12, nC4, nE3, $0C, nD3, $12, nD4, nC3, $0C, nB2
	dc.b	$12, nB3, nG2, $0C
	smpsReturn

Snd_SpecialS2_Call05:
	dc.b	nF3, $12, $06, nRst, $0C, nF3, nE3, $12, $12, $0C, nF3, $12
	dc.b	$06, nRst, $0C, nF3, nE3, $18, $18, nF3, $12, $06, nRst, $0C
	dc.b	nF3, nE3, $12, $12, $0C, nA3, $12, $06, nRst, $0C, nB3, nC4
	dc.b	$18, nF3, nD3, $12, $06, nRst, $0C, nD3, nG3, $12, $12, $0C
	dc.b	nE3, $12, $06, nRst, $0C, nE3, nA3, $18, $18
	smpsReturn

Snd_SpecialS2_Call06:
	dc.b	nF3, $12, $06, nRst, $0C, nF3, $3C, nE3, $12, nB3, $06, nRst
	dc.b	$0C, nE4, $18, nB3, $0C, nE3, $18, nD3, $12, nA3, $06, nRst
	dc.b	$0C, nAb3, nG3, nD3, nG3, nC3, $54, nD3, $0C, nE3, nF3, $12
	dc.b	$06, nRst, $0C, nF3, $30, $06, $06, nE3, $12, nB3, $06, nRst
	dc.b	$0C, nE4, $18, nB3, $0C, nE3, $18, nD3, $12, nA3, $06, nRst
	dc.b	$0C, nF3, nE3, nB3
	smpsReturn

; FM3 Data
Snd_SpecialS2_FM3:
	smpsSetvoice        $01
	smpsPan             panRight, $00
	dc.b	nA4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06, nRst, $06
	smpsAlterVol        $E8
	dc.b	nA3, nE3
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA3, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nB3, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nCs4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA4, $06, nA4
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA4, $06, nA4
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA4, $06, nA4
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG4, $06, nG4, $0C, nA4
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $0C, nRst, $54
	smpsAlterVol        $E8

Snd_SpecialS2_Jump01:
	smpsSetvoice        $02

Snd_SpecialS2_Loop09:
	dc.b	nC4, $0C, nG3, $06, nE3, nRst, nA3, nRst, nB3, $0C, nG3, $06
	dc.b	$06, $0C, nE3, $06, nA3, nA3, nD4, $0C, nD4, $06, nA3, nRst
	dc.b	nFs3, nRst, nA3, $0C, nA3, $06, nFs3, nA3, $0C, nD3, $06, nD4
	dc.b	nA3
	smpsLoop            $00, $08, Snd_SpecialS2_Loop09
	dc.b	nRst, $60, nF3, $12, $06, nRst, $18, nE3, $12, $06, nRst, $18
	dc.b	nF3, $12, $06, nRst, $0C, nF3, nE3, $30, nF3, $12, $06, nRst
	dc.b	$18, nE3, $12, $06, nRst, $18, nE3, $12, $06, nRst, $0C, nE3
	dc.b	$3C, nF3, $12, $06, nRst, $18, nG3, $12, $06, nRst, $18, nG3
	dc.b	$12, $06, nRst, $0C, nG3, nA3, $30, nF3, $12, $06, nRst, $18
	dc.b	nF3, $12, $06, nRst, $18, nG3, $12, $06, nRst, $0C, nG3, $3C
	dc.b	nF3, $12, $06, nRst, $18, nE3, $12, $06, nRst, $18, nF3, $12
	dc.b	$06, nRst, $0C, nF3, nE3, $30, nF3, $12, $06, nRst, $18, nE3
	dc.b	$12, $06, nRst, $18, nE3, $12, $06, nRst, $0C, nE3, $3C, nF3
	dc.b	$12, $06, nRst, $18, nG3, $12, $06, nRst, $18, nG3, $12, $06
	dc.b	nRst, $0C, nG3, nA3, $30, nF3, $30, nG3, $12, $12, $0C
	smpsSetvoice        $01
	dc.b	nG4, $06, nG4, nRst, nG4, nG4, nRst, nG4, nG4, nRst, nF4, nRst
	dc.b	nF4, nF4, $0C, nG4
	smpsSetvoice        $02

Snd_SpecialS2_Loop0A:
	dc.b	nC4, $60, nB3, nA3, nG3
	smpsLoop            $00, $03, Snd_SpecialS2_Loop0A
	dc.b	nC4, $60, nB3, nA3, nC4, $18, nC4, nA3, nA3

Snd_SpecialS2_Loop0B:
	dc.b	nC4, $0C, nG3, $06, nE3, nRst, nA3, nRst, nB3, $0C, nG3, $06
	dc.b	$06, $0C, nE3, $06, nA3, nA3, nD4, $0C, nD4, $06, nA3, nRst
	dc.b	nFs3, nRst, nA3, $0C, nA3, $06, nFs3, nA3, $0C, nD3, $06, nD4
	dc.b	nA3
	smpsLoop            $00, $03, Snd_SpecialS2_Loop0B
	dc.b	nC4, $0C, nG3, $06, nE3, nRst, nA3, nRst, nB3, $0C, nG3, $06
	dc.b	$06, $0C, nE3, $06, nA3, nA3
	smpsSetvoice        $01
	dc.b	nD4, $12, nFs4, nA4, nG4, $0C, $12, nA4, $0C
	smpsJump            Snd_SpecialS2_Jump01

; FM4 Data
Snd_SpecialS2_FM4:
	smpsSetvoice        $01
	smpsPan             panLeft, $00
	dc.b	nA5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06, nRst, $06
	smpsAlterVol        $E8
	dc.b	nA4, nE4
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nB4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nCs5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA5, $06, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA5, $06, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA5, $06, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG5, $06, nG5, $0C, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $0C, nRst, $54
	smpsAlterVol        $E8

Snd_SpecialS2_Jump00:
	smpsSetvoice        $02

Snd_SpecialS2_Loop06:
	dc.b	nE4, $0C, nG4, $06, nC4, nRst, nFs4, nRst, nE4, $12, nB3, $06
	dc.b	nE4, $0C, nA3, $06, nA4, nD4, nFs4, $0C, nA4, $06, nD4, nRst
	dc.b	nA4, nRst, nFs4, $12, nA3, $06, nFs4, $0C, nA3, $06, nA4, nFs4
	smpsLoop            $00, $08, Snd_SpecialS2_Loop06
	dc.b	nRst, $60, nA3, $12, $06, nRst, $18, nG3, $12, $06, nRst, $18
	dc.b	nA3, $12, $06, nRst, $0C, nA3, nG3, $30, nA3, $12, $06, nRst
	dc.b	$18, nG3, $12, $06, nRst, $18, nA3, $12, $06, nRst, $0C, nA3
	dc.b	$3C, nA3, $12, $06, nRst, $18, nB3, $12, $06, nRst, $18, nB3
	dc.b	$12, $06, nRst, $0C, nB3, nC4, $30, nA3, $12, $06, nRst, $18
	dc.b	nA3, $12, $06, nRst, $18, nB3, $12, $06, nRst, $0C, nB3, $3C
	dc.b	nA3, $12, $06, nRst, $18, nG3, $12, $06, nRst, $18, nA3, $12
	dc.b	$06, nRst, $0C, nA3, nG3, $30, nA3, $12, $06, nRst, $18, nG3
	dc.b	$12, $06, nRst, $18, nA3, $12, $06, nRst, $0C, nA3, $3C, nA3
	dc.b	$12, $06, nRst, $18, nB3, $12, $06, nRst, $18, nB3, $12, $06
	dc.b	nRst, $0C, nB3, nC4, $30, nA3, $30, nB3, $12, $12, $0C
	smpsSetvoice        $01
	dc.b	nC5, $06, nC5, nRst, nC5, nC5, nRst, nC5, nC5, nRst, nBb4, nRst
	dc.b	nBb4, nBb4, $0C, nC5
	smpsSetvoice        $02

Snd_SpecialS2_Loop07:
	dc.b	nA4, $60, nG4, nF4, nE4
	smpsLoop            $00, $03, Snd_SpecialS2_Loop07
	dc.b	nA4, $60, nG4, nF4, nF4, $18, nE4, nD4, nB3

Snd_SpecialS2_Loop08:
	dc.b	nE4, $0C, nG4, $06, nC4, nRst, nFs4, nRst, nE4, $12, nB3, $06
	dc.b	nE4, $0C, nA3, $06, nA4, nD4, nFs4, $0C, nA4, $06, nD4, nRst
	dc.b	nA4, nRst, nFs4, $12, nA3, $06, nFs4, $0C, nA3, $06, nA4, nFs4
	smpsLoop            $00, $03, Snd_SpecialS2_Loop08
	dc.b	nE4, $0C, nG4, $06, nC4, nRst, nFs4, nRst, nE4, $12, nB3, $06
	dc.b	nE4, $0C, nA3, $06, nA4, nD4
	smpsSetvoice        $01
	dc.b	nA4, $12, nA4, nD5, nG5, $0C, $12, nA5, $0C
	smpsJump            Snd_SpecialS2_Jump00

; FM5 Data
Snd_SpecialS2_FM5:
	smpsSetvoice        $02
	dc.b	nA5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06, nRst, $06
	smpsAlterVol        $E8
	dc.b	nA4, nE4
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nB4, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nCs5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA5, $06, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA5, $06, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nA5, $06, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG5, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nG5, $06, nG5, $0C, nA5
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $0C, nRst, $54
	smpsAlterVol        $F8

Snd_SpecialS2_Loop05:
	smpsAlterVol        $E8
	smpsSetvoice        $03
	smpsModSet          $14, $01, $06, $06
	smpsCall            Snd_SpecialS2_Call00
	dc.b	nC6, $2A
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $12
	smpsAlterVol        $F4
	smpsCall            Snd_SpecialS2_Call00
	smpsModOff
	dc.b	nC6, $0C
	smpsAlterNote       $FC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $EC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $DC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $D8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $DC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $E8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $EC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F0
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F4
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $F8
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $FC
	dc.b	smpsNoAttack, $01
	smpsAlterNote       $00
	dc.b	smpsNoAttack, $06
	smpsModSet          $14, $01, $06, $06
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $12
	smpsAlterVol        $0C
	smpsLoop            $00, $02, Snd_SpecialS2_Loop05
	dc.b	nRst, $60
	smpsAlterVol        $F0
	smpsCall            Snd_SpecialS2_Call01
	dc.b	nE6, $0C, nC6, nF6, nE6, nC6, nF6, nE6, nC6, nF6, nE6, nC6
	dc.b	nF6, nE6, nC6
	smpsCall            Snd_SpecialS2_Call01
	dc.b	nE6, $0C, nC6, nF6, nE6, $12, nG6, nB6, $0C, nC7, $60
	smpsCall            Snd_SpecialS2_Call02
	dc.b	nA5, $0C, nG5, $60
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0C
	smpsAlterVol        $F4
	smpsCall            Snd_SpecialS2_Call02
	dc.b	nF6, $0C, nE6, nF6, $18, nE6, nF6, nG6, $0C
	smpsSetvoice        $04
	smpsAlterVol        $FB
	dc.b	nE6, $66, nRst, $06, nE6, nRst, nE6, $0C
	smpsAlterVol        $0A
	dc.b	nRst, $03
	smpsCall            Snd_SpecialS2_Call03
	smpsAlterVol        $0B
	smpsAlterNote       $00
	smpsJump            Snd_SpecialS2_Loop05

Snd_SpecialS2_Call00:
	dc.b	nC6, $0C, nG5, $06, nC6
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nD6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	nE6, $06
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nF6, $02, nFs6, nG6, $0E, nFs6, $54
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $18
	smpsAlterVol        $F4
	dc.b	nC6, $0C, nG5, $06, nC6
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nD6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nE6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	nE6, $06
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nF6, $02, nFs6, nG6, $0E, nFs6, $18, nE6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	dc.b	nD6, $06
	smpsAlterVol        $18
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $E8
	smpsReturn

Snd_SpecialS2_Call01:
	smpsAlterVol        $F8
	smpsAlterNote       $00
	dc.b	nC6, $18, $18, nB5, $24, nC6, $18, $18, $0C, nB5, $30, nC6
	dc.b	$18, $18, nB5, $0C, $18, nG5, $18, nA5, $54
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $24
	smpsAlterVol        $FC
	smpsAlterNote       $F8
	dc.b	nA5, $18, nC6, nA6, nG6, nB6, $0C, nC7, $18, $0C, nG6, $0C
	dc.b	nF6, $18
	smpsReturn

; PSG1 Data
Snd_SpecialS2_PSG1:
	dc.b	nRst, $12, nA2, $06, nE2, nRst, nA2, nRst, nB2, nRst, nCs3, nRst
	dc.b	nE3, nRst, nG3, nRst, nA3, nA3, nRst, nA3, nA3, nRst, nA3, nA3
	dc.b	nRst, nG3, nRst, nG3, nG3, $0C, nA3, nRst, $60

Snd_SpecialS2_Loop17:
	dc.b	nE2, $0C, nG2, $06, nC2, nRst, nFs2, nRst, nE2, $12, nB1, $06
	dc.b	nE2, $0C, nA1, $06, nA2, nD2, nFs2, $0C, nA2, $06, nD2, nRst
	dc.b	nA2, nRst, nFs2, $12, nA1, $06, nFs2, $0C, nA1, $06, nA2, nFs2
	smpsLoop            $00, $08, Snd_SpecialS2_Loop17
	dc.b	nRst, $60, nC2, $30, nB1, $24, nC2, $3C, nB1, $30, nC2, nB1
	dc.b	nC2, $60, nC2, $30, nD2, nD2, nE2, nC2, $60, nC2, $30, nD2
	dc.b	nC2, $30, nB1, $24, nC2, $3C, nB1, $30, nC2, nB1, nC2, $60
	dc.b	nC2, $30, nD2, nD2, nE2, nC2, nD2, $12, $12, $0C, nC3, $06
	dc.b	nC3, nRst, nC3, nC3, nRst, nC3, nC3, nRst, nBb2, nRst, nBb2, $06
	dc.b	nBb2, $0C, nC3
	smpsCall            Snd_SpecialS2_Call0A
	dc.b	nA1, $0C, nG1, $6C
	smpsCall            Snd_SpecialS2_Call0A
	dc.b	nF2, $0C, nE2, nF2, $18, nE2, nG1, $03, nAb1, nA1, nBb1, nB1
	dc.b	nC2, nCs2, nD2, nEb2, nE2, nF2, nFs2, nG2, nAb2, nA2, nBb2

Snd_SpecialS2_Loop18:
	dc.b	nE2, $0C, nG2, $06, nC2, nRst, nFs2, nRst, nE2, $12, nB1, $06
	dc.b	nE2, $0C, nA1, $06, nA2, nD2, nFs2, $0C, nA2, $06, nD2, nRst
	dc.b	nA2, nRst, nFs2, $12, nA1, $06, nFs2, $0C, nA1, $06, nA2, nFs2
	smpsLoop            $00, $03, Snd_SpecialS2_Loop18
	dc.b	nE2, $0C, nG2, $06, nC2, nRst, nFs2, nRst, nE2, $12, nB1, $06
	dc.b	nE2, $0C, nA1, $06, nA2, nD2, nFs2, $0C, nA2, $06, nD2, nRst
	dc.b	nA2, nRst, nFs2, $0C, $0C, $12, nA2, $0C
	smpsJump            Snd_SpecialS2_Loop17

Snd_SpecialS2_Call0A:
	dc.b	nE2, $24, $06, $06, $12, nA1, $12, nE2, $0C, nD2, $60, nC2
	dc.b	$24, $06, $06, $12, nA1, $12, nC2, $0C, nB1, nG1, nE1, nG1
	dc.b	$3C, nA1, $24, $06, $06, $12, nC2, $12, nA2, $0C, nG2, $18
	dc.b	nB2, $0C, nC3, $18, $0C, nG2, $18, nF2, $0C, nE2, nC2, nF2
	dc.b	nE2, nC2
	smpsReturn

; PSG2 Data
Snd_SpecialS2_PSG2:
	dc.b	nRst, $12, nA1, $06, nE1, nRst, nA1, nRst, nB1, nRst, nCs2, nRst
	dc.b	nE2, nRst, nG2, nRst, nE2, nE2, nRst, nE2, nE2, nRst, nE2, nE2
	dc.b	nRst, nD2, nRst, nD2, nD2, $0C, nE2, nRst, $60

Snd_SpecialS2_Loop15:
	dc.b	nC2, $0C, nG1, $06, nE1, nRst, nA1, nRst, nB1, $0C, nG1, $06
	dc.b	$06, $0C, nE1, $06, nA1, nA1, nD2, $0C, nD2, $06, nA1, nRst
	dc.b	nFs1, nRst, nA1, $0C, nA1, $06, nFs1, nA1, $0C, nD1, $06, nD2
	dc.b	nA1
	smpsLoop            $00, $08, Snd_SpecialS2_Loop15
	dc.b	nRst, $60, nA1, $30, nG1, $24, nA1, $3C, nG1, $30, nA1, nG1
	dc.b	nG1, $60, nA1, $30, nB1, nB1, nC2, nA1, $60, nA1, $30, nG1
	dc.b	nA1, $30, nG1, $24, nA1, $3C, nG1, $30, nA1, nG1, nG1, $60
	dc.b	nA1, $30, nB1, nB1, nC2, nA1, nB1, $12, $12, $0C, nC2, $06
	dc.b	nC2, nRst, nC2, nC2, nRst, nC2, nC2, nRst, nBb1, nRst, nBb1, $06
	dc.b	nBb1, $0C, nC2
	smpsCall            Snd_SpecialS2_Call09
	dc.b	nD1, $0C, nE1, $6C
	smpsCall            Snd_SpecialS2_Call09
	dc.b	nC2, $0C, nA1, nC2, $18, nA1, nG1, $12, nG1, $03, nAb1, nA1
	dc.b	nBb1, nB1, nC2, nCs2, nD2, nEb2, nE2

Snd_SpecialS2_Loop16:
	dc.b	nC2, $0C, nG1, $06, nE1, nRst, nA1, nRst, nB1, $0C, nG1, $06
	dc.b	$06, $0C, nE1, $06, nA1, nA1, nD2, $0C, nD2, $06, nA1, nRst
	dc.b	nFs1, nRst, nA1, $0C, nA1, $06, nFs1, nA1, $0C, nD1, $06, nD2
	dc.b	nA1
	smpsLoop            $00, $03, Snd_SpecialS2_Loop16
	dc.b	nC2, $0C, nG1, $06, nE1, nRst, nA1, nRst, nB1, $0C, nG1, $06
	dc.b	$06, $0C, nE1, $06, nA1, nA1, nD2, $0C, nD2, $06, nA1, nRst
	dc.b	nFs1, nRst, nA1, $0C, nD2, $0C, $12, $0C
	smpsJump            Snd_SpecialS2_Loop15

Snd_SpecialS2_Call09:
	dc.b	nA1, $24, $06, $06, $12, nC2, $12, nA1, $0C, nG1, $60, nF1
	dc.b	$24, $06, $06, $12, nG1, $12, nF1, $0C, nE1, nC1, nC1, nE1
	dc.b	$3C, nF1, $24, $06, $06, $12, nA1, $12, nC2, $0C, nB1, $18
	dc.b	nD2, $0C, nE2, $18, $0C, nB1, $18, nC2, $0C, nA1, nF1, nC2
	dc.b	nA1, nF1
	smpsReturn

; PSG3 Data
Snd_SpecialS2_PSG3:
	smpsPSGform         $E7
	smpsPSGvoice        fTone_02
	dc.b	nB6, $06, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6, $0C

Snd_SpecialS2_Loop0E:
	smpsPSGvoice        fTone_02
	dc.b	nB6, $06
	smpsPSGvoice        fTone_02
	dc.b	nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6
	smpsLoop            $00, $03, Snd_SpecialS2_Loop0E

Snd_SpecialS2_Loop0F:
	smpsPSGvoice        fTone_02
	dc.b	nB6, nB6
	smpsPSGAlterVol     $FC
	dc.b	nB6
	smpsPSGAlterVol     $04
	dc.b	nB6
	smpsLoop            $00, $07, Snd_SpecialS2_Loop0F
	dc.b	nB6, nB6, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6

Snd_SpecialS2_Loop10:
	smpsPSGvoice        fTone_02
	dc.b	nB6, nB6
	smpsPSGAlterVol     $FC
	dc.b	nB6
	smpsPSGAlterVol     $04
	dc.b	nB6
	smpsLoop            $00, $03, Snd_SpecialS2_Loop10
	dc.b	nB6, nB6, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6
	smpsLoop            $01, $0F, Snd_SpecialS2_Loop10

Snd_SpecialS2_Loop11:
	smpsPSGvoice        fTone_02
	dc.b	nB6, nB6
	smpsPSGAlterVol     $FC
	dc.b	nB6
	smpsPSGAlterVol     $04
	dc.b	nB6
	smpsLoop            $00, $07, Snd_SpecialS2_Loop11
	dc.b	nB6, nB6, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6

Snd_SpecialS2_Loop12:
	smpsPSGvoice        fTone_02
	dc.b	nB6, nB6
	smpsPSGAlterVol     $FC
	dc.b	nB6
	smpsPSGAlterVol     $04
	dc.b	nB6
	smpsLoop            $00, $0F, Snd_SpecialS2_Loop12
	dc.b	nB6, nB6, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6
	smpsLoop            $01, $04, Snd_SpecialS2_Loop12

Snd_SpecialS2_Loop13:
	smpsPSGvoice        fTone_02
	dc.b	nB6, $06, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6, $0C
	smpsPSGvoice        fTone_02
	dc.b	nB6, $06, nB6
	smpsPSGAlterVol     $FC
	dc.b	nB6
	smpsPSGAlterVol     $04
	dc.b	nB6
	smpsLoop            $00, $20, Snd_SpecialS2_Loop13

Snd_SpecialS2_Loop14:
	dc.b	nB6, $06, nB6
	smpsPSGAlterVol     $FC
	dc.b	nB6
	smpsPSGAlterVol     $04
	dc.b	nB6
	smpsLoop            $00, $03, Snd_SpecialS2_Loop14
	dc.b	nB6, $06, nB6, nB6
	smpsPSGvoice        fTone_02
	dc.b	nB6
	smpsPSGvoice        fTone_02
	smpsLoop            $01, $08, Snd_SpecialS2_Loop14
	smpsJump            Snd_SpecialS2_Loop10

; DAC Data
Snd_SpecialS2_DAC:
	smpsPan             panCenter, $00
	dc.b	dQuickLooseSnare, $06, dKickS3, $0C, dQuickLooseSnare, $06, dKickS3, $0C, dKickS3, dKickS3, dKickS3, dQuickLooseSnare
	dc.b	dKickS3, dQuickLooseSnare, $06, dQuickLooseSnare, $0C, dQuickLooseSnare, $06, dKickS3, $0C, dQuickLooseSnare, $06, dQuickLooseSnare
	dc.b	$0C, dKickS3, dKickS3, $06, dQuickLooseSnare, $0C, dQuickLooseSnare, $06, dQuickLooseSnare, dKickS3, $06, dElectricHighTom
	dc.b	$03, dElectricHighTom, dElectricHighTom, $06, dElectricHighTom, dElectricMidTom, dElectricMidTom, dElectricMidTom, dElectricLowTom, dElectricLowTom, dElectricLowTom, dKickS3
	dc.b	dKickS3, dQuickLooseSnare, dKickS3, $12

Snd_SpecialS2_Loop00:
	dc.b	dKickS3, $12, dKickS3, $06, dSnareS3, dKickS3, $0C, dKickS3, dKickS3, $12, dSnareS3, $06
	dc.b	dKickS3, $12
	smpsLoop            $00, $03, Snd_SpecialS2_Loop00
	dc.b	dKickS3, $12, dKickS3, $06, dSnareS3, dKickS3, $0C, dKickS3, dKickS3, $12, dSnareS3, $0C
	dc.b	dSnareS3, $06, dSnareS3
	smpsLoop            $01, $04, Snd_SpecialS2_Loop00
	dc.b	dKickS3, $06, dSnareS3, $03, dSnareS3, dSnareS3, $06, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3
	dc.b	dSnareS3, dSnareS3, dKickS3, dKickS3, dSnareS3, dKickS3, $12

Snd_SpecialS2_Loop01:
	dc.b	dKickS3, $12, $06, dSnareS3, $0C, dKickS3
	smpsLoop            $00, $0C, Snd_SpecialS2_Loop01
	dc.b	dKickS3, $12, $06, dSnareS3, $0C, dKickS3, $12, $12, dSnareS3, $06, dKickS3, $12
	dc.b	dSnareS3, $06, $0C, $06, dKickS3, $0C, dSnareS3, $0C, $06, dKickS3, $0C, $06
	dc.b	dSnareS3, $0C, $0C

Snd_SpecialS2_Loop02:
	dc.b	dKickS3, $12, $06, dSnareS3, $0C, dKickS3
	smpsLoop            $00, $0C, Snd_SpecialS2_Loop02
	dc.b	dKickS3, $12, $06, dSnareS3, $0C, dKickS3, $12, $12, dSnareS3, $06, dKickS3, $12
	dc.b	dSnareS3, $06, $0C, $06, dKickS3, $0C, dSnareS3, $06, $0C, dKickS3, $0C, $06
	dc.b	dSnareS3, $0C, $06, $06

Snd_SpecialS2_Loop03:
	dc.b	dKickS3, $12, $12, $24, dSnareS3, $18, dKickS3, $12, $12, $24, dSnareS3, $12
	dc.b	$06, dKickS3, $12, $12, $24, dSnareS3, $18, dKickS3, $12, $12, $24, dSnareS3
	dc.b	$0C, $06, $06
	smpsLoop            $00, $03, Snd_SpecialS2_Loop03
	dc.b	dKickS3, $12, $12, $24, dSnareS3, $18, dKickS3, $12, $12, $24, dSnareS3, $12
	dc.b	$06, dKickS3, $12, $12, $24, dSnareS3, $18, dKickS3, $12, dKickS3, $06, dSnareS3
	dc.b	$0C, dKickS3, $1E, dKickS3, $06, dSnareS3, dSnareS3, dSnareS3, dSnareS3

Snd_SpecialS2_Loop04:
	dc.b	dKickS3, $12, dKickS3, $06, dSnareS3, dKickS3, $0C, dKickS3, dKickS3, $12, dSnareS3, $06
	dc.b	dKickS3, $12
	smpsLoop            $00, $07, Snd_SpecialS2_Loop04
	dc.b	dKickS3, $06, dKickS3, dSnareS3, dKickS3, dKickS3, dSnareS3, $0C, dSnareS3, $06, dKickS3, dSnareS3
	dc.b	$03, dSnareS3, dSnareS3, $06, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3
	smpsJump            Snd_SpecialS2_Loop00
