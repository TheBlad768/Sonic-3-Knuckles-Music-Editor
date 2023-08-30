Snd_FinalBoss1_Header:
	smpsHeaderStartSong 3
	smpsHeaderVoice     Snd_FinalBoss_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $74

	smpsHeaderDAC       Snd_FinalBoss1_DAC
	smpsHeaderFM        Snd_FinalBoss1_FM1,	$00, $0E
	smpsHeaderFM        Snd_FinalBoss1_FM2,	$00, $0C
	smpsHeaderFM        Snd_FinalBoss1_FM3,	$00, $0E
	smpsHeaderFM        Snd_FinalBoss1_FM4,	$00, $0E
	smpsHeaderFM        Snd_FinalBoss1_FM5,	$00, $12
	smpsHeaderFM        Snd_FinalBoss1_FM6,	$00, $00
	smpsHeaderPSG       Snd_FinalBoss1_PSG1,	$DC, $03, $00, $00
	smpsHeaderPSG       Snd_FinalBoss1_PSG2,	$DC, $02, $00, $00
	smpsHeaderPSG       Snd_FinalBoss1_PSG3,	$DC, $01, $00, $00

; FM6 Data
Snd_FinalBoss1_FM6:
	smpsStop

; FM1 Data
Snd_FinalBoss1_FM1:
	smpsModSet          $0E, $01, $02, $07
	smpsSetvoice        $00
	smpsPan             panCenter, $00
	dc.b	nRst, $30, nRst, $18, nRst, $30, nRst, $18, nRst, $30, nRst, $18
	dc.b	nEb4, $03, nE4, nFs4, nAb4, nE4, nFs4, nAb4, nBb4, nFs4, nAb4, nBb4
	dc.b	nB4, nAb4, nBb4, nB4, nCs5, nBb4, nB4, nCs5, nEb5, nB4, nCs5, nEb5
	dc.b	nE5, nFs5, $48, nRst, $30, nRst, $18, nRst, $30, nRst, $18, nEb4
	dc.b	$03, nE4, nFs4, nAb4, nE4, nFs4, nAb4, nBb4, nFs4, nAb4, nBb4, nB4
	dc.b	nAb4, nBb4, nB4, nCs5, nBb4, nB4, nCs5, nEb5, nB4, nCs5, nEb5, nE5
	dc.b	nFs5, $3C

Snd_FinalBoss1_Loop07:
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	dc.b	nEb5, $0C, nBb4, nFs5, nCs5, nF5, nC5, nE4, nE5
	smpsLoop            $00, $08, Snd_FinalBoss1_Loop07

Snd_FinalBoss1_Loop08:
	dc.b	nRst, $30
	smpsLoop            $00, $10, Snd_FinalBoss1_Loop08
	dc.b	nRst, $06, nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nBb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nEb5, $06, nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nBb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb5
	smpsFMAlterVol      $FC
	dc.b	nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nF5, nFs5, $0C, nAb5, $06, nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nAb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nAb5, $06, nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nBb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs5
	smpsFMAlterVol      $FC
	dc.b	nEb5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, nEb5, nFs5, $03, nAb5, nBb5, $06
	dc.b	nEb5, nFs5, nAb5, nBb5, nCs6
	smpsLoop            $01, $02, Snd_FinalBoss1_Loop07
	smpsPan             panLeft, $00
	smpsSetvoice        $04
	smpsFMAlterVol      $07
	dc.b	nRst, $0C, nEb5, $48, nRst, $0C
	smpsFMAlterVol      $F9
	smpsJump            Snd_FinalBoss1_Loop07

; FM2 Data
Snd_FinalBoss1_FM2:
	smpsSetvoice        $01
	smpsModSet          $0E, $01, $02, $07

Snd_FinalBoss1_Loop06:
	smpsPan             panCenter, $00
	dc.b	nEb2, $63, nEb2, $2D
	smpsLoop            $00, $04, Snd_FinalBoss1_Loop06
	dc.b	nEb2, $3C

Snd_FinalBoss1_Jump02:
	smpsCall            Snd_FinalBoss1_Call05
	dc.b	nAb2, $06, nAb2, nAb3, nAb2, nAb2, nAb3, nAb2, smpsNoAttack, nAb2, nAb3, nAb2
	dc.b	nAb2, nAb3, nFs2, nFs2, nF3, nEb2, smpsNoAttack
	smpsCall            Snd_FinalBoss1_Call05
	dc.b	nAb2, $06, nAb2, nAb3, nAb2, nAb2, nAb3, nAb2, smpsNoAttack, nAb2, nAb3, nAb2
	dc.b	nAb2, nAb3, nAb2, nAb2, nAb2, nAb3, nRst, $0C, nG2, $4E, nRst, $06
	smpsJump            Snd_FinalBoss1_Jump02

Snd_FinalBoss1_Call05:
	dc.b	nEb2, $06, nEb2, nEb3, nEb2, nEb2, nEb3, nEb2, smpsNoAttack, nEb2, nEb3, nEb2
	dc.b	nEb2, nEb3, nEb2, nEb2, nEb3, nEb2, smpsNoAttack
	smpsLoop            $00, $08, Snd_FinalBoss1_Call05
	dc.b	nEb2, $06, nEb2, nEb3, nEb2, nEb2, nEb3, nEb2, smpsNoAttack, nEb2, nEb3, nEb2
	dc.b	nEb2, nEb3, nEb2, nEb2, nEb3, nFs2, smpsNoAttack, nFs2, $06, nFs2, nFs3, nFs2
	dc.b	nFs2, nFs3, nFs2, smpsNoAttack, nFs2, nFs3, nFs2, nFs2, nFs3, nFs2, nFs2, nFs3
	dc.b	nAb2, smpsNoAttack, nAb2, $06, nAb2, nAb3, nAb2, nAb2, nAb3, nAb2, smpsNoAttack, nAb2
	dc.b	nAb3, nAb2, nAb2, nAb3, nAb2, nAb2, nAb3, nBb2, smpsNoAttack, nBb2, $06, nBb2
	dc.b	nBb3, nBb2, nBb2, nBb3, nBb2, smpsNoAttack, nBb2, nBb3, nBb2, nBb2, nBb3, nBb2
	dc.b	nBb2, nBb3, nAb2, smpsNoAttack

Snd_FinalBoss1_Loop12:
	dc.b	nEb2, $06, nEb2, nEb3, nEb2, nEb2, nEb3, nEb2, smpsNoAttack, nEb2, nEb3, nEb2
	dc.b	nEb2, nEb3, nEb2, nEb2, nEb3, nEb2, smpsNoAttack
	smpsLoop            $00, $04, Snd_FinalBoss1_Loop12

Snd_FinalBoss1_Loop13:
	dc.b	nBb2, $06, nBb2, nBb3, nBb2, nBb2, nBb3, nBb2, smpsNoAttack, nBb2, nBb3, nBb2
	dc.b	nBb2, nBb3, nBb2, nBb2, nBb3, nBb2, smpsNoAttack
	smpsLoop            $00, $04, Snd_FinalBoss1_Loop13

Snd_FinalBoss1_Loop14:
	dc.b	nAb2, $06, nAb2, nAb3, nAb2, nAb2, nAb3, nAb2, smpsNoAttack, nAb2, nAb3, nAb2
	dc.b	nAb2, nAb3, nAb2, nAb2, nAb3, nAb2, smpsNoAttack
	smpsLoop            $00, $03, Snd_FinalBoss1_Loop14
	smpsReturn

; FM3 Data
Snd_FinalBoss1_FM3:
	smpsSetvoice        $02
	smpsModSet          $0E, $01, $02, $07
	smpsPan             panLeft, $00

Snd_FinalBoss1_Loop05:
	dc.b	nEb4, $48, $1B, $2D
	smpsLoop            $00, $04, Snd_FinalBoss1_Loop05
	dc.b	$3C

Snd_FinalBoss1_Jump01:
	smpsCall            Snd_FinalBoss1_Call03
	dc.b	nBb4, $36, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb4, $0C
	smpsFMAlterVol      $FC
	dc.b	nA4, $06, nFs4, nEb4, nC4, nA3, nC4
	smpsCall            Snd_FinalBoss1_Call04
	smpsFMAlterVol      $FC
	smpsCall            Snd_FinalBoss1_Call03
	dc.b	nBb4, $0C, nF5, $06, nD5, nBb4, nAb4, nF4, nD4, nF4, nAb4, nB4
	dc.b	nD5, nF5, nD5, nB4, nAb4, nBb4
	smpsCall            Snd_FinalBoss1_Call04
	dc.b	smpsNoAttack, $0C
	smpsFMAlterVol      $FC
	dc.b	nCs4, $48, nRst, $0C
	smpsJump            Snd_FinalBoss1_Jump01

Snd_FinalBoss1_Call03:
	smpsSetvoice        $02
	dc.b	nEb4, $2A, $18, $12, $0C
	smpsLoop            $00, $08, Snd_FinalBoss1_Call03
	dc.b	nEb4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4, $06
	smpsFMAlterVol      $FC
	dc.b	nBb3, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb3
	smpsFMAlterVol      $FC
	dc.b	nBb3, nEb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4
	smpsFMAlterVol      $FC
	dc.b	nF4, nFs4, $36, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs4, $06
	smpsFMAlterVol      $FC
	dc.b	nEb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4
	smpsFMAlterVol      $FC
	dc.b	nEb4, nFs4, nEb4, nFs4, nAb4, $36, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb4, $06
	smpsFMAlterVol      $FC
	dc.b	nEb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4
	smpsFMAlterVol      $FC
	dc.b	nEb4, nAb4, nEb4, nA4
	smpsReturn

Snd_FinalBoss1_Call04:
	dc.b	nBb3, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb3
	smpsFMAlterVol      $FC
	dc.b	nFs4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs4, $06
	smpsFMAlterVol      $FC
	dc.b	nBb4, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb4
	smpsFMAlterVol      $FC
	dc.b	nBb4, $06, nFs4, nEb4, nC4, nBb3, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb3, $0C
	smpsFMAlterVol      $FC
	dc.b	nFs4, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs4, $0C
	smpsFMAlterVol      $FC
	dc.b	nBb4, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb4, $12
	smpsFMAlterVol      $FC
	dc.b	nA4, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nA4
	smpsFMAlterVol      $FC
	dc.b	nBb4, nD5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nD5
	smpsFMAlterVol      $FC
	dc.b	nBb4, nEb5, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$12
	smpsFMAlterVol      $FC
	dc.b	nBb4, $06, nCs5, $03, nEb5, nFs5, $06, nBb4, nCs5, nEb5, nFs5, nBb5
	dc.b	nFs5, $12, nEb5, nC5, nA4, nFs4, $06, nEb4, nC4, nEb4, nBb3, $24
	dc.b	smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nD4, $18, nEb4, nF4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	$0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nFs4, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nAb4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nFs4, $12, nEb4, nF4, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nBb4, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nAb4, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nFs4, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nAb4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nEb4, $18, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nB3, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nEb4, $18, nF4, nAb4, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nF4, $18, nCs4, nB3, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nAb3, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsReturn

; FM4 Data
Snd_FinalBoss1_FM4:
	smpsSetvoice        $02
	smpsModSet          $0E, $01, $02, $07
	smpsPan             panRight, $00

Snd_FinalBoss1_Loop04:
	dc.b	nFs4, $48, nAb4, $1B, nG4, $2D
	smpsLoop            $00, $04, Snd_FinalBoss1_Loop04
	dc.b	nFs4, $3C

Snd_FinalBoss1_Jump00:
	smpsCall            Snd_FinalBoss1_Call01
	dc.b	nD5, $36, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nD5, $0C
	smpsFMAlterVol      $FC
	dc.b	nC5, $06, nA4, nFs4, nEb4, nC4, nEb4
	smpsCall            Snd_FinalBoss1_Call02
	smpsFMAlterVol      $FC
	smpsCall            Snd_FinalBoss1_Call01
	dc.b	nD5, $0C, nBb5, $06, nF5, nD5, nBb4, nAb4, nF4, nAb4, nBb4, nD5
	dc.b	nF5, nBb5, nF5, nD5, nBb4, nD5
	smpsCall            Snd_FinalBoss1_Call02
	dc.b	smpsNoAttack, $0C
	smpsFMAlterVol      $FC
	dc.b	nEb4, $48, nRst, $0C
	smpsJump            Snd_FinalBoss1_Jump00

Snd_FinalBoss1_Call01:
	smpsSetvoice        $02
	dc.b	nFs4, $2A, nAb4, $18, nG4, $12, nG4, $0C
	smpsLoop            $00, $08, Snd_FinalBoss1_Call01
	dc.b	nFs4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs4, $06
	smpsFMAlterVol      $FC
	dc.b	nEb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4
	smpsFMAlterVol      $FC
	dc.b	nEb4, nFs4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs4
	smpsFMAlterVol      $FC
	dc.b	nAb4, nBb4, $36, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb4, $06
	smpsFMAlterVol      $FC
	dc.b	nFs4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nFs4
	smpsFMAlterVol      $FC
	dc.b	nFs4, nBb4, nFs4, nBb4, nC5, $36, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nC5, $06
	smpsFMAlterVol      $FC
	dc.b	nAb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nAb4
	smpsFMAlterVol      $FC
	dc.b	nAb4, nC5, nAb4, nC5
	smpsReturn

Snd_FinalBoss1_Call02:
	dc.b	nEb4, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4
	smpsFMAlterVol      $FC
	dc.b	nBb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb4, $06
	smpsFMAlterVol      $FC
	dc.b	nEb5, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5
	smpsFMAlterVol      $FC
	dc.b	nCs5, $06, nA4, nFs4, nEb4, nEb4, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb4, $0C
	smpsFMAlterVol      $FC
	dc.b	nBb4, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nBb4, $0C
	smpsFMAlterVol      $FC
	dc.b	nEb5, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nEb5, $12
	smpsFMAlterVol      $FC
	dc.b	nC5, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nC5
	smpsFMAlterVol      $FC
	dc.b	nCs5, nF5, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	nF5
	smpsFMAlterVol      $FC
	dc.b	nCs5, nFs5, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$12
	smpsFMAlterVol      $FC
	dc.b	nEb4, $06, nAb4, $03, nBb4, nEb5, $06, nEb4, nAb4, nBb4, nCs5, nFs5
	dc.b	nEb4, $12, nFs4, nEb4, nFs4, nC4, $06, nA4, nA4, nC5, nD4, $24
	dc.b	smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nF4, $18, nAb4, nBb4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	$0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	$0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nD5, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nBb4, $12, nAb4, nBb4, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nD5, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nBb4, $0C, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nBb4, $06, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$06
	smpsFMAlterVol      $FC
	dc.b	nB4, $30, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nAb4, $18, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nEb4, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nAb4, $18, nAb4, nB4, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nAb4, $18, nF4, nEb4, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsFMAlterVol      $FC
	dc.b	nB3, $24, smpsNoAttack
	smpsFMAlterVol      $04
	dc.b	$0C
	smpsReturn

; FM5 Data
Snd_FinalBoss1_FM5:
	dc.b	nRst, $09
	smpsModSet          $0E, $01, $02, $07
	smpsSetvoice        $00
	smpsPan             panCenter, $00
	smpsAlterNote       $FF
	dc.b	nRst, $30, nRst, $18, nRst, $30, nRst, $18, nRst, $30, nRst, $18
	dc.b	nEb4, $03, nE4, nFs4, nAb4, nE4, nFs4, nAb4, nBb4, nFs4, nAb4, nBb4
	dc.b	nB4, nAb4, nBb4, nB4, nCs5, nBb4, nB4, nCs5, nEb5, nB4, nCs5, nEb5
	dc.b	nE5, nFs5, $48, nRst, $30, nRst, $18, nRst, $30, nRst, $18, nEb4
	dc.b	$03, nE4, nFs4, nAb4, nE4, nFs4, nAb4, nBb4, nFs4, nAb4, nBb4, nB4
	dc.b	nAb4, nBb4, nB4, nCs5, nBb4, nB4, nCs5, nEb5, nB4, nCs5, nEb5, nE5
	dc.b	nFs5, $3C

Snd_FinalBoss1_Loop02:
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	smpsAlterNote       $FF
	dc.b	nEb5, $0C, nBb4, nFs5, nCs5, nF5, nC5, nE4, nE5
	smpsLoop            $00, $08, Snd_FinalBoss1_Loop02
	smpsCall            Snd_FinalBoss1_Call00
	dc.b	nAb4, $1E, nG4, $06, nFs4, nF4, nEb4, $18
	smpsFMAlterVol      $05
	dc.b	$18
	smpsFMAlterVol      $05
	dc.b	$18
	smpsFMAlterVol      $05
	dc.b	$09
	smpsSetvoice        $00
	smpsFMAlterVol      $F6
	smpsAlterNote       $FF
	dc.b	nE4, $0C, nE5

Snd_FinalBoss1_Loop03:
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	dc.b	nEb5, nBb4, nFs5, nCs5, nF5, nC5, nE4, nE5
	smpsLoop            $00, $07, Snd_FinalBoss1_Loop03
	smpsCall            Snd_FinalBoss1_Call00
	dc.b	nAb4, $24, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nRst, $0C
	smpsPan             panRight, $00
	smpsSetvoice        $04
	smpsFMAlterVol      $08
	dc.b	nCs5, $48, nRst, $15
	smpsFMAlterVol      $FD
	smpsJump            Snd_FinalBoss1_Loop02

Snd_FinalBoss1_Call00:
	dc.b	nRst, $30
	smpsLoop            $00, $07, Snd_FinalBoss1_Call00
	dc.b	nRst, $27
	smpsSetvoice        $03
	smpsFMAlterVol      $FB
	smpsAlterNote       $00
	dc.b	nEb4, $0C, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nBb4, $0C, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nEb5, $0C, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nFs4, $06, nC4, nCs4, nD4, nEb4, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nFs4, $06, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nBb4, $06, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$12
	smpsFMAlterVol      $FA
	dc.b	nC5, $06, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nCs5, nF5, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nCs5, nFs5, $24, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$12
	smpsFMAlterVol      $FA
	dc.b	nFs4, $06, nBb4, $03, nCs5, nEb5, $06, nFs4, nBb4, nCs5, nEb5, nFs5
	dc.b	nEb5, $12, nC5, nA4, nFs4, nC4, $06, nFs4, nA4, nC5, nBb4, $24
	dc.b	smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nD5, $18, nEb5, $0C, nE5, nF5, $30, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	$0C, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nFs5, $0C, nG5, $06, nAb5, $30, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nFs5, $0C, nF5, $06, nEb5, $0C, nE5, $06, nF5, $24, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nBb5, $0C, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nAb5, $0C, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nFs5, $06, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$06
	smpsFMAlterVol      $FA
	dc.b	nEb5, $30, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nB4, $18, nBb4, $06, nA4, nAb4, $24, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nB4, $18, nD5, nEb5, $24, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	dc.b	nB4, $18, nBb4, $0C, nA4, nAb4, $24, smpsNoAttack
	smpsFMAlterVol      $06
	dc.b	$0C
	smpsFMAlterVol      $FA
	smpsReturn

; PSG1 Data
Snd_FinalBoss1_PSG1:
	smpsModSet          $0E, $01, $02, $07

Snd_FinalBoss1_Loop11:
	dc.b	nBb4, $48, nC5, $1B, nB4, $2D
	smpsLoop            $00, $04, Snd_FinalBoss1_Loop11
	dc.b	nBb4, $3C

Snd_FinalBoss1_Jump03:
	smpsCall            Snd_FinalBoss1_Call07
	dc.b	nF5, $36, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5, $0C
	smpsPSGAlterVol     $FC
	dc.b	nD5, $06, nC5, nA4, nFs4, nEb4, nFs4
	smpsCall            Snd_FinalBoss1_Call08
	smpsPSGAlterVol     $FC
	smpsCall            Snd_FinalBoss1_Call07
	dc.b	nF5, $0C, nD6, $06, nBb5, nF5, nD5, nBb4, nBb4, nD5, nF5, nD5
	dc.b	nF5, nAb5, nF5, nF5, nF5, nD5
	smpsCall            Snd_FinalBoss1_Call08
	dc.b	smpsNoAttack, $0C
	smpsPSGAlterVol     $FC
	dc.b	nG4, $48, nRst, $0C
	smpsJump            Snd_FinalBoss1_Jump03

Snd_FinalBoss1_Call07:
	dc.b	nBb4, $2A, nC5, $18, nB4, $12, nB4, $0C
	smpsLoop            $00, $08, Snd_FinalBoss1_Call07
	dc.b	nBb4, $30, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb4, $06
	smpsPSGAlterVol     $FC
	dc.b	nFs4, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs4
	smpsPSGAlterVol     $FC
	dc.b	nFs4, nBb4, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb4
	smpsPSGAlterVol     $FC
	dc.b	nC5, nCs5, $36, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nCs5, $06
	smpsPSGAlterVol     $FC
	dc.b	nBb4, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb4
	smpsPSGAlterVol     $FC
	dc.b	nBb4, nCs5, nBb4, nCs5, nEb5, $36, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5, $06
	smpsPSGAlterVol     $FC
	dc.b	nC5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nC5
	smpsPSGAlterVol     $FC
	dc.b	nC5, nEb5, nC5, nEb5
	smpsReturn

Snd_FinalBoss1_Call08:
	dc.b	nBb4, $0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb4
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5, $06
	smpsPSGAlterVol     $FC
	dc.b	nFs5, $0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $06, nEb5, nA4, nFs4, nFs4, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs4, $0C
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $06, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5, $0C
	smpsPSGAlterVol     $FC
	dc.b	nFs5, $06, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs5, $12
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $06, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nAb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nAb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nBb5, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$12
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $06, nFs5, $03, nBb5, nEb6, $06, nEb5, nFs5, nBb5, nCs6, nEb6
	dc.b	nBb5, $12, nFs5, nEb5, nC5, nA4, $06, nC5, nEb5, nFs5, nF4, $24
	dc.b	smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nAb4, $18, nC5, nD5, $30, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	$0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	dc.b	nF5, $30, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $12, nEb5, nD5, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nF5, $0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	dc.b	nD5, $06, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	dc.b	nEb5, $30, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nB4, $18, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nAb4, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nB4, $18, nD5, nEb5, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nB4, $18, nBb4, nAb4, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nEb4, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsReturn

; PSG2 Data
Snd_FinalBoss1_PSG2:
	smpsModSet          $0E, $01, $02, $07

Snd_FinalBoss1_Loop0B:
	dc.b	nRst, $30, nRst, $18
	smpsLoop            $00, $08, Snd_FinalBoss1_Loop0B
	dc.b	nRst, $3C

Snd_FinalBoss1_Loop0C:
	smpsAlterNote       $FF
	dc.b	nRst, $30
	smpsLoop            $00, $08, Snd_FinalBoss1_Loop0C

Snd_FinalBoss1_Loop0D:
	dc.b	nEb5, $06, nBb5, nEb6, nFs5, nFs6, nF6, nCs6, nBb5, nRst, $30
	smpsLoop            $00, $02, Snd_FinalBoss1_Loop0D

Snd_FinalBoss1_Loop0E:
	dc.b	nEb5, $06, nBb5, nEb6, nFs5, nFs6, nF6, nCs6, nBb5, nEb5, nC6, nF6
	dc.b	nC6, nEb5, nB5, nE6, nB5
	smpsLoop            $00, $02, Snd_FinalBoss1_Loop0E

Snd_FinalBoss1_Loop0F:
	dc.b	nEb5, $06, nBb5, nEb6, nFs5, nFs6, nF6, nCs6, nBb5, nEb5, nBb5, nFs6
	dc.b	nCs6, nEb5, nBb5, nFs6, nCs6
	smpsLoop            $00, $03, Snd_FinalBoss1_Loop0F
	dc.b	nD5, $06, nBb5, nD6, nF5, nF6, nEb6, nD6, nBb5, nD5, nBb5, nF6
	dc.b	nD6, nD5, nBb5, nF6, nD6

Snd_FinalBoss1_Loop10:
	smpsAlterNote       $01
	dc.b	nRst, $30
	smpsLoop            $00, $08, Snd_FinalBoss1_Loop10
	dc.b	nRst, $06
	smpsAlterPitch      $0C
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nAb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nBb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nAb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nEb5, $06, nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nAb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nBb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nF5, $06, nAb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nAb5
	smpsPSGAlterVol     $FC
	dc.b	nF5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nF5
	smpsPSGAlterVol     $FC
	dc.b	nF5, nFs5, $0C, nAb5, $06, nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nAb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nAb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nAb5, $06, nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nBb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nBb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nFs5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	nEb5
	smpsPSGAlterVol     $FC
	dc.b	nEb5, nF5, $0C, nEb5, $06, nFs5, nEb5, nFs5, $03, nAb5, nBb5, $06
	dc.b	nEb5, nFs5, nAb5, nBb5, nCs6
	smpsAlterPitch      $F4
	smpsLoop            $01, $02, Snd_FinalBoss1_Loop0C
	dc.b	nRst, $30, nRst, $30
	smpsJump            Snd_FinalBoss1_Loop0C

; PSG3 Data
Snd_FinalBoss1_PSG3:
	smpsAlterNote       $FF
	dc.b	nRst, $30
	smpsLoop            $00, $0D, Snd_FinalBoss1_PSG3
	dc.b	nRst, $0C

Snd_FinalBoss1_Loop09:
	dc.b	nRst, $30
	smpsLoop            $00, $20, Snd_FinalBoss1_Loop09
	smpsCall            Snd_FinalBoss1_Call06
	smpsAlterNote       $F4
	dc.b	nAb5, $01
	smpsAlterNote       $F6
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FA
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$1E, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	$1E
	smpsAlterNote       $F4
	dc.b	nG5, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $F4
	dc.b	nFs5, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $F4
	dc.b	nF5, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $F4
	dc.b	nEb5, $01
	smpsAlterNote       $F6
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FA
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$12
	smpsFMAlterVol      $04
	dc.b	$18
	smpsFMAlterVol      $04
	dc.b	$18
	smpsFMAlterVol      $04
	dc.b	$18
	smpsFMAlterVol      $F4

Snd_FinalBoss1_Loop0A:
	dc.b	nRst, $30
	smpsLoop            $00, $1E, Snd_FinalBoss1_Loop0A
	smpsCall            Snd_FinalBoss1_Call06
	smpsAlterNote       $F4
	dc.b	nAb5, $01
	smpsAlterNote       $F6
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FA
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$1E, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	$24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	nRst, $30, nRst, $30
	smpsJump            Snd_FinalBoss1_Loop09

Snd_FinalBoss1_Call06:
	dc.b	nBb5, $24, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	smpsAlterNote       $30
	dc.b	nD6, $01
	smpsAlterNote       $28
	dc.b	$01
	smpsAlterNote       $20
	dc.b	$01
	smpsAlterNote       $18
	dc.b	$01
	smpsAlterNote       $10
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$12
	smpsAlterNote       $0C
	dc.b	nEb6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $0C
	dc.b	nE6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $0C
	dc.b	nF6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$2A, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	dc.b	$0C, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	smpsAlterNote       $0C
	dc.b	nFs6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $0C
	dc.b	nG6, $01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $0C
	dc.b	nAb6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$2A, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	smpsAlterNote       $E8
	dc.b	nFs6, $01
	smpsAlterNote       $EC
	dc.b	$01
	smpsAlterNote       $F0
	dc.b	$01
	smpsAlterNote       $F4
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $F4
	dc.b	nF6, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $E8
	dc.b	nEb6, $01
	smpsAlterNote       $EC
	dc.b	$01
	smpsAlterNote       $F0
	dc.b	$01
	smpsAlterNote       $F4
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $0C
	dc.b	nE6, $01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $0C
	dc.b	nF6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$1E, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	smpsAlterNote       $30
	dc.b	nBb6, $01
	smpsAlterNote       $28
	dc.b	$01
	smpsAlterNote       $20
	dc.b	$01
	smpsAlterNote       $18
	dc.b	$01
	smpsAlterNote       $10
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	smpsAlterNote       $E8
	dc.b	nAb6, $01
	smpsAlterNote       $EC
	dc.b	$01
	smpsAlterNote       $F0
	dc.b	$01
	smpsAlterNote       $F4
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	smpsAlterNote       $F4
	dc.b	nFs6, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$06
	smpsPSGAlterVol     $FC
	smpsAlterNote       $E8
	dc.b	nEb6, $01
	smpsAlterNote       $EC
	dc.b	$01
	smpsAlterNote       $F0
	dc.b	$01
	smpsAlterNote       $F4
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$2A, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	smpsAlterNote       $D0
	dc.b	nB5, $01
	smpsAlterNote       $D8
	dc.b	$01
	smpsAlterNote       $E0
	dc.b	$01
	smpsAlterNote       $E8
	dc.b	$01
	smpsAlterNote       $F0
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$12
	smpsAlterNote       $F4
	dc.b	nBb5, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $F4
	dc.b	nA5, $01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $F4
	dc.b	nAb5, $01
	smpsAlterNote       $F6
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FA
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$1E, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	smpsAlterNote       $30
	dc.b	nB5, $01
	smpsAlterNote       $28
	dc.b	$01
	smpsAlterNote       $20
	dc.b	$01
	smpsAlterNote       $18
	dc.b	$01
	smpsAlterNote       $10
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$12
	smpsAlterNote       $30
	dc.b	nD6, $01
	smpsAlterNote       $28
	dc.b	$01
	smpsAlterNote       $20
	dc.b	$01
	smpsAlterNote       $18
	dc.b	$01
	smpsAlterNote       $10
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$12
	smpsAlterNote       $0C
	dc.b	nEb6, $01
	smpsAlterNote       $0A
	dc.b	$01
	smpsAlterNote       $08
	dc.b	$01
	smpsAlterNote       $06
	dc.b	$01
	smpsAlterNote       $04
	dc.b	$01
	smpsAlterNote       $02
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$1E, smpsNoAttack
	smpsPSGAlterVol     $04
	dc.b	$0C
	smpsPSGAlterVol     $FC
	smpsAlterNote       $D0
	dc.b	nB5, $01
	smpsAlterNote       $D8
	dc.b	$01
	smpsAlterNote       $E0
	dc.b	$01
	smpsAlterNote       $E8
	dc.b	$01
	smpsAlterNote       $F0
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$12
	smpsAlterNote       $F4
	dc.b	nBb5, $01
	smpsAlterNote       $F6
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FA
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $F4
	dc.b	nA5, $01
	smpsAlterNote       $F6
	dc.b	$01
	smpsAlterNote       $F8
	dc.b	$01
	smpsAlterNote       $FA
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$06
	smpsReturn

; DAC Data
Snd_FinalBoss1_DAC:
	smpsPan             panCenter, $00
	dc.b	nRst, $30, nRst, $18
	smpsLoop            $00, $04, Snd_FinalBoss1_DAC

Snd_FinalBoss1_Loop00:
	dc.b	dKickS3, $24, dSnareS3, $1B, dKickS3, $09
	smpsLoop            $00, $03, Snd_FinalBoss1_Loop00
	dc.b	dKickS3, $1B, dKickS3, $09, dSnareS3, dKickS3, dSnareS3, dSnareS3, nRst, $24, dSnareS3, $03
	dc.b	dSnareS3, dSnareS3, dSnareS3, dKickS3, $06, dSnareS3

Snd_FinalBoss1_Loop01:
	dc.b	dKickS3, $0C, dSnareS3, dKickS3, $06, dKickS3, dSnareS3, $0C, dKickS3, dSnareS3, $06, dKickS3
	dc.b	$0C, dKickS3, $06, dSnareS3, $0C
	smpsLoop            $00, $30, Snd_FinalBoss1_Loop01
	dc.b	nRst, $06, dKickS3, dSnareS3, $0C, nRst, $3C, dSnareS3, $0C
	smpsJump            Snd_FinalBoss1_Loop01
