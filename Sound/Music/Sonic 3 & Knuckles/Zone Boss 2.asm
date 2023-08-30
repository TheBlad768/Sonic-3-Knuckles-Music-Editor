Boss2_Header:
	smpsHeaderStartSong 3
	smpsHeaderVoice     Snd_Boss_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $AC

	smpsHeaderDAC       Boss2_DAC
	smpsHeaderFM        Boss2_FM1,		$00, $0C
	smpsHeaderFM        Boss2_FM2,	$00, $0C
	smpsHeaderFM        Boss2_FM3,	$00, $0C
	smpsHeaderFM        Boss2_FM4,	$00, $0C
	smpsHeaderFM        Boss2_FM5,	$00, $13
	smpsHeaderFM        Boss2_FM6,	$00, $00
	smpsHeaderPSG       Boss2_PSG1,	$00, $01, $00, sTone_05
	smpsHeaderPSG       Boss2_PSG2,	$E8, $02, $00, $00
	smpsHeaderPSG       Boss2_PSG3,	$00, $00, $00, $00

; FM5 Data
Boss2_FM5:
	smpsAlterNote       $02
	dc.b	nRst, $06

; FM1 Data
Boss2_FM1:
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	smpsModSet          $0D, $01, $02, $06

Boss2_Loop0F:
	dc.b	nB5, $02, nRst
	smpsLoop            $00, $09, Boss2_Loop0F
	smpsSetvoice        $07
	dc.b	nE3, $0C, nFs3, $10
	smpsSetvoice        $02
	smpsLoop            $01, $02, Boss2_Loop0F
	smpsSetvoice        $00
	dc.b	nE4, $14, $04, nFs4, nG4, nA4, $08, nG4, $04, nFs4, $08, $04
	dc.b	nG4, $08, nA4, nD5, $04, nA4, $18
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $0C
	smpsFMAlterVol        $FC
	dc.b	nA4, $08, nB4, nC5, $0C, nG4, $14, nE4, $0C, nFs4, nG4, $08
	dc.b	$14, nA4, $02, nRst, nG4, nRst, nFs4, $1C, nB3, $08, nE4, $14
	dc.b	$04, nFs4, nG4, nA4, $08, nG4, $04, nFs4, $08, $04, nG4, $08
	dc.b	nA4, nD5, $04, nA4, $18
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $0C
	smpsFMAlterVol        $FC
	dc.b	nA4, $08, nB4, nC5, $0C, nG4, nE4, $08, nC5, $0C, nD5, nE5
	dc.b	$08, $14, nFs5, $02, nRst, nE5, nRst, nEb5, $1C, nB3, $08, nE4
	dc.b	$14, $04, nFs4, nG4, nA4, $08, nG4, $04, nFs4, $08, $04, nG4
	dc.b	$08, nA4, $0C, nB4, nC5, $08, nB4, nA4, $04, nG4, $14, nC5
	dc.b	$14, nB4, $04, nA4, nG4, nFs4, $0C, nBb4, nCs5, $08, nE5, $14
	dc.b	nEb5, $04, nCs5, $08, nEb5, $18, nB3, $08, nE4, $14, $04, nFs4
	dc.b	nG4, nA4, $08, nG4, $04, nFs4, $08, $04, nG4, $08, nA4, $0C
	dc.b	nB4, nC5, $08, nB4, nA4, $04, nG4, $14, nC5, $14, nA4, $04
	dc.b	nB4, nC5, nCs5, $0C, nEb5, nE5, $08, $14, nFs5, $04, nE5, $08
	dc.b	nEb5, $18, nB4, $08, nG5, $04, nFs5, $02, nRst, nG5, $04, nFs5
	dc.b	$08, nD5, $02, nRst, nA4, $04, nE5, $08, nD5, $02, nRst, nE5
	dc.b	$04, nD5, $08, nA4, $02, nRst, nG4, $08, nC5, $20, nB4, $10
	dc.b	nFs5, nG5, $04, nFs5, $02, nRst, nG5, $04, nFs5, $08, nD5, $02
	dc.b	nRst, nA4, $04, nE5, $08, nD5, $02, nRst, nE5, $04, nD5, $08
	dc.b	nA4, $02, nRst, nG4, $08, nF4, $08, nA4, nC5, nF5, nA5, nC6
	dc.b	nF6, nA6
	smpsSetvoice        $02
	smpsJump            Boss2_Loop0F

; FM2 Data
Boss2_FM2:
	smpsSetvoice        $01
	smpsPan             panCenter, $00
	smpsModSet          $0D, $01, $02, $06

Boss2_Loop05:
	dc.b	nE3, $04, $02, nRst, nE3, nRst, nE3, $04, $02, nRst, nE3, nRst
	dc.b	nE3, $04, nE3, nRst, nC3, $0C, nD3, $10
	smpsLoop            $00, $02, Boss2_Loop05

Boss2_Loop06:
	dc.b	nE2, $04, nE3
	smpsLoop            $00, $08, Boss2_Loop06

Boss2_Loop07:
	dc.b	nD2, nD3
	smpsLoop            $00, $08, Boss2_Loop07

Boss2_Loop08:
	dc.b	nC2, nC3
	smpsLoop            $00, $08, Boss2_Loop08

Boss2_Loop09:
	dc.b	nB1, nB2
	smpsLoop            $00, $04, Boss2_Loop09

Boss2_Loop0A:
	dc.b	nB2, nB3
	smpsLoop            $00, $04, Boss2_Loop0A
	smpsLoop            $01, $02, Boss2_Loop06

Boss2_Loop0B:
	dc.b	nC3, nC3, nG3, nG3, nE3, nE3, nG3, nG3, nD3, nD3, nA3, nA3
	dc.b	nFs3, nFs3, nA3, nA3, nB2, nB2, nFs3, nFs3, nEb3, nEb3, nFs3, nFs3
	dc.b	nE3, nE3, nB3, nB3, nG3, nG3, nB3, nB3, nA2, nA2, nE3, nE3
	dc.b	nC3, nC3, nE3, nE3, nCs3, nCs3, nBb3, nBb3, nFs3, nFs3, nBb3, nBb3
	dc.b	nB2, nB2, nFs3, nFs3, nE3, nE3, nB2, nB2, nFs3, nEb3, nFs3, nB2
	dc.b	nB2, nEb3, nFs3, nB3
	smpsLoop            $00, $02, Boss2_Loop0B
	dc.b	nE2, nE3, nE2, nD3, nD2, nD3, nD2, nC3, nC2, nC3, nC2, nB2
	dc.b	nB1, nB2, nB1, nB2

Boss2_Loop0C:
	dc.b	nA2, nA3
	smpsLoop            $00, $04, Boss2_Loop0C

Boss2_Loop0D:
	dc.b	nB2, nB3
	smpsLoop            $00, $04, Boss2_Loop0D
	dc.b	nE2, nE3, nE2, nD3, nD2, nD3, nD2, nC3, nC2, nC3, nC2, nB2
	dc.b	nB1, nB2, nB1, nB2

Boss2_Loop0E:
	dc.b	nF2, nF3
	smpsLoop            $00, $08, Boss2_Loop0E
	smpsJump            Boss2_Loop05

; FM3 Data
Boss2_FM3:
	smpsSetvoice        $03
	smpsPan             panRight, $00
	smpsModSet          $0D, $01, $02, $06

Boss2_Loop04:
	dc.b	nE5, $04, nB4, $02, nRst, nB4, nRst, nB4, $04, nG4, $02, nRst
	dc.b	nG4, nRst, nG4, $04, nE4, $02, nRst, nE4, nRst, nG4, $0C, nA4
	dc.b	$10
	smpsLoop            $00, $02, Boss2_Loop04
	smpsSetvoice        $04
	dc.b	nB3, $07, nRst, $19, nG3, $07, nRst, $19, nA3, $07, nRst, $19
	dc.b	nFs3, $07, nRst, $19, nG3, $07, nRst, $19, nE3, $07, nRst, $19
	dc.b	nFs3, $07, nRst, $19
	smpsSetvoice        $05
	dc.b	nC5, $04, nB4, nA4, $04, $14
	smpsSetvoice        $04
	dc.b	nB3, $07, nRst, $19, nG3, $07, nRst, $19, nA3, $07, nRst, $19
	dc.b	nFs3, $07, nRst, $19, nG3, $07, nRst, $19, nE3, $07, nRst, $19
	dc.b	nFs3, $07, nRst, $19
	smpsSetvoice        $05
	dc.b	nC5, $04, nB4, nA4, nEb5, $14
	smpsSetvoice        $06
	dc.b	nG3, $10, nC4, nA3, nD4, nA3, nEb4, nE4, $08, nB3, nG3, nE3
	dc.b	nA3, $10, nC4, nBb3, nCs4, nB3, nE4, nEb4, $08, nB3, nFs3, nEb3
	dc.b	nG3, $10, nC4, nA3, nD4, nA3, nEb4, nE4, $08, nB3, nG3, nE3
	dc.b	nA3, $10, nC4, nBb3, nCs4, nB3, nE4, nEb4, $08, nB3, nEb4, nFs4
	dc.b	nE4, $08
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nD4, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nC4, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nB3, $10
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nA3, $10, nC4, nEb4, nFs4, nG4, $08
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nFs4, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nE4, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nD4, $10
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nC4, $10, nF4, nA4, nC5
	smpsSetvoice        $03
	smpsJump            Boss2_Loop04

; FM4 Data
Boss2_FM4:
	smpsSetvoice        $03
	smpsPan             panLeft, $00
	smpsModSet          $0D, $01, $02, $06

Boss2_Loop02:
	dc.b	nB4, $04, nG4, $02, nRst, nG4, nRst, nG4, $04, nE4, $02, nRst
	dc.b	nE4, nRst, nE4, $04, nB3, $02, nRst, nB3, nRst, nE4, $0C, nFs4
	dc.b	$10
	smpsLoop            $00, $02, Boss2_Loop02

Boss2_Loop03:
	smpsSetvoice        $04
	dc.b	nG3, $07, nRst, $19, nE3, $07, nRst, $19, nFs3, $07, nRst, $19
	dc.b	nD3, $07, nRst, $19, nE3, $07, nRst, $19, nC3, $07, nRst, $19
	dc.b	nEb3, $07, nRst, $19
	smpsSetvoice        $05
	dc.b	nEb4, $04, $04, $04, nFs4, $14
	smpsSetvoice        $04
	smpsLoop            $00, $02, Boss2_Loop03
	smpsSetvoice        $06
	dc.b	nE3, $10, nG3, nFs3, nA3, nFs3, nA3, nB3, $08, nG3, nE3, nB2
	dc.b	nE3, $10, nA3, nFs3, nBb3, nFs3, nB3, nB3, $08, nFs3, nEb3, nB2
	dc.b	nE3, $10, nG3, nFs3, nA3, nFs3, nA3, nB3, $08, nG3, nE3, nB2
	dc.b	nE3, $10, nA3, nFs3, nBb3, nFs3, nB3, nB3, $08, nFs3, nB3, nEb4
	dc.b	nB3, $08
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nA3, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nG3, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nFs3, $10
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nE3, $10, nA3, nB3, nEb4, nE4, $08
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nD4, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nC4, $0C
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nB3, $10
	smpsFMAlterVol        $04
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FC
	dc.b	nA3, $10, nC4, nF4, nA4
	smpsSetvoice        $03
	smpsJump            Boss2_Loop02

; PSG1 Data
Boss2_PSG1:
	smpsModSet          $0D, $01, $01, $04

Boss2_Jump01:
	dc.b	nRst, $20, nRst, $20, nRst, $20, nRst, $20, nRst, $20, nRst, $20
	dc.b	nRst, $20, nRst, $20, nRst, $20, nRst, $20, nRst, $20, nRst, $20
	dc.b	nRst, $20, nRst, $20, nRst, $20, nRst, $20, nRst, $20, nRst, $20
	dc.b	nRst, $20, nRst, $18, nB0, $08, nE1, $10
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nE1, $04, nFs1, nG1, nA1, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nG1, $04, nFs1, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	$04, nG1, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nA1, $0C, nB1, nC2, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nB1, $08, nA1, $04, nG1, $12
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nC2, $10
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nB1, $04, nA1, nG1, nFs1, $0C, nBb1, nCs2, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nE2, $14, nEb2, $04, nCs2, $04
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nEb2, $14
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nB0, $08, nE1, $10
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nE1, $04, nFs1, nG1, nA1, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nG1, $04, nFs1, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	$04, nG1, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nA1, $0C, nB1, nC2, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nB1, $08, nA1, $04, nG1, $12
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nC2, $10
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nA1, $04, nB1, nC2, nCs2, $0C, nEb2, nE2, $06
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $02
	smpsFMAlterVol        $FD
	dc.b	nE2, $14, nFs2, $04, nE2, $04
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nEb2, $18, nB1, $08, nG2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nFs2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nG2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nFs2, $07
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nD2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nA1, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nE2, $07
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nD2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nE2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nD2, $07
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nA1, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nG1, $04
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nC2, $1F
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nB1, $0F
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nFs2, $0F
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nG2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nFs2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nG2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nFs2, $07
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nD2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nA1, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nE2, $07
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nD2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nE2, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nD2, $07
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nA1, $03
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $01
	smpsFMAlterVol        $FD
	dc.b	nG1, $04
	smpsFMAlterVol        $03
	dc.b	smpsNoAttack, $04
	smpsFMAlterVol        $FD
	dc.b	nF1, $08, nA1, nC2, nF2, nA2, nC3, nF3, nA3
	smpsJump            Boss2_Jump01

; FM6 Data
Boss2_FM6:
; PSG2 Data
Boss2_PSG2:
; PSG3 Data
Boss2_PSG3:
	smpsStop

; DAC Data
Boss2_DAC:
	smpsPan             panCenter, $00
	dc.b	dSnareS3, $04, dKickS3, dKickS3, dSnareS3, dKickS3, dKickS3, dSnareS3, dKickS3, dSnareS3, dKickS3, nRst
	dc.b	nRst, dKickS3, nRst, dSnareS3, dSnareS3, dSnareS3, dKickS3, dKickS3, dSnareS3, dKickS3, dKickS3, dSnareS3
	dc.b	dKickS3, dSnareS3, dKickS3, nRst, nRst, dKickS3, dSnareS3, dSnareS3, dSnareS3

Boss2_Loop00:
	smpsCall            Boss2_Call00
	smpsLoop            $00, $20, Boss2_Loop00

Boss2_Loop01:
	dc.b	dSnareS3, $04, dKickS3, dKickS3, dSnareS3, dKickS3, dKickS3, dSnareS3, dKickS3
	smpsLoop            $00, $02, Boss2_Loop01
	smpsCall            Boss2_Call00
	smpsCall            Boss2_Call00
	smpsLoop            $01, $02, Boss2_Loop01
	smpsJump            Boss2_DAC

Boss2_Call00:
	dc.b	dKickS3, $04, dSnareS3, $04, $04, $02, $02, dKickS3, $04, dSnareS3, dKickS3, dSnareS3
	smpsReturn
