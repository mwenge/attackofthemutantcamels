; This is the reverse-engineered source code for the game 'Attack of the Mutant Camels' written by Jeff Minter in 1983.
;
; The code in this file was created by disassembling a binary of the game released into
; the public domain by Jeff Minter in 2019.
;
; The original code from which this source is derived is the copyright of Jeff Minter.
;
; The original home of this file is at: https://github.com/mwenge/attackofthemutantcamels
;
; To the extent to which any copyright may apply to the act of disassembling and reconstructing
; the code from its binary, the author disclaims copyright to this source code.  In place of
; a legal notice, here is a blessing:
;
;    May you do good and not evil.
;    May you find forgiveness for yourself and forgive others.
;    May you share freely, never taking more than you give.
;
; **** ZP FIELDS **** 
;
f1A = $1A
fD0 = $D0
;
; **** ZP ABSOLUTE ADRESSES **** 
;
a02 = $02
a03 = $03
a04 = $04
a05 = $05
a06 = $06
a07 = $07
a08 = $08
a09 = $09
a10 = $10
a11 = $11
a13 = $13
a14 = $14
a15 = $15
a16 = $16
a17 = $17
a18 = $18
a19 = $19
a1A = $1A
a1B = $1B
a1C = $1C
a1D = $1D
a1E = $1E
a1F = $1F
a20 = $20
a21 = $21
a22 = $22
a23 = $23
a24 = $24
a25 = $25
a26 = $26
a27 = $27
a28 = $28
a2B = $2B
a2C = $2C
a2D = $2D
a2E = $2E
a2F = $2F
a30 = $30
a31 = $31
a32 = $32
a33 = $33
a34 = $34
a36 = $36
a38 = $38
a3A = $3A
a3C = $3C
a3D = $3D
a3E = $3E
a3F = $3F
a40 = $40
a41 = $41
a42 = $42
a43 = $43
a44 = $44
a45 = $45
a46 = $46
a47 = $47
a48 = $48
a51 = $51
a52 = $52
a53 = $53
a54 = $54
a55 = $55
a56 = $56
a57 = $57
a58 = $58
a59 = $59
a5A = $5A
a5B = $5B
a5C = $5C
a5D = $5D
a5E = $5E
a5F = $5F
a60 = $60
a61 = $61
a62 = $62
a63 = $63
a64 = $64
a65 = $65
a66 = $66
a67 = $67
a68 = $68
a69 = $69
a6A = $6A
a6B = $6B
a6C = $6C
a6D = $6D
a6E = $6E
a6F = $6F
a70 = $70
a95 = $95
aC5 = $C5
aFD = $FD
aFE = $FE
aFF = $FF
;
; **** ZP POINTERS **** 
;
p02 = $02
p05 = $05
p06 = $06
p07 = $07
p08 = $08
p60 = $60
p64 = $64
p66 = $66
;
; **** FIELDS **** 
;
f003F = $003F
f0043 = $0043
f0340 = $0340
f0360 = $0360
f03FF = $03FF
f0412 = $0412
f0462 = $0462
f049F = $049F
f04AB = $04AB
f04B8 = $04B8
f04F0 = $04F0
f0500 = $0500
f0549 = $0549
f05B7 = $05B7
f05DF = $05DF
f0600 = $0600
f0607 = $0607
f062F = $062F
f065C = $065C
f06AC = $06AC
f06FC = $06FC
f0700 = $0700
f074C = $074C
f0797 = $0797
f079C = $079C
f07C2 = $07C2
f07C5 = $07C5
fCFFE = $CFFE
fCFFF = $CFFF
fD7FF = $D7FF
fD800 = $D800
fD84F = $D84F
fD870 = $D870
fD8AB = $D8AB
fD8B8 = $D8B8
fD900 = $D900
fD9B7 = $D9B7
fD9DF = $D9DF
fDA00 = $DA00
fDA07 = $DA07
fDA2F = $DA2F
fDB00 = $DB00
fDB97 = $DB97
fDBC2 = $DBC2
fDBC5 = $DBC5
;
; **** ABSOLUTE ADRESSES **** 
;
a0038 = $0038
a0042 = $0042
a0046 = $0046
a0095 = $0095
a00A2 = $00A2
a028D = $028D
a0314 = $0314
a0315 = $0315
a0463 = $0463
a0464 = $0464
a0465 = $0465
a04C6 = $04C6
a0706 = $0706
a071B = $071B
a071C = $071C
a0767 = $0767
a0768 = $0768
a0769 = $0769
a07F8 = $07F8
a07F9 = $07F9
a07FA = $07FA
a07FB = $07FB
a07FC = $07FC
a07FD = $07FD
a07FE = $07FE
a07FF = $07FF
a38F1 = $38F1
a38F2 = $38F2
a38F3 = $38F3
a38F4 = $38F4
aDC11 = $DC11
;
; **** POINTERS **** 
;
p0100 = $0100
p0104 = $0104
p0120 = $0120
p0124 = $0124
p012E = $012E
p0206 = $0206
p0300 = $0300
p0400 = $0400
p044F = $044F
p0519 = $0519
p05D0 = $05D0
p70A0 = $70A0
pC1C0 = $C1C0
pC6C2 = $C6C2
pCA20 = $CA20
pD000 = $D000
pE0DF = $E0DF
pE2E1 = $E2E1
;
; **** EXTERNAL JUMPS **** 
;
eEA31 = $EA31
;
; **** PREDEFINED LABELS **** 
;
ROM_CHKOUT = $FFC9

        * = $0801

        .BYTE $0C,$08,$0A,$00,$9E,$20,$34,$30
        .BYTE $39,$36,$00,$00,$00,$05,$00,$43
        .BYTE $B2,$43,$AA,$31,$3A,$8B,$43,$B2
        .BYTE $32,$A7,$9E,$34,$30,$39,$36,$00
        .BYTE $47,$08,$0A,$00,$97,$37,$38,$38
        .BYTE $2C,$35,$32,$3A,$97,$35,$33,$32
        .BYTE $38,$31,$2C,$30,$3A,$97,$35,$33
        .BYTE $32,$38,$30,$2C,$30,$3A,$97,$35
        .BYTE $33,$32,$34,$38,$AA,$32,$34,$2C
        .BYTE $32,$32,$3A,$99,$C7,$28,$38,$29
        .BYTE $00,$53,$08,$C8,$00,$93,$22,$22
        .BYTE $2C,$31,$2C,$31,$00,$00,$00,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$04,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$FF,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$99,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$09,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00,$FF,$FF,$04,$00,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$00,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$66,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$76,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FB,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$00,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$E6,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$F7,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00,$00,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$00
p09FF   .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
        .BYTE $00
p0A08   .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FB,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$99,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$89,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$04,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$99,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$89,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$04,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$66,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$76,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FB,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$66,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$76,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FB,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$99,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$89,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$04,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$99,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$89,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$04,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$66,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$76,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FB,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$66,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$77,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FB,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
p0E20   .BYTE $00,$00,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$99,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$89,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$04,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$99,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$89,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$04,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$66,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$76,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FB,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$00,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$E7,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$F7,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        LDA #>pD000
        STA a07
        LDA #<pD000
        STA a06
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        LDA #$18
        TAY 
        STA (p06),Y
        JSR s1020
;-------------------------------------------------------------------------
; j1016
;-------------------------------------------------------------------------
j1016
        JSR s2B5F
        JMP j27D8

        RTS 

        .BYTE $EA,$EA,$EA
;-------------------------------------------------------------------------
; s1020
;-------------------------------------------------------------------------
s1020
        LDA #<p0400
        STA a02
        LDA #>p0400
        STA a03
        LDY #$00
b102A   LDA a02
        STA f0340,Y
        LDA a03
        STA f0360,Y
        LDA a02
        CLC 
        ADC #$28
        STA a02
        LDA a03
        ADC #$00
        STA a03
        INY 
        CPY #$19
        BNE b102A
        LDX #$00
b1048   LDA f0340,X
        STA a02
        LDA f0360,X
        STA a03
        LDY #$00
        LDA #$20
b1056   STA (p02),Y
        INY 
        CPY #$28
        BNE b1056
        INX 
        CPX #$19
        BNE b1048
f1064   =*+$02
        JMP j1155

        .BYTE $13,$03,$0F,$12,$05,$20,$10,$0C
        .BYTE $2E,$20,$31,$20,$3E,$20,$20,$08
        .BYTE $09,$3A
f1077   .BYTE $20,$20,$0C,$0C,$01,$0D,$01,$20
        .BYTE $20,$20,$3E,$20,$13,$03,$0F,$12
        .BYTE $05,$20,$10,$0C,$2E,$32,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$3E,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$3E,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$30,$30
        .BYTE $30,$30,$30,$30,$30,$20,$20,$20
        .BYTE $20,$20,$3E,$20,$20,$20,$24,$20
        .BYTE $3A,$20,$20,$31,$30,$30,$20,$20
        .BYTE $20,$20,$3E,$20,$20,$20,$20,$30
        .BYTE $30,$30,$30,$30,$30,$30,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$3C,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$3C,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$20,$20
        .BYTE $20,$24,$20,$20,$20,$24,$20,$20
        .BYTE $20,$24,$20,$20,$20,$24,$20,$20
        .BYTE $20,$24,$20,$20,$20,$24,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00
;-------------------------------------------------------------------------
; j1155
;-------------------------------------------------------------------------
j1155
        LDY #$F0
b1157   LDA f1064,Y
        STA f03FF,Y
        LDA #$01
        STA fD7FF,Y
        DEY 
        BNE b1157
        RTS 

        NOP 
        NOP 
;-------------------------------------------------------------------------
; s1168
;-------------------------------------------------------------------------
s1168
        LDX a03
        LDY a02
        LDA f0340,X
        STA a08
        LDA f0360,X
        STA a09
        RTS 

;-------------------------------------------------------------------------
; s1177
;-------------------------------------------------------------------------
s1177
        JSR s1168
        LDA a04
        STA (p08),Y
        LDA a09
        CLC 
        ADC #$D4
        STA a09
        LDA a09
        NOP 
        NOP 
        STA a09
        LDA a05
        STA (p08),Y
        RTS 

;-------------------------------------------------------------------------
; s1190
;-------------------------------------------------------------------------
s1190
        JSR s1168
        LDA (p08),Y
        RTS 

b1196   LDX a10
        LDY #$28
b119A   LDA f21FF,X
        STA f05B7,Y
        LDA f2227,X
        STA f05DF,Y
        LDA f224F,X
        STA f0607,Y
        LDA f2277,X
        STA f062F,Y
        LDA #$08
        STA fD9B7,Y
        STA fD9DF,Y
        STA fDA07,Y
        STA fDA2F,Y
        DEX 
        CPX #$00
        BNE b11C7
        LDX #$28
b11C7   DEY 
        BNE b119A
        RTS 

;-------------------------------------------------------------------------
; j11CB
;-------------------------------------------------------------------------
j11CB
        LDA a11
        BEQ b11DE
        INC a10
        LDA a10
        CMP #$29
        BMI b1196
        LDA #$01
        STA a10
        JMP b1196

b11DE   DEC a10
        LDA a10
        CMP #$00
        BNE b1196
        LDA #$28
        STA a10
        JMP b1196

;-------------------------------------------------------------------------
; s11ED
;-------------------------------------------------------------------------
s11ED
        DEC a13
        BEQ b11F2
        RTS 

b11F2   LDA #$08
        STA a13
        NOP 
        NOP 
        NOP 
        NOP 
        LDA a16
        STA a07F8
        INC $D025    ;Sprite Multi-Color Register 0
        LDA a19
        STA $D001    ;Sprite 0 Y Pos
        LDA a18
        CLC 
        ASL 
        STA pD000    ;Sprite 0 X Pos
        BCS b121B
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FE
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1223

b121B   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$01
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1223
;-------------------------------------------------------------------------
j1223
        JMP j12F9

;-------------------------------------------------------------------------
; j1226
;-------------------------------------------------------------------------
j1226
        DEC a17
        BEQ b122B
        RTS 

b122B   LDA a15
        STA a17
        JMP j1750

;-------------------------------------------------------------------------
; s1232
;-------------------------------------------------------------------------
s1232
        LDA a1D
        CMP #$02
        BEQ b1239
        RTS 

b1239   LDA aDC11
        EOR #$FF
        STA a1A
        AND #$01
        BEQ b1250
        DEC a19
        LDA a19
        CMP #$60
        BNE b1250
        LDA #$61
        STA a19
b1250   LDA a1A
        AND #$02
        BEQ b1262
        INC a19
        LDA a19
        CMP #$E0
        BNE b1262
        LDA #$DF
        STA a19
b1262   RTS 

        NOP 
;-------------------------------------------------------------------------
; j1264
;-------------------------------------------------------------------------
j1264
        STA a1B
        LDA a11
        BEQ b126E
        LDA #$08
        STA a1B
b126E   LDA a1A
        AND a1B
        BNE b1291
        LDA a1A
        AND #$0C
        BNE b127D
        RTS 

        .BYTE $7A,$12
b127D   LDA #$FF
        STA a1C
        LDA a16
        CMP #$CA
        BEQ b128C
        LDA #$CA
        STA a16
        RTS 

b128C   LDA #$CB
        STA a16
        RTS 

b1291   INC a14
        LDA a14
        CMP #$48
        BNE b129D
        LDA #$47
        STA a14
b129D   LDA a11
        BNE b12AA
        LDA #$A0
        SBC a14
        STA a18
        JMP j12B0

b12AA   LDA #$0A
        ADC a14
        STA a18
;-------------------------------------------------------------------------
; j12B0
;-------------------------------------------------------------------------
j12B0
        LDA a14
        LDY #$03
b12B4   CLC 
        ROR 
        DEY 
        BNE b12B4
        TAX 
        LDA f22A8,X
        STA a15
        RTS 

;-------------------------------------------------------------------------
; s12C0
;-------------------------------------------------------------------------
s12C0
        DEC a1D
        BEQ b12C5
        RTS 

b12C5   LDA #$08
        STA a1D
        RTS 

;-------------------------------------------------------------------------
; s12CA
;-------------------------------------------------------------------------
s12CA
        LDA a1D
        CMP #$01
        BEQ b12D1
b12D0   RTS 

b12D1   DEC a1E
        BNE b12D0
        LDA #$04
        STA a1E
        LDA a1A
        AND #$0C
        BEQ b12EE
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        LDA #$04
        JMP j1264

b12EE   DEC a14
        BNE b12F6
        LDA #$01
        STA a14
b12F6   JMP b129D

;-------------------------------------------------------------------------
; j12F9
;-------------------------------------------------------------------------
j12F9
        NOP 
        NOP 
        NOP 
        LDA a15
        CMP #$FF
        BNE b1307
        LDA #$10
        STA a17
        RTS 

b1307   JMP j1226

;-------------------------------------------------------------------------
; s130A
;-------------------------------------------------------------------------
s130A
        LDA a1D
        CMP #$03
        BEQ b1311
        RTS 

b1311   LDA a1C
        BNE b1316
        RTS 

b1316   CMP #$80
        BEQ b1329
        LDA a11
        BEQ b1325
        LDA #$00
        STA a11
        JMP b1329

b1325   LDA #$01
        STA a11
b1329   JMP j135D

;-------------------------------------------------------------------------
; j132C
;-------------------------------------------------------------------------
j132C
        BEQ b1338
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA a1F
        JMP j133F

b1338   LDA #$21
        STA $D404    ;Voice 1: Control Register
        STA a1F
;-------------------------------------------------------------------------
; j133F
;-------------------------------------------------------------------------
j133F
        LDA a14
        CMP #$06
        BNE b1349
        LDA #$00
        STA a1C
b1349   LDA a1D
        STA a1D
        LDA #$04
        STA a1E
        JMP b12EE

b1354   LDA #$80
        STA a1C
        LDA a1F
        JMP j132C

;-------------------------------------------------------------------------
; j135D
;-------------------------------------------------------------------------
j135D
        LDA a1C
        CMP #$FF
        BNE b1354
        LDA #$90
        SBC a14
        STA a14
        JMP b1354

;-------------------------------------------------------------------------
; s136C
;-------------------------------------------------------------------------
s136C
        LDX #$0F
b136E   LDA f0340,X
        STA a08
        LDA f0360,X
        STA a09
        LDY #$00
b137A   LDA #$2B
        STA (p08),Y
        LDA a09
        STA a02
        CLC 
        ADC #$D4
        STA a09
        LDA #$0B
        STA (p08),Y
        LDA a02
        STA a09
        INY 
        CPY #$28
        BNE b137A
        INX 
        CPX #$17
        BNE b136E
        RTS 

;-------------------------------------------------------------------------
; s139A
;-------------------------------------------------------------------------
s139A
        DEC a21
        BEQ b139F
        RTS 

b139F   LDA #$13
        STA a21
b13A4   =*+$01
        LDA a11
        BEQ b13B0
        JMP j13E4

        BEQ b13A4
        DEC $D00E    ;Sprite 7 X Pos
        RTS 

b13B0   LDA #$13
        STA a21
        DEC a20
        LDA a20
        CMP #$00
        BNE b13C0
        LDA #$9F
        STA a20
b13C0   LDA a20
        ASL 
        STA $D00E    ;Sprite 7 X Pos
        BCC b13D1
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$80
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

b13D1   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$7F
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

        JSR s139A
        LDX a10
        LDY #$28
        JMP b119A

;-------------------------------------------------------------------------
; j13E4
;-------------------------------------------------------------------------
j13E4
        INC a20
        LDA a20
        CMP #$A0
        BNE b13C0
        LDA #$01
        STA a20
        JMP b13C0

        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA
;-------------------------------------------------------------------------
; j1400
;-------------------------------------------------------------------------
j1400
        LDA #$81
        STA $D015    ;Sprite display Enable
        LDA #$01
        STA a14
        LDA #>pCA20
        STA a16
        LDA #<pCA20
        STA a15
        STA a17
        LDA #<p70A0
        STA a18
        LDA #>p70A0
        STA a19
        LDA #$78
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA a28
        STA a28
        LDA #$07
        STA $D025    ;Sprite Multi-Color Register 0
        LDA #$0E
        STA $D026    ;Sprite Multi-Color Register 1
        LDA #$01
        STA $D027    ;Sprite 0 Color
        LDA #>p02
        STA a11
        LDA #<p02
        STA a10
        LDA #$00
        STA $D01B    ;Sprite to Background Display Priority
        LDA #$03
        STA $D01C    ;Sprites Multi-Color Mode Select
        JSR b1196
        LDA #$01
        STA a1D
        STA a1E
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        LDA #$0A
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        LDA #$00
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        LDA #$19
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR s136C
        LDA #$9F
        STA a20
        LDA #$52
        STA $D00F    ;Sprite 7 Y Pos
        LDA #$D1
        STA a07FF
        LDA #$01
        STA $D02E    ;Sprite 7 Color
        LDA #$0A
        STA a21
        LDA #$00
        STA a1C
        JSR b139F
        LDA #$84
        STA $D007    ;Sprite 3 Y Pos
        STA $D009    ;Sprite 4 Y Pos
        LDA #$AE
        STA $D00B    ;Sprite 5 Y Pos
        STA $D00D    ;Sprite 6 Y Pos
        LDA #<pC1C0
        STA a07FB
        LDA #>pC1C0
        STA a07FC
        LDA #<pC6C2
        STA a07FD
        LDA #>pC6C2
        STA a07FE
        LDA #$FF
        STA a23
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA #<p0A08
        STA a26
        LDA #>p0A08
        STA a27
        LDA #<p0104
        STA a2D
        LDA #>p0104
        STA a2E
        LDA #$02
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$40
        STA a2F
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA
        JMP j1F00

        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA
;-------------------------------------------------------------------------
; j1500
;-------------------------------------------------------------------------
j1500
        JSR s11ED
        JSR s1232
        JSR s12C0
        JSR s12CA
        JSR s130A
        JSR s1600
        JSR s179A
        JSR s1800
        JSR s18A6
        JSR s1922
        JSR s199E
        JSR s1B68
        JSR s1D92
        JSR s2DC8
        JSR s2B19
        JSR s2E13
        JSR s2EC4
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA
        NOP 
        JMP j1500

;-------------------------------------------------------------------------
; j1563
;-------------------------------------------------------------------------
j1563
        LDA #$80
        STA $D015    ;Sprite display Enable
        JMP j28AC

        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA
;-------------------------------------------------------------------------
; s1600
;-------------------------------------------------------------------------
s1600
        LDA a1D
        CMP #$01
        BEQ b1607
        RTS 

b1607   LDX a23
        CPX #$FF
        BNE b1610
        RTS 

        LDY a16
b1610   LDA f22C7,X
;-------------------------------------------------------------------------
; j1613
;-------------------------------------------------------------------------
j1613
        STA $D02D    ;Sprite 6 Color
        STA $D02A    ;Sprite 3 Color
        STA $D02B    ;Sprite 4 Color
        STA $D02C    ;Sprite 5 Color
        LDA $D015    ;Sprite display Enable
        ORA #$78
        STA $D015    ;Sprite display Enable
        LDA @wa0042
        ASL 
        STA $D008    ;Sprite 4 X Pos
        STA $D00C    ;Sprite 6 X Pos
        BCS b163E
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$AF
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1646

b163E   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$50
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1646
;-------------------------------------------------------------------------
j1646
        LDA @wa0042
        SBC #$17
        ASL 
        STA $D006    ;Sprite 3 X Pos
        STA $D00A    ;Sprite 5 X Pos
        BCS b165D
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$D7
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

b165D   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$28
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

        .BYTE $D0
        AND #$D7
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$28
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

        LDA a17
        CMP #$01
        BNE b169E
        LDA a11
        BEQ b1695
        DEC f22CF,X
        JMP j173E

        CMP #$FF
        BNE b169E
        STA a23
;-------------------------------------------------------------------------
; j168C
;-------------------------------------------------------------------------
j168C
        LDA $D015    ;Sprite display Enable
        AND #$87
        STA $D015    ;Sprite display Enable
        RTS 

b1695   INC f22CF,X
        LDA f22CF,X
        JMP j173E

b169E   RTS 

        .BYTE $C7,$22
        JMP j1613

;-------------------------------------------------------------------------
; j16A4
;-------------------------------------------------------------------------
j16A4
        LDA $D01F    ;Sprite to Background Collision Detect
        AND #$80
        BNE b16AC
        RTS 

b16AC   LDX #$06
b16AE   JSR s1982
        STA a02
        LDA #$04
        STA a03
        STX a2C
        JSR s1190
        STA a24
        LDA #$A0
        STA a25
b16C2   LDA #<p0120
        STA a04
        LDA #>p0120
        STA a05
        JSR s1177
        DEC a25
        BNE b16C2
        LDA $D01F    ;Sprite to Background Collision Detect
        AND #$80
        BEQ b16E3
        LDA a24
        JSR s16FC
        LDX a2C
;-------------------------------------------------------------------------
; j16DF
;-------------------------------------------------------------------------
j16DF
        DEX 
        BNE b16AE
        RTS 

b16E3   LDA a24
        JSR s16FC
        LDX a2C
        STX a23
        LDA a11
        BEQ b16F6
        LDA #$D5
        JMP j17F0

        RTS 

b16F6   LDA #$00
;-------------------------------------------------------------------------
; j16F8
;-------------------------------------------------------------------------
j16F8
        STA f22CF,X
        RTS 

;-------------------------------------------------------------------------
; s16FC
;-------------------------------------------------------------------------
s16FC
        STA a04
        JMP s1177

        DEC a26
b1703   BEQ b1703
        RTS 

        LDA #$08
        STA a26
        JMP j11CB

        LDA a17
        CMP #$01
        BEQ b1714
        RTS 

b1714   LDA a15
        CMP #$FF
        BNE b171B
        RTS 

b171B   JMP s139A

b171E   DEC a26
        BNE b1729
        JSR s19E3
        LDA #$08
        STA a26
b1729   JMP j19B3

        .BYTE $3C,$C9,$FF ;NOP ROM_CHKOUT,X
        BEQ b1735
b1731   RTS 

        DEC a3D
b1735   =*+$01
        LDA a3D
        CMP #$FF
        BNE b1731
        LDA #$09
        STA a3E
;-------------------------------------------------------------------------
; j173E
;-------------------------------------------------------------------------
j173E
        RTS 

        .BYTE $CF,$22,$C9 ;DCP $C922
        CPX #$F0
        ORA (p60,X)
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA #$FF
        STA a23
        JMP j168C

;-------------------------------------------------------------------------
; j1750
;-------------------------------------------------------------------------
j1750
        LDA a1C
        BEQ b171E
        RTS 

        STA f1A,X
        LDA a1C
        BNE b175E
        JMP j16A4

b175E   RTS 

        LDA a1E
        CMP #$01
        BEQ b1766
        RTS 

b1766   JSR s2449
        NOP 
        INC a2D
        LDA a2D
        CMP #$05
        BEQ b1781
        LDA #$C1
        CLC 
        ADC a2D
        STA a07FD
        CLC 
        ADC #$04
        JMP j1B4A

        RTS 

b1781   LDA #$00
        JMP j1CC2

;-------------------------------------------------------------------------
; j1786
;-------------------------------------------------------------------------
j1786
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
;-------------------------------------------------------------------------
; j178B
;-------------------------------------------------------------------------
j178B
        LDA #$C2
        STA a07FD
        LDA #$C6
        JSR s1B5B
        LDA #$01
        STA a2D
b1799   RTS 

;-------------------------------------------------------------------------
; s179A
;-------------------------------------------------------------------------
s179A
        DEC a28
        BNE b1799
        JSR s27C2
        BNE b17A7
        LDA #$03
        STA a2E
b17A7   JSR s17B7
        LDX a23
        INC a3E
        BNE b17B3
        INC a3F
        NOP 
b17B3   NOP 
        JMP j1A23

;-------------------------------------------------------------------------
; s17B7
;-------------------------------------------------------------------------
s17B7
        DEC a2F
        BNE b17ED
        LDA #$40
        STA a2F
        LDX #$06
b17C1   JSR s1990
        STA a02
        LDA #<p2004
        STA a03
        LDA #>p2004
        STA a04
        LDA #$01
        STA a05
        STX a2C
        JSR s1177
        LDX a2C
        INC f22D7,X
        NOP 
        NOP 
        NOP 
        INC a02
        LDA #$24
        STA a04
        JSR s1177
        LDX a2C
;-------------------------------------------------------------------------
; j17EA
;-------------------------------------------------------------------------
j17EA
        DEX 
        BNE b17C1
b17ED   RTS 

        ROR a17
;-------------------------------------------------------------------------
; j17F0
;-------------------------------------------------------------------------
j17F0
        LDA a14
        CMP #$01
        BEQ b17FB
        LDA #$D5
        JMP j16F8

b17FB   JMP b16F6

        NOP 
        NOP 
;-------------------------------------------------------------------------
; s1800
;-------------------------------------------------------------------------
s1800
        LDA a34
        CMP #$02
        BEQ b1807
        RTS 

b1807   LDA a1A
        AND #$10
        BNE b1812
        LDA #$00
        STA a30
        RTS 

b1812   LDA a31
        BEQ b1817
        RTS 

b1817   JMP j1B39

;-------------------------------------------------------------------------
; j181A
;-------------------------------------------------------------------------
j181A
        NOP 
        JSR s18D4
        NOP 
        LDA #$A5
        STA a36
        LDA #<p0100
        STA a30
        LDA #>p0100
        STA a31
        LDA $D015    ;Sprite display Enable
        ORA #$02
        STA $D015    ;Sprite display Enable
        LDA a11
        BEQ b183B
        LDA #$02
        STA a31
b183B   RTS 

;-------------------------------------------------------------------------
; j183C
;-------------------------------------------------------------------------
j183C
        LDA a31
        CMP #$00
        NOP 
        NOP 
        BEQ b183B
        LDA a31
        CMP #$01
        BEQ b1855
        INC a32
        LDA a32
        CMP #$A5
        BEQ b1894
        JMP j185D

b1855   DEC a32
        LDA a32
        CMP #$F5
        BEQ b1894
;-------------------------------------------------------------------------
; j185D
;-------------------------------------------------------------------------
j185D
        LDA a32
        ASL 
        STA $D002    ;Sprite 1 X Pos
        BCS b1870
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FD
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1878

b1870   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$02
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1878
;-------------------------------------------------------------------------
j1878
        LDA a33
        STA $D003    ;Sprite 1 Y Pos
        JSR s24E6
        AND #$7A
        CMP #$0A
        BEQ b188E
        CMP #$12
        BEQ b188E
        JSR s18B2
        RTS 

b188E   JSR s247D
        JSR s18C4
b1894   LDA #$00
        STA $D003    ;Sprite 1 Y Pos
        LDA $D015    ;Sprite display Enable
        AND #$FD
        STA $D015    ;Sprite display Enable
        LDA #$00
        JMP j18DD

;-------------------------------------------------------------------------
; s18A6
;-------------------------------------------------------------------------
s18A6
        DEC a34
        BEQ b18AB
        RTS 

b18AB   LDA #$04
        STA a34
        JMP j1B28

;-------------------------------------------------------------------------
; s18B2
;-------------------------------------------------------------------------
s18B2
        DEC a36
        LDA a36
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        RTS 

;-------------------------------------------------------------------------
; s18C4
;-------------------------------------------------------------------------
s18C4
        LDA #$06
        JSR s2E93
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        LDA #$81
        STA $D412    ;Voice 3: Control Register
        NOP 
;-------------------------------------------------------------------------
; s18D4
;-------------------------------------------------------------------------
s18D4
        LDA a19
        STA a33
        LDA #$40
        STA a21
        RTS 

;-------------------------------------------------------------------------
; j18DD
;-------------------------------------------------------------------------
j18DD
        STA a31
        LDA #$19
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA a30
        STA a30
b18E8   RTS 

;-------------------------------------------------------------------------
; j18E9
;-------------------------------------------------------------------------
j18E9
        LDA a30
        BNE b18E8
        LDA a18
        STA a32
        JMP j181A

;-------------------------------------------------------------------------
; s18F4
;-------------------------------------------------------------------------
s18F4
        LDX a23
        DEC f22DF,X
        LDA f22DF,X
        BEQ b18FF
        RTS 

b18FF   LDA #$10
        STA f22DF,X
        DEC f22E7,X
        LDA f22E7,X
        BEQ b1914
        TAY 
        LDA f242F,Y
        STA f22C7,X
        RTS 

b1914   LDA a23
        JSR s2487
        LDA #$D5
        STA a38
        LDA #$FF
        STA a3A
        RTS 

;-------------------------------------------------------------------------
; s1922
;-------------------------------------------------------------------------
s1922
        LDA a3A
        BNE b1927
        RTS 

b1927   STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX a46
        STA f22C7,X
        CMP #$80
        BNE b1937
        LDA #$D6
        STA a38
b1937   LDA a1D
        CMP #$01
        BEQ b194F
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$15
        STA $D404    ;Voice 1: Control Register
        LDA #$FF
        SBC a3A
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
b194E   RTS 

b194F   DEC a3A
        BNE b194E
        LDA #$40
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        NOP 
        NOP 
        LDA #$07
        STA f22C7,X
        JSR s1AB9
        STA a02
        LDA #<p2004
        STA a03
        LDA #>p2004
        STA a04
        JSR s1177
        LDA #$FF
        STA a46
        LDA $D015    ;Sprite display Enable
        AND #$87
        STA $D015    ;Sprite display Enable
        LDA $D01F    ;Sprite to Background Collision Detect
        JMP j24E0

        RTS 

;-------------------------------------------------------------------------
; s1982
;-------------------------------------------------------------------------
s1982
        LDA f22E7,X
        BEQ b198B
        LDA f22D7,X
        RTS 

b198B   PLA 
        PLA 
        JMP j16DF

;-------------------------------------------------------------------------
; s1990
;-------------------------------------------------------------------------
s1990
        JSR s1AC3
        BEQ b1999
        LDA f22D7,X
        RTS 

b1999   PLA 
        PLA 
        JMP j17EA

;-------------------------------------------------------------------------
; s199E
;-------------------------------------------------------------------------
s199E
        LDA a1D
        CMP #$01
        BEQ b19A5
        RTS 

b19A5   LDA a38
        STA a07FC
        RTS 

;-------------------------------------------------------------------------
; j19AB
;-------------------------------------------------------------------------
j19AB
        NOP 
        NOP 
        NOP 
        LDA #$C1
        STA a38
        RTS 

;-------------------------------------------------------------------------
; j19B3
;-------------------------------------------------------------------------
j19B3
        LDA a11
        CMP #$00
        BEQ b19CC
        INC a3C
        BNE b19C9
        INC a3D
        LDA a3D
        CMP #$0A
        BNE b19E0
        LDA #$00
        STA a3D
b19C9   JMP b19E0

b19CC   DEC a3C
        LDA a3C
        CMP #$FF
        BNE b19E0
        DEC a3D
        LDA a3D
        CMP #$FF
        BNE b19E0
        LDA #$09
        STA a3D
b19E0   JMP j1A57

;-------------------------------------------------------------------------
; s19E3
;-------------------------------------------------------------------------
s19E3
        JSR j11CB
        LDA #$05
        STA a40
        LDX a3D
b19EC   CLC 
        LDA a40
        ADC #$10
        STA a40
        DEX 
        BNE b19EC
        LDA a3C
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        NOP 
        CLC 
        ADC a40
        CLC 
        ASL 
        STA $D00E    ;Sprite 7 X Pos
        BCC b1A17
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$80
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1A1F

b1A17   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$7F
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1A1F
;-------------------------------------------------------------------------
j1A1F
        NOP 
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; j1A23
;-------------------------------------------------------------------------
j1A23
        LDY #$00
        LDA a3D
        STA a40
        LDA a3C
        STA a41
b1A2D   LDA a41
        CMP a3E
        BEQ b1A44
b1A33   INC a41
        BNE b1A39
        INC a40
b1A39   INY 
        CPY #$C0
        BNE b1A2D
;-------------------------------------------------------------------------
; j1A3E
;-------------------------------------------------------------------------
j1A3E
        LDA #$FF
        JMP j1A63

        RTS 

b1A44   LDA a40
        SEC 
        SBC a3F
        STA a23
        LDX a23
        JSR s1A70
        CMP #$FF
        BEQ b1A33
        STY a42
        RTS 

;-------------------------------------------------------------------------
; j1A57
;-------------------------------------------------------------------------
j1A57
        DEC a43
        BEQ b1A5C
        RTS 

b1A5C   LDA #$03
        STA a43
        JMP j1A23

;-------------------------------------------------------------------------
; j1A63
;-------------------------------------------------------------------------
j1A63
        STA a23
        LDA $D015    ;Sprite display Enable
        AND #$87
        STA $D015    ;Sprite display Enable
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; s1A70
;-------------------------------------------------------------------------
s1A70
        NOP 
        CPX #$07
        BPL b1A79
        JMP j1AC9

        RTS 

b1A79   PLA 
        PLA 
        JMP j1A3E

        LDA a3D
        STA a40
        INC a40
        NOP 
        NOP 
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; j1A89
;-------------------------------------------------------------------------
j1A89
        CPX #$00
        BEQ b1A79
        LDA f22E7,X
        RTS 

        LDA a3D
        STA a40
        LDX #$10
b1A97   LDY #$10
b1A99   LDA #$20
        STA a44
b1A9D   DEC a44
        BNE b1A9D
        DEY 
        BNE b1A99
        DEX 
        BNE b1A97
        RTS 

p1AA8   DEC a45
        BEQ b1AAF
        JMP eEA31

b1AAF   LDA #$10
        STA a45
        JSR b1766
        JMP eEA31

;-------------------------------------------------------------------------
; s1AB9
;-------------------------------------------------------------------------
s1AB9
        LDA #$FF
        STA f22E7,X
        LDA f22D7,X
        RTS 

        NOP 
;-------------------------------------------------------------------------
; s1AC3
;-------------------------------------------------------------------------
s1AC3
        LDA f22E7,X
        CMP #$FF
        RTS 

;-------------------------------------------------------------------------
; j1AC9
;-------------------------------------------------------------------------
j1AC9
        LDA a3D
        CMP a3F
        BMI b1AD2
        JMP j1A89

b1AD2   JMP j1A3E

;-------------------------------------------------------------------------
; s1AD5
;-------------------------------------------------------------------------
s1AD5
        LDA #<p012E
        STA a04
        LDA #>p012E
        STA a05
        LDX #$10
b1ADF   LDA f22FF,X
        STA a02
        LDA f230F,X
        STA a03
        STX a40
        JSR s1177
        LDX a40
        DEX 
        BNE b1ADF
        RTS 

;-------------------------------------------------------------------------
; j1AF4
;-------------------------------------------------------------------------
j1AF4
        LDA #<p012E
        STA a04
        LDA #>p012E
        STA a05
        LDX a47
        LDA f2300,X
        STA a02
        LDA f2310,X
        STA a03
        JSR s1177
        INC a47
        LDA a47
        AND #$0F
        STA a47
        TAX 
        LDA f2300,X
        STA a02
        LDA f2310,X
        STA a03
        LDA #$02
        STA a05
        JSR s1177
        JMP j183C

;-------------------------------------------------------------------------
; j1B28
;-------------------------------------------------------------------------
j1B28
        JSR s1B41
        DEC a48
        BEQ b1B32
        JMP j183C

b1B32   LDA #$26
        STA a48
        JMP j1AF4

;-------------------------------------------------------------------------
; j1B39
;-------------------------------------------------------------------------
j1B39
        LDA #$00
        BEQ b1B3E
        RTS 

b1B3E   JMP j18E9

;-------------------------------------------------------------------------
; s1B41
;-------------------------------------------------------------------------
s1B41
        LDA a21
        BEQ b1B47
        DEC a21
b1B47   NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; j1B4A
;-------------------------------------------------------------------------
j1B4A
        STA a07FE
        LDA a3A
        BEQ b1B52
        RTS 

b1B52   LDX a2D
        LDA f231F,X
        STA @wa0038
        RTS 

;-------------------------------------------------------------------------
; s1B5B
;-------------------------------------------------------------------------
s1B5B
        STA a07FE
        LDA a3A
        BEQ b1B63
        RTS 

b1B63   LDA #$C1
        STA a38
        RTS 

;-------------------------------------------------------------------------
; s1B68
;-------------------------------------------------------------------------
s1B68
        DEC a5D
        BEQ b1B6D
        RTS 

b1B6D   LDA a5E
        STA a5D
        LDA a55
        BNE b1BA0
        LDA #$88
        STA $D005    ;Sprite 2 Y Pos
        JMP j1CD5

        NOP 
        NOP 
;-------------------------------------------------------------------------
; j1B7F
;-------------------------------------------------------------------------
j1B7F
        ADC #$10
        JSR s27C9
        NOP 
        BPL b1B8E
        LDA #$01
;-------------------------------------------------------------------------
; j1B89
;-------------------------------------------------------------------------
j1B89
        STA a59
        JMP j1B93

b1B8E   LDA #$03
        JMP j1B89

;-------------------------------------------------------------------------
; j1B93
;-------------------------------------------------------------------------
j1B93
        LDA #$01
        STA a55
        LDA $D015    ;Sprite display Enable
        ORA #$04
        JMP j1CB3

        RTS 

b1BA0   LDA a55
        CMP #$FF
        BEQ b1C21
;-------------------------------------------------------------------------
; j1BA6
;-------------------------------------------------------------------------
j1BA6
        LDA a23
        JMP j1BAB

;-------------------------------------------------------------------------
; j1BAB
;-------------------------------------------------------------------------
j1BAB
        LDA a59
        CMP #$01
        BNE b1BB5
        INC a56
        INC a56
b1BB5   DEC a56
        LDA a56
        CMP #$04
        BEQ b1BC4
        CMP #$B0
        BEQ b1BC4
        JMP j1BD0

b1BC4   LDA #$00
        STA a55
        NOP 
        NOP 
        NOP 
        NOP 
        JMP j1C30

        RTS 

;-------------------------------------------------------------------------
; j1BD0
;-------------------------------------------------------------------------
j1BD0
        DEC a5F
        BNE b1BE8
        LDA a52
        STA a5F
        LDA $D005    ;Sprite 2 Y Pos
        CMP a19
        BPL b1BE5
        INC $D005    ;Sprite 2 Y Pos
        INC $D005    ;Sprite 2 Y Pos
b1BE5   DEC $D005    ;Sprite 2 Y Pos
b1BE8   LDA a56
        CLC 
        ASL 
        STA $D004    ;Sprite 2 X Pos
        BCC b1BFC
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$04
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1C04

b1BFC   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FB
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1C04
;-------------------------------------------------------------------------
j1C04
        INC a57
        LDA a57
        CMP #$D1
        BNE b1C13
        LDA #$D7
        STA a57
        JMP j1C1B

b1C13   CMP #$D9
        BNE j1C1B
        LDA #$D0
        STA a57
;-------------------------------------------------------------------------
; j1C1B
;-------------------------------------------------------------------------
j1C1B
        STA a07FA
        JMP j1CDC

b1C21   JMP j1D01

b1C24   LDA a23
        CMP #$FF
        BNE b1C2B
        RTS 

b1C2B   LDA a42
        JMP j1B7F

;-------------------------------------------------------------------------
; j1C30
;-------------------------------------------------------------------------
j1C30
        LDA $D015    ;Sprite display Enable
        AND #$FB
        JMP j1CF4

        RTS 

;-------------------------------------------------------------------------
; j1C39
;-------------------------------------------------------------------------
j1C39
        LDA @wa00A2
        AND #$FF
        CMP #$02
        BMI b1C24
        RTS 

;-------------------------------------------------------------------------
; j1C43
;-------------------------------------------------------------------------
j1C43
        DEC a5B
        BEQ b1C48
        RTS 

b1C48   LDA #$FF
        STA a55
        LDA a58
        STA a5B
        LDA #$00
        STA a54
        STA a53
        RTS 

;-------------------------------------------------------------------------
; j1C57
;-------------------------------------------------------------------------
j1C57
        JMP j1D01

        NOP 
        BPL b1C61
        INC a56
        INC a56
b1C61   DEC a56
        LDA $D005    ;Sprite 2 Y Pos
        CMP a19
        BPL b1C70
        INC $D005    ;Sprite 2 Y Pos
        INC $D005    ;Sprite 2 Y Pos
b1C70   DEC $D005    ;Sprite 2 Y Pos
        INC a54
        LDA a54
        AND #$03
        STA a54
        TAX 
        LDA f1CAD,X
        STA a07FA
        LDA a56
        CLC 
        ASL 
        STA $D004    ;Sprite 2 X Pos
        BCC b1C96
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$04
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1C9E

b1C96   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FB
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1C9E
;-------------------------------------------------------------------------
j1C9E
        JSR s1D29
        DEC a53
        BEQ b1CA6
        RTS 

b1CA6   LDA #$00
        STA a55
        JMP j1C30

f1CAD   .BYTE $CD,$CE,$CF,$CE,$EA,$EA
;-------------------------------------------------------------------------
; j1CB3
;-------------------------------------------------------------------------
j1CB3
        STA $D015    ;Sprite display Enable
        JMP j1C43

        DEC a5A
        BEQ b1D1E
        LDA a5A
        STA a5A
        RTS 

;-------------------------------------------------------------------------
; j1CC2
;-------------------------------------------------------------------------
j1CC2
        LDA a55
        BNE b1CD2
        LDA a5C
        BNE b1CD2
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        JMP j1786

b1CD2   JMP j178B

;-------------------------------------------------------------------------
; j1CD5
;-------------------------------------------------------------------------
j1CD5
        LDA #$90
        STA a51
        JMP j1C39

;-------------------------------------------------------------------------
; j1CDC
;-------------------------------------------------------------------------
j1CDC
        DEC a51
        NOP 
        NOP 
        NOP 
        NOP 
        LDA a51
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
        JMP s1D29

;-------------------------------------------------------------------------
; j1CF4
;-------------------------------------------------------------------------
j1CF4
        STA $D015    ;Sprite display Enable
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$02
        JMP j1D25

;-------------------------------------------------------------------------
; j1D01
;-------------------------------------------------------------------------
j1D01
        LDA a51
        ADC #$57
        STA a51
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
        LDA a51
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        NOP 
        LDA #$01
        STA a5F
        JMP j1BA6

b1D1E   LDA #$03
        STA a5A
        JMP j1C57

;-------------------------------------------------------------------------
; j1D25
;-------------------------------------------------------------------------
j1D25
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        RTS 

;-------------------------------------------------------------------------
; s1D29
;-------------------------------------------------------------------------
s1D29
        LDA a3A
        BEQ b1D33
        RTS 

        CMP #$05
        BEQ b1D33
        RTS 

b1D33   LDA a18
        CLC 
        SBC a56
        STA a60
        AND #$80
        BEQ b1D44
        LDA #$FF
        SBC a60
        STA a60
b1D44   LDA a60
        CMP #$09
        BMI b1D4B
        RTS 

b1D4B   LDA a19
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        CLC 
        SBC #$03
        STA a60
        LDX #$06
b1D5B   LDA $D005    ;Sprite 2 Y Pos
        CMP a60
        BEQ b1D68
        INC a60
        DEX 
        BNE b1D5B
        RTS 

b1D68   LDA #$02
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        LDA $D015    ;Sprite display Enable
        AND #$FB
        STA $D015    ;Sprite display Enable
        LDA a55
        CMP #$01
        BNE b1D8A
        NOP 
        DEC a61
        BNE b1D8D
b1D8A   JMP j1DBE

b1D8D   LDA #$80
        JMP j1DB7

;-------------------------------------------------------------------------
; s1D92
;-------------------------------------------------------------------------
s1D92
        LDA a62
        BNE b1D97
        RTS 

b1D97   DEC a62
        LDA a62
        AND #$01
        BEQ b1DA7
        LDA #$07
        STA $D021    ;Background Color 0
        JMP j1DAC

b1DA7   LDA #$00
        STA $D021    ;Background Color 0
;-------------------------------------------------------------------------
; j1DAC
;-------------------------------------------------------------------------
j1DAC
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------------------------
; j1DB7
;-------------------------------------------------------------------------
j1DB7
        STA a62
        LDA #$00
        STA a55
        RTS 

;-------------------------------------------------------------------------
; j1DBE
;-------------------------------------------------------------------------
j1DBE
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$FF
        STA a55
        LDA #$01
        STA $D409    ;Voice 2: Pulse Waveform Width - Low-Byte
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        LDA #$01
        STA $D027    ;Sprite 0 Color
        LDA #$00
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA #$D2
        JSR s1EE3
        LDX #$00
b1DE8   STX $D020    ;Border Color
        LDY #$00
b1DED   DEY 
        BNE b1DED
        CPX #$A0
        BNE b1DF7
        INC a07F8
b1DF7   CPX #$50
        BNE b1DFE
        INC a07F8
b1DFE   DEX 
        BNE b1DE8
        JMP j1E04

;-------------------------------------------------------------------------
; j1E04
;-------------------------------------------------------------------------
j1E04
        STA a07F8
        LDA #$79
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        LDA #$00
        STA $D020    ;Border Color
        LDA #$81
        JSR s1EEC
        LDA a18
        STA a40
        STA a41
        STA a42
        STA a43
        LDA a19
        STA a44
        STA a45
        STA a46
        STA a47
;-------------------------------------------------------------------------
; j1E2D
;-------------------------------------------------------------------------
j1E2D
        LDA a40
        BEQ b1E33
        INC a40
b1E33   LDA a41
        BEQ b1E39
        INC a41
b1E39   LDA a42
        BEQ b1E3F
        DEC a42
b1E3F   LDA a43
        BEQ b1E45
        DEC a43
b1E45   LDA a44
        BEQ b1E4B
        INC a44
b1E4B   LDA a45
        BEQ b1E51
        DEC a45
b1E51   LDA a46
        BEQ b1E57
        INC a46
b1E57   LDA a47
        BEQ b1E5D
        DEC a47
b1E5D   LDY #$00
b1E5F   DEY 
        BNE b1E5F
        LDA #$D2
        STA a07F9
        STA a07FA
        STA a07FB
        LDA #$01
        STA $D028    ;Sprite 1 Color
        STA $D029    ;Sprite 2 Color
        STA $D02A    ;Sprite 3 Color
        LDA #$0F
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        STA $D015    ;Sprite display Enable
        LDX #$02
b1E85   LDA @wf0043,X
        BNE b1E90
        DEX 
        BNE b1E85
        JMP j28AC

b1E90   LDX #$04
b1E92   STX a04
        TXA 
        CLC 
        ASL 
        STA a05
        LDA @wf0043,X
        LDX a05
        STA fCFFF,X
        LDX a04
        LDA #$01
b1EA5   ASL 
        DEX 
        BNE b1EA5
        ROR 
        STA a06
        LDX a04
        LDA @wf003F,X
        CLC 
        ASL 
        LDX a05
        STA fCFFE,X
        BCC b1EC5
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA a06
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1ECF

b1EC5   LDA a06
        EOR #$FF
        AND $D010    ;Sprites 0-7 MSB of X coordinate
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1ECF
;-------------------------------------------------------------------------
j1ECF
        LDX a04
        DEX 
        CPX #$FF
        BNE b1E92
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        JMP j1EF4

;-------------------------------------------------------------------------
; s1EE3
;-------------------------------------------------------------------------
s1EE3
        STA a07F8
        LDY #$00
b1EE8   DEY 
        BNE b1EE8
        RTS 

;-------------------------------------------------------------------------
; s1EEC
;-------------------------------------------------------------------------
s1EEC
        STA $D015    ;Sprite display Enable
        LDA #$60
        STA a20
        RTS 

;-------------------------------------------------------------------------
; j1EF4
;-------------------------------------------------------------------------
j1EF4
        DEC a20
        BEQ b1EFB
        JMP j1E2D

b1EFB   JMP j1563

        ORA fD0,X
;-------------------------------------------------------------------------
; j1F00
;-------------------------------------------------------------------------
j1F00
        LDA #$00
        STA a30
        STA a31
        LDA #$CC
        STA a07F9
        LDA #$0A
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$00
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        STA a3A
        LDA #$C1
        STA a38
        LDA #<p09FF
        STA a3C
        LDA #>p09FF
        STA a3D
        LDA #$00
        STA aFF
        STA aFF
        LDA #$04
        STA a43
        LDA #$00
        STA aFF
        SEI 
        LDA #<p1AA8
        STA a0314    ;IRQ
        LDA #>p1AA8
        STA a0315    ;IRQ
        CLI 
        LDA #$10
        STA a45
        JSR s1AD5
        LDA #<p0300
        STA a47
        LDA #>p0300
        STA a48
        LDA #$00
        STA a21
        LDA #$10
        STA a5D
        STA a5E
        LDA #$03
        STA a5F
        STA a52
        LDA #$07
        STA a5B
        STA a58
        LDA #$00
        STA a55
        LDA #$D0
        STA a57
        LDA #$01
        STA $D029    ;Sprite 2 Color
        STA a5A
        LDA #$00
        STA a5C
        STA a62
        LDA #$04
        STA a61
        STA a63
        STA a65
        LDA #$00
        STA $D021    ;Background Color 0
        NOP 
        LDA #$D8
        STA a67
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA #$01
        STA a68
        LDA a69
        STA a69
        LDA #$30
        STA a6A
        LDA #$80
        STA a2B
        LDA a70
        BEQ b1FA3
        JSR s2971
b1FA3   LDA #$DD
        STA a70
        JSR s24AA
        JSR s29BB
        LDA aFD
        STA aFD
        LDA #$19
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA a95
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$4C,$00
        .BYTE $15,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA

.include "charset.asm"

f21FF=*-$01
        .BYTE $20,$20,$20,$20,$20,$1B,$23
        .BYTE $23,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$1D,$1E,$20,$20,$20
f2227   .BYTE $20,$20,$20,$20,$20,$1B,$1D,$2B
        .BYTE $2B,$1E,$23,$1C,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$1B,$23,$1C,$1B,$1F
        .BYTE $1D,$23,$1D,$2B,$2B,$1E,$20,$20
f224F   .BYTE $20,$20,$20,$1B,$23,$1D,$2B,$2B
        .BYTE $2B,$2B,$2B,$2B,$1E,$20,$20,$20
        .BYTE $20,$20,$20,$1D,$1E,$20,$20,$20
        .BYTE $20,$20,$1B,$1D,$2B,$1E,$1D,$2B
        .BYTE $2B,$2B,$2B,$2B,$2B,$2B,$1E,$20
f2277   .BYTE $20,$1F,$1F,$1D,$2B,$2B,$2B,$2B
        .BYTE $2B,$2B,$2B,$2B,$2B,$1E,$23,$1F
        .BYTE $1F,$1F,$1D,$2B,$2B,$1E,$1F,$1F
        .BYTE $1F,$1F,$1D,$2B,$2B,$2B,$2B,$2B
        .BYTE $2B,$2B,$2B,$2B,$2B,$2B,$2B,$1E
        .BYTE $1F,$13,$19,$13,$33,$32,$37,$36
        .BYTE $38
f22A8   .BYTE $FF,$0A,$08,$06,$04,$02,$01,$01
        .BYTE $01,$01,$01,$01,$01,$01,$01,$01
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20
f22C7   .BYTE $20,$07,$07,$07,$07,$07,$07,$07
f22CF   .BYTE $07,$00,$00,$00,$00,$00,$00,$00
f22D7   .BYTE $00,$07,$0B,$0F,$13,$17,$1B,$1B
f22DF   .BYTE $1C,$10,$10,$10,$10,$10,$10,$10
f22E7   .BYTE $10,$06,$06,$06,$06,$06,$06,$06
        .BYTE $06,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
f22FF   .BYTE $FF
f2300   .BYTE $04,$07,$12,$09,$07,$15,$18,$0C
        .BYTE $23,$13,$19,$04,$20,$22,$01
f230F   .BYTE $25
f2310   .BYTE $06,$06,$07,$08,$09,$0A,$07,$09
        .BYTE $09,$08,$08,$07,$09,$06,$09
f231F   .BYTE $07,$02,$D9,$DA,$D9,$FF,$FF,$FF
        .BYTE $00,$FF,$FF,$FF,$FF,$00,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FD,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$02,$03,$02,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$02,$00,$00,$00
        .BYTE $00,$00,$00,$FF,$00,$FF,$FF,$FF
        .BYTE $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FB,$FF,$04,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$18,$FF,$E7
        .BYTE $00,$FF,$00,$FF,$FF,$FF,$FF,$FF
        .BYTE $00,$FF,$FF,$FF,$FF,$00,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$01,$02,$02,$FF,$00
        .BYTE $4A,$00,$00,$00,$00,$01,$00,$07
        .BYTE $07,$00,$00,$01,$00,$00,$00,$25
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$B3
        .BYTE $00,$00,$00,$00,$00,$00,$00,$FF
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00
;-------------------------------------------------------------------------
; j2400
;-------------------------------------------------------------------------
j2400
        LDY #$08
b2402   LDA f2417,Y
        STA f22D7,Y
        LDA f241F,Y
        STA f22DF,Y
        LDA f2427,Y
        STA f22E7,Y
        JMP j2440

f2417   RTS 

        .BYTE $03,$07,$0B,$0F,$13,$17,$1B
f241F   .BYTE $1C,$10,$10,$10,$10,$10,$10,$10
f2427   .BYTE $10,$06,$06,$06,$06,$06,$06,$06
f242F   .BYTE $06,$FF,$0D,$02,$06,$0F,$09,$07
        .BYTE $07,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF
;-------------------------------------------------------------------------
; j2440
;-------------------------------------------------------------------------
j2440
        LDA #$07
        STA f22C7,Y
        DEY 
        BNE b2402
        RTS 

;-------------------------------------------------------------------------
; s2449
;-------------------------------------------------------------------------
s2449
        DEC a63
        BNE b2451
        LDA #$04
        STA a63
b2451   LDX a63
        LDA f245D,X
        LDY #$07
b2458   STA (p66),Y
        DEY 
        BNE b2458
f245D   RTS 

        .BYTE $0E,$07,$0A,$01,$EA
b2463   STY a07
b2465   LDA (p64),Y
        CLC 
        ADC #$01
        STA (p64),Y
        CMP #$3A
        BNE b2477
        LDA #$30
        STA (p64),Y
        DEY 
        BNE b2465
b2477   LDY a07
        DEX 
        BNE b2463
        RTS 

;-------------------------------------------------------------------------
; s247D
;-------------------------------------------------------------------------
s247D
        JSR s18F4
        LDY #$07
        LDX #$01
        JMP b2463

;-------------------------------------------------------------------------
; s2487
;-------------------------------------------------------------------------
s2487
        STA @wa0046
        TXA 
        PHA 
        LDA a68
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        TAX 
        LDY #$05
        JSR b2463
        LDA a68
        CMP #$40
        BEQ b24A2
        ASL 
b24A2   STA a68
        JSR s24AA
        PLA 
        TAX 
        RTS 

;-------------------------------------------------------------------------
; s24AA
;-------------------------------------------------------------------------
s24AA
        LDA #$20
        STA a0463
        STA a0464
        LDA #$30
        STA a0465
        LDY a68
b24B9   LDX #$03
b24BB   INC f0462,X
        LDA f0462,X
        CMP #$3A
        BNE b24DC
        LDA #$30
        STA f0462,X
        DEX 
        BEQ b24DC
        LDA f0462,X
        CMP #$20
        BNE b24BB
        LDA #$30
        STA f0462,X
        JMP b24BB

b24DC   DEY 
        BNE b24B9
        RTS 

;-------------------------------------------------------------------------
; j24E0
;-------------------------------------------------------------------------
j24E0
        DEC a69
        BEQ b24E7
;-------------------------------------------------------------------------
; s24E6
;-------------------------------------------------------------------------
s24E6 =*+$02
        JMP j19AB

b24E7   JMP j297E

        NOP 
        LDA @wa0095
        STA a95
        AND #$00
        BNE b24F6
        LDA a95
b24F6   RTS 

;-------------------------------------------------------------------------
; s24F7
;-------------------------------------------------------------------------
s24F7
        LDA a19
        STA $D001    ;Sprite 0 Y Pos
        LDA a18
        ASL 
        STA pD000    ;Sprite 0 X Pos
        BCC b250D
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$01
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

b250D   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FE
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        RTS 

;-------------------------------------------------------------------------
; j2516
;-------------------------------------------------------------------------
j2516
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$80
        STA a55
        LDA #$A0
        STA a18
        LDA a19
        STA a19
        JSR s27B0
        NOP 
        JSR s24F7
        LDX #$20
b2536   LDA f2579,X
        STA f07C2,X
        LDA #$01
        STA fDBC2,X
        DEX 
        BNE b2536
        LDX #$20
b2546   LDA #$00
        STA a07
        STA a08
b254C   LDA a08
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA a07
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        LDA a08
        CLC 
        ADC #$30
        STA a08
        LDA a07
        ADC #$00
        STA a07
        STA $D020    ;Border Color
        CMP #$FF
        BNE b254C
        DEX 
        BNE b2546
f2579   =*+$02
        JMP j25A5

        .BYTE $14,$12,$01,$0E,$13,$20,$13,$05
        .BYTE $03,$14,$0F,$12,$20,$08,$19,$10
        .BYTE $05,$12,$04,$12,$09,$16,$05,$20
        .BYTE $05,$0E,$07,$01,$07,$09,$0E,$07
;-------------------------------------------------------------------------
; j259A
;-------------------------------------------------------------------------
j259A
        LDA #$07
        STA $D025    ;Sprite Multi-Color Register 0
        LDA #$05
        STA $D015    ;Sprite display Enable
        RTS 

;-------------------------------------------------------------------------
; j25A5
;-------------------------------------------------------------------------
j25A5
        LDA #$00
        STA $D020    ;Border Color
        STA $D404    ;Voice 1: Control Register
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA #$00
        STA a11
        LDA #$80
        STA a20
        STA a21
        LDA #$10
        STA a23
        JSR s2715
        NOP 
        NOP 
;-------------------------------------------------------------------------
; j25C3
;-------------------------------------------------------------------------
j25C3
        JSR s25E0
        JSR s2607
        JSR s272D
        LDA $D01E    ;Sprite to Sprite Collision Detect
        BEQ b25D4
        JMP j1DBE

b25D4   LDA a18
        CMP #$40
        BEQ b25DD
        JMP j25C3

b25DD   JMP j27A8

;-------------------------------------------------------------------------
; s25E0
;-------------------------------------------------------------------------
s25E0
        DEC a20
        BEQ b25E5
        RTS 

b25E5   LDA a21
        STA a20
        LDA a18
        JSR s24F7
        JSR b1239
        LDA #$A1
        SBC a18
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        NOP 
        NOP 
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; s2607
;-------------------------------------------------------------------------
s2607
        DEC a22
        BEQ b260C
        RTS 

b260C   LDA a23
        STA a22
        DEC a24
        BEQ b2615
        RTS 

b2615   LDA a25
        STA a24
        JSR j11CB
        DEC a18
        DEC a25
        JMP s24F7

;-------------------------------------------------------------------------
; j2623
;-------------------------------------------------------------------------
j2623
        LDA #$60
        STA a24
        STA a25
        LDA #$10
        STA a22
        RTS 

;-------------------------------------------------------------------------
; j262E
;-------------------------------------------------------------------------
j262E
        LDA #$01
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA a18
        CMP #$E0
        BEQ b265D
        LDA #$01
        STA a25
        LDA a18
        STA $D025    ;Sprite Multi-Color Register 0
        ADC #$08
        STA $D026    ;Sprite Multi-Color Register 1
        LDA $D012    ;Raster Position
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
        JSR s2660
        JMP j27A8

b265D   JMP j266E

;-------------------------------------------------------------------------
; s2660
;-------------------------------------------------------------------------
s2660
        LDA a22
        CMP #$01
        BNE b2668
        DEC a18
b2668   JSR j11CB
        JMP s2607

;-------------------------------------------------------------------------
; j266E
;-------------------------------------------------------------------------
j266E
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDY #$20
        LDX #$00
b2677   TXA 
        AND #$01
        STA $D020    ;Border Color
        EOR #$01
        STA $D021    ;Background Color 0
        JSR s26A3
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        DEX 
        BNE b2677
        NOP 
        NOP 
        NOP 
        LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        JMP j2E8C

;-------------------------------------------------------------------------
; s26A3
;-------------------------------------------------------------------------
s26A3
        TXA 
        PHA 
        JSR j11CB
        PLA 
        TAX 
        LDA $D012    ;Raster Position
        RTS 

;-------------------------------------------------------------------------
; j26AE
;-------------------------------------------------------------------------
j26AE
        LDA #$78
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDX #$20
        LDA #$20
b26BA   STA f07C2,X
        DEX 
        BNE b26BA
        LDA #$0E
        STA $D026    ;Sprite Multi-Color Register 1
        LDA #$00
        STA a20
        STA a21
b26CB   LDA a20
        STA a18
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        ADC #$80
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        JSR s2704
        INC a20
        LDA a20
        CMP #$A0
        BNE b26CB
        INC a21
        LDA a21
        CMP #$A0
        BEQ b2701
        LDA a21
        STA a20
        JMP b26CB

b2701   JMP j270A

;-------------------------------------------------------------------------
; s2704
;-------------------------------------------------------------------------
s2704
        INC $D025    ;Sprite Multi-Color Register 0
        JMP s24F7

;-------------------------------------------------------------------------
; j270A
;-------------------------------------------------------------------------
j270A
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        JMP j298B

;-------------------------------------------------------------------------
; s2715
;-------------------------------------------------------------------------
s2715
        LDA #$F0
        STA a40
        LDA #$04
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA a6A
        STA a2F
        LDA #$07
        STA a2E
        LDA #$07
        STA a3D
        JMP j2623

;-------------------------------------------------------------------------
; s272D
;-------------------------------------------------------------------------
s272D
        DEC a2F
        BEQ b2732
        RTS 

b2732   LDA a6A
        STA a2F
        LDA a40
        CMP #$F0
        BNE b274F
        LDA a19
        SBC #$10
        STA $D005    ;Sprite 2 Y Pos
        LDA $D012    ;Raster Position
        AND #$1F
        CLC 
        ADC $D005    ;Sprite 2 Y Pos
        STA $D005    ;Sprite 2 Y Pos
b274F   INC a40
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        LDA a40
        ASL 
        STA $D004    ;Sprite 2 X Pos
        BCC b276C
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$04
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j2774

b276C   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FB
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j2774
;-------------------------------------------------------------------------
j2774
        LDX a2E
        LDA f278D,X
        STA a07FA
        DEC a3D
        BEQ b2795
b2780   RTS 

;-------------------------------------------------------------------------
; j2781
;-------------------------------------------------------------------------
j2781
        LDA #$07
        STA a3D
        DEC a2E
        BNE b2780
        LDA #$07
        STA a2E
f278D   RTS 

        .BYTE $DB,$DC,$DD,$DE,$DD,$DC,$DB
b2795   LDA $D005    ;Sprite 2 Y Pos
        CMP a19
        BPL b27A2
        INC $D005    ;Sprite 2 Y Pos
        INC $D005    ;Sprite 2 Y Pos
b27A2   DEC $D005    ;Sprite 2 Y Pos
        JMP j2781

;-------------------------------------------------------------------------
; j27A8
;-------------------------------------------------------------------------
j27A8
        LDA #$01
        STA $D015    ;Sprite display Enable
        JMP j262E

;-------------------------------------------------------------------------
; s27B0
;-------------------------------------------------------------------------
s27B0
        STA $D015    ;Sprite display Enable
        LDA #$CA
        STA a16
        STA a07F8
        JMP j259A

        DEC a6B
        BEQ s27C2
        RTS 

;-------------------------------------------------------------------------
; s27C2
;-------------------------------------------------------------------------
s27C2
        LDA a2B
        STA a28
        DEC a2E
        RTS 

;-------------------------------------------------------------------------
; s27C9
;-------------------------------------------------------------------------
s27C9
        STA a56
        LDA a18
        CLC 
        ROR 
        STA a07
        LDA a56
        CLC 
        ROR 
        CMP a07
        RTS 

;-------------------------------------------------------------------------
; j27D8
;-------------------------------------------------------------------------
j27D8
        LDA a6D
        CLC 
        ADC #$00
        STA a6D
        NOP 
        LDA a6E
        STA a6E
        LDA a6F
        STA a6F
        STA a38F3
        LDA #$00
        STA a38F1
        STA a38F2
        JSR s2939
        LDX #$30
b27F8   LDA f22C7,X
        STA f38C0,X
        DEX 
        BNE b27F8
        NOP 
        NOP 
        NOP 
        JMP j1400

;-------------------------------------------------------------------------
; j2807
;-------------------------------------------------------------------------
j2807
        LDA a6E
        CMP #$02
        BEQ b281A
        LDA a6C
        BEQ b281A
        DEC a6C
        LDA #$02
        STA a6E
        JMP j282B

b281A   DEC a6D
        JMP j2827

        JMP (p05D0)

;-------------------------------------------------------------------------
; j2822
;-------------------------------------------------------------------------
j2822
        JMP j2822

        DEC a6D
;-------------------------------------------------------------------------
; j2827
;-------------------------------------------------------------------------
j2827
        LDA #$01
        STA a6E
;-------------------------------------------------------------------------
; j282B
;-------------------------------------------------------------------------
j282B
        LDA #>f38C0
        STA a08
        LDA #<f38C0
        STA a07
        LDA a6E
        CMP #$01
        BNE b283B
        INC a08
b283B   LDY #$30
b283D   LDA f22C7,Y
        STA (p07),Y
        DEY 
        BNE b283D
        LDY #$31
        LDA a3E
        STA (p07),Y
        INY 
        LDA a3F
        STA (p07),Y
        INY 
        LDA a6F
        STA (p07),Y
        JSR s28A0
        LDA a6E
        CMP #$02
        BEQ b286B
        LDA #$38
        STA a08
        LDA #$4F
        STA a64
        STA a66
        JMP j2875

b286B   LDA #$39
        STA a08
        LDA #$70
        STA a64
        STA a66
;-------------------------------------------------------------------------
; j2875
;-------------------------------------------------------------------------
j2875
        LDY #$30
b2877   LDA (p07),Y
        STA f22C7,Y
        DEY 
        BNE b2877
        LDY #$31
        LDA (p07),Y
        STA a3E
        INY 
        LDA (p07),Y
        STA a3F
        INY 
        LDA (p07),Y
        STA a6F
        JSR s28A6
;-------------------------------------------------------------------------
; j2892
;-------------------------------------------------------------------------
j2892
        JSR s28B6
        RTS 

;-------------------------------------------------------------------------
; j2896
;-------------------------------------------------------------------------
j2896
        LDA #$06
        STA a69
        STA a38F4
        JMP j2400

;-------------------------------------------------------------------------
; s28A0
;-------------------------------------------------------------------------
s28A0
        INY 
        LDA a69
        STA (p07),Y
        RTS 

;-------------------------------------------------------------------------
; s28A6
;-------------------------------------------------------------------------
s28A6
        INY 
        LDA (p07),Y
        STA a69
        RTS 

;-------------------------------------------------------------------------
; j28AC
;-------------------------------------------------------------------------
j28AC
        LDX #$F6
        TXS 
        NOP 
        NOP 
        NOP 
        NOP 
        JMP j1400

;-------------------------------------------------------------------------
; s28B6
;-------------------------------------------------------------------------
s28B6
        LDX #$07
        LDA #$01
b28BA   STA fD84F,X
        STA fD870,X
        DEX 
        BNE b28BA
        LDX #$28
        LDA #$20
b28C7   STA f049F,X
        DEX 
        BNE b28C7
        LDX #$0B
b28CF   LDA f2926,X
        STA f04AB,X
        LDA #$0E
        STA fD8AB,X
        DEX 
        BNE b28CF
        LDX #$0D
        LDA a6E
        CMP #$02
        BNE b28E7
        LDX #$10
b28E7   LDY #$03
b28E9   LDA f2926,X
        STA f04B8,Y
        LDA #$07
        STA fD8B8,Y
        INX 
        DEY 
        BNE b28E9
        LDA #$F0
        STA a07
b28FC   LDX a07
b28FE   STX $D401    ;Voice 1: Frequency Control - High-Byte
        LDY #$10
b2903   STA $D400    ;Voice 1: Frequency Control - Low-Byte
        DEY 
        BNE b2903
        STY $D404    ;Voice 1: Control Register
        LDA #$11
        STA $D404    ;Voice 1: Control Register
        DEX 
        BNE b28FE
        DEC a07
        BNE b28FC
        LDX #$28
        LDA #$20
b291C   STA f049F,X
        DEX 
        BNE b291C
        LDX #$06
f2926   =*+$02
        JMP j2940

        .BYTE $10,$0C,$01,$19,$20,$10,$0C,$01
        .BYTE $19,$05,$12,$20,$05,$0E,$0F,$0F
        .BYTE $17,$14
;-------------------------------------------------------------------------
; s2939
;-------------------------------------------------------------------------
s2939
        STA a3E
        STA a3F
        JMP j2E84

;-------------------------------------------------------------------------
; j2940
;-------------------------------------------------------------------------
j2940
        LDX #$06
b2942   LDA f22E7,X
        CMP #$FF
        BEQ b295E
        JSR s2962
        NOP 
        STA a03
        LDA #<p0124
        STA a04
        LDA #>p0124
        STA a05
        STX a2C
        JSR s1177
        LDX a2C
b295E   DEX 
        BNE b2942
        RTS 

;-------------------------------------------------------------------------
; s2962
;-------------------------------------------------------------------------
s2962
        LDA f22D7,X
        STA a02
        LDA #$04
        RTS 

;-------------------------------------------------------------------------
; j296A
;-------------------------------------------------------------------------
j296A
        LDA #$DD
        STA a70
        JMP j2896

;-------------------------------------------------------------------------
; s2971
;-------------------------------------------------------------------------
s2971
        LDA #$20
        LDX #$50
b2975   STA f0797,X
        DEX 
        BNE b2975
        JMP j2AF0

;-------------------------------------------------------------------------
; j297E
;-------------------------------------------------------------------------
j297E
        INC a6F
        LDA a6F
        CMP #$20
        BNE b2988
        DEC a6F
b2988   JMP j2995

;-------------------------------------------------------------------------
; j298B
;-------------------------------------------------------------------------
j298B
        LDX #$F6
        TXS 
        LDA #$00
        STA a70
        JMP j29A4

;-------------------------------------------------------------------------
; j2995
;-------------------------------------------------------------------------
j2995
        JSR j2400
        LDA #$00
        STA a3E
        STA a3F
        JSR j2940
        JMP j29B4

;-------------------------------------------------------------------------
; j29A4
;-------------------------------------------------------------------------
j29A4
        LDA #$00
        STA a3E
        STA a3F
        NOP 
        NOP 
        NOP 
        LDA #$00
        STA a70
        JMP j1400

;-------------------------------------------------------------------------
; j29B4
;-------------------------------------------------------------------------
j29B4
        LDA #$06
        STA a69
        JMP j2516

;-------------------------------------------------------------------------
; s29BB
;-------------------------------------------------------------------------
s29BB
        LDX a6F
        LDA f2A50,X
        STA a2B
        LDA f2A70,X
        STA a5D
        STA a5E
        LDA f2A90,X
        STA a5F
        STA a52
        LDA f2AB0,X
        STA a6A
        LDA f2AD0,X
        STA a5B
        STA a58
        LDX #$28
b29DE   LDA f29EE,X
        STA f0797,X
        LDA #$07
        STA fDB97,X
        DEX 
        BNE b29DE
f29EE   =*+$02
        JMP j2A17

        .BYTE $0A,$05,$14,$13,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $13,$05,$03,$14,$0F,$12,$20,$30
        .BYTE $30,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$0A,$05,$14,$13,$20,$20
;-------------------------------------------------------------------------
; j2A17
;-------------------------------------------------------------------------
j2A17
        .BYTE $A5,$6C,$18,$69,$30,$8D,$9D,$07
        .BYTE $A5,$6D,$18,$69,$30,$8D,$BF,$07
        .BYTE $A9,$04,$8D,$9D,$DB,$8D,$BF,$DB
        .BYTE $A6,$6F,$EE,$B0,$07,$AD,$B0,$07
        .BYTE $C9,$3A,$D0,$08,$A9,$30,$8D,$B0
        .BYTE $07,$EE,$AF,$07,$CA,$D0,$EB,$A9
        .BYTE $03,$8D,$B0,$DB,$8D,$AF,$DB,$60
        .BYTE $EA
f2A50   .BYTE $80,$80,$70,$60,$50,$80,$70,$60
        .BYTE $50,$70,$70,$70,$70,$60,$60,$60
        .BYTE $60,$60,$5A,$58,$58,$58,$58,$58
        .BYTE $58,$56,$54,$52,$50,$4E,$4C,$4A
f2A70   .BYTE $10,$10,$0E,$0C,$0A,$10,$0E,$0C
        .BYTE $0A,$0E,$0E,$0E,$0E,$0C,$0C,$0C
        .BYTE $0C,$0A,$0A,$0A,$0A,$09,$09,$09
        .BYTE $09,$08,$08,$08,$08,$08,$08,$08
f2A90   .BYTE $03,$03,$03,$03,$03,$02,$02,$02
        .BYTE $02,$01,$01,$01,$01,$03,$03,$03
        .BYTE $03,$02,$02,$02,$02,$01,$01,$01
        .BYTE $01,$01,$01,$01,$01,$01,$01,$01
f2AB0   .BYTE $40,$40,$3E,$38,$36,$34,$32,$30
        .BYTE $2E,$2D,$2C,$2B,$2A,$29,$28,$27
        .BYTE $26,$26,$25,$25,$24,$24,$23,$23
        .BYTE $22,$22,$21,$21,$20,$20,$20,$20
f2AD0   .BYTE $07,$07,$07,$07,$07,$07,$07,$07
        .BYTE $07,$06,$06,$06,$05,$04,$03,$03
        .BYTE $03,$03,$03,$03,$02,$02,$01,$03
        .BYTE $03,$02,$02,$01,$01,$01,$01,$01
;-------------------------------------------------------------------------
; j2AF0
;-------------------------------------------------------------------------
j2AF0
        LDA a6C
        BEQ b2AFB
        LDA a6D
        BEQ b2AFB
        JMP j2807

b2AFB   LDA a6C
        CMP a6D
        BNE b2B04
b2B01   JMP j2DF8

b2B04   LDA a6E
        CMP #$02
        BEQ b2B0E
        DEC a6C
        INC a6D
b2B0E   DEC a6D
        LDA a6C
        CMP a6D
        BEQ b2B01
        JMP j2892

;-------------------------------------------------------------------------
; s2B19
;-------------------------------------------------------------------------
s2B19
        LDA @wa0095
        STA a95
        LDA a3A
        BEQ b2B23
b2B22   RTS 

b2B23   LDA @wa0095
        AND #$02
        BNE b2B22
        LDA a95
        AND #$04
        BNE b2B22
        LDA aFD
        BEQ b2B22
        LDA a95
        AND #$01
        BEQ b2B22
        JMP j1DBE

;-------------------------------------------------------------------------
; s2B3D
;-------------------------------------------------------------------------
s2B3D
        LDX #$00
b2B3F   LDA #$20
        STA f04F0,X
        STA f0500,X
        STA f0600,X
        STA f0700,X
        LDA #$01
        STA fD800,X
        STA fD900,X
        STA fDA00,X
        STA fDB00,X
        DEX 
        BNE b2B3F
        RTS 

;-------------------------------------------------------------------------
; s2B5F
;-------------------------------------------------------------------------
s2B5F
        JSR s2B3D
        LDX #$14
b2B64   LDA f2B6F,X
        STA f0549,X
        DEX 
        BNE b2B64
f2B6F   =*+$02
        JMP j2B84

        .BYTE $0A,$05,$06,$06,$20,$0D,$09,$0E
        .BYTE $14,$05,$12,$20,$10,$12,$05,$13
        .BYTE $05,$0E,$14,$13
;-------------------------------------------------------------------------
; j2B84
;-------------------------------------------------------------------------
j2B84
        LDA #$00
        STA $D015    ;Sprite display Enable
        LDA #$0F
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA #$00
        STA $D01C    ;Sprites Multi-Color Mode Select
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        LDA #$40
        STA a55
        LDA #$07
        STA $D027    ;Sprite 0 Color
        STA $D028    ;Sprite 1 Color
        STA $D029    ;Sprite 2 Color
        STA $D02A    ;Sprite 3 Color
        LDA #$00
        STA $D001    ;Sprite 0 Y Pos
        STA $D003    ;Sprite 1 Y Pos
        STA $D005    ;Sprite 2 Y Pos
        STA $D007    ;Sprite 3 Y Pos
        LDA #$94
        STA pD000    ;Sprite 0 X Pos
        STA $D004    ;Sprite 2 X Pos
        LDA #$C0
        STA $D002    ;Sprite 1 X Pos
        STA $D006    ;Sprite 3 X Pos
        LDA #<pE0DF
        STA a07F8
        LDA #>pE0DF
        STA a07F9
        LDA #<pE2E1
        STA a07FA
        LDA #>pE2E1
        STA a07FB
        LDA #$0F
        STA $D015    ;Sprite display Enable
b2BE2   LDY #$10
b2BE4   LDX #$00
b2BE6   DEX 
        BNE b2BE6
        DEY 
        BNE b2BE4
        INC $D001    ;Sprite 0 Y Pos
        INC $D003    ;Sprite 1 Y Pos
        DEC $D005    ;Sprite 2 Y Pos
        DEC $D007    ;Sprite 3 Y Pos
        LDA $D001    ;Sprite 0 Y Pos
        CMP $D005    ;Sprite 2 Y Pos
        BNE b2BE2
        LDX #$20
b2C02   LDA f2C4F,X
        STA f065C,X
        LDA f2C8F,X
        STA f06AC,X
        LDA f2C2F,X
        STA f06FC,X
        LDA f2C6F,X
        STA f074C,X
        LDA f2CAF,X
        STA f079C,X
        DEX 
        BNE b2C02
        LDA #$01
        STA a07
        LDA #$00
        STA aFD
        JMP j2CD8

        .BYTE $EA
f2C2F   .BYTE $EA,$10,$0C,$01,$19,$05,$12,$13
        .BYTE $3A,$20,$31,$20,$20,$20,$13,$14
        .BYTE $01,$12,$14,$20,$01,$14,$20,$13
        .BYTE $05,$03,$14,$0F,$12,$3A,$20,$30
f2C4F   .BYTE $31,$20,$20,$01,$14,$14,$01,$03
        .BYTE $0B,$20,$0F,$06,$20,$14,$08,$05
        .BYTE $20,$0D,$15,$14,$01,$0E,$14,$20
        .BYTE $03,$01,$0D,$05,$0C,$13,$20,$20
f2C6F   .BYTE $20,$20,$03,$0F,$0C,$0C,$09,$13
        .BYTE $09,$0F,$0E,$13,$20,$17,$09,$14
        .BYTE $08,$20,$03,$01,$0D,$05,$0C,$13
        .BYTE $3A,$20,$20,$20,$0E,$0F,$20,$20
f2C8F   .BYTE $20,$20,$06,$12,$0F,$0D,$20,$14
        .BYTE $08,$05,$20,$03,$12,$05,$01,$14
        .BYTE $0F,$12,$20,$0F,$06,$20,$07,$12
        .BYTE $09,$04,$12,$15,$0E,$0E,$05,$12
f2CAF   .BYTE $20,$20,$20,$10,$12,$05,$13,$13
        .BYTE $20,$06,$09,$12,$05,$20,$14,$0F
        .BYTE $20,$13,$14,$01,$12,$14,$20,$14
        .BYTE $08,$05,$20,$07,$01,$0D,$05,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20
;-------------------------------------------------------------------------
; j2CD8
;-------------------------------------------------------------------------
j2CD8
        LDA aC5
        CMP #$04
        BNE b2CE1
        JMP j2D00

b2CE1   CMP #$05
        BNE b2CE8
        JMP j2D18

b2CE8   CMP #$06
        BNE b2CEF
        JMP j2D4B

b2CEF   LDA aDC11
        CMP #$EF
        BNE b2CF9
        JMP j2DB6

b2CF9   NOP 
        NOP 
        NOP 
        JMP j2CD8

        NOP 
;-------------------------------------------------------------------------
; j2D00
;-------------------------------------------------------------------------
j2D00
        INC a0706
        LDA a0706
        CMP #$33
        BNE b2D0C
        LDA #$31
b2D0C   STA a0706
b2D0F   LDA aC5
        CMP #$40
        BNE b2D0F
        JMP b2CEF

;-------------------------------------------------------------------------
; j2D18
;-------------------------------------------------------------------------
j2D18
        INC a07
        LDA a07
        CMP #$20
        BEQ b2D44
        NOP 
        NOP 
;-------------------------------------------------------------------------
; j2D22
;-------------------------------------------------------------------------
j2D22
        LDA #$30
        STA a071B
        STA a071C
        LDX a07
b2D2C   INC a071C
        LDA a071C
        CMP #$3A
        BNE b2D3E
        LDA #$30
        STA a071C
        INC a071B
b2D3E   DEX 
        BNE b2D2C
        JMP b2D0F

b2D44   LDA #$01
        STA a07
        JMP j2D22

;-------------------------------------------------------------------------
; j2D4B
;-------------------------------------------------------------------------
j2D4B
        LDA a0767
        CMP #$20
        BEQ b2D64
        LDA #<p0E20
        STA a0767
        LDA #>p0E20
        STA a0768
        LDA #$0F
        STA a0769
        JMP b2D0F

b2D64   LDA #<p0519
        STA a0767
        LDA #>p0519
        STA a0768
        LDA #$13
        STA a0769
        JMP b2D0F

;-------------------------------------------------------------------------
; j2D76
;-------------------------------------------------------------------------
j2D76
        LDA #$05
        STA a6C
        STA a6D
        JSR s2DA1
        JMP j2D87

        .BYTE $04,$A9,$00,$85,$6D
;-------------------------------------------------------------------------
; j2D87
;-------------------------------------------------------------------------
j2D87
        LDA a07
        STA a6F
        LDA #$00
        STA aFD
        LDA a0767
        CMP #$20
        BEQ b2D9A
        LDA #$FF
        STA aFD
b2D9A   JSR s2B3D
        JSR s1020
        RTS 

;-------------------------------------------------------------------------
; s2DA1
;-------------------------------------------------------------------------
s2DA1
        LDA #<p0206
        STA a6D
        LDA #>p0206
        STA a6E
        LDA a0706
        CMP #$31
        BEQ b2DB1
        RTS 

b2DB1   LDA #$01
        STA a6D
        RTS 

;-------------------------------------------------------------------------
; j2DB6
;-------------------------------------------------------------------------
j2DB6
        LDX #$10
b2DB8   LDA #$00
        STA fCFFF,X
        DEX 
        BNE b2DB8
        LDA #$00
        STA $D015    ;Sprite display Enable
        JMP j2D76

;-------------------------------------------------------------------------
; s2DC8
;-------------------------------------------------------------------------
s2DC8
        DEC aFE
        BEQ b2DCD
        RTS 

b2DCD   LDA #$20
        STA aFE
        LDA $D01E    ;Sprite to Sprite Collision Detect
        STA a95
        RTS 

;-------------------------------------------------------------------------
; s2DD7
;-------------------------------------------------------------------------
s2DD7
        LDY #$01
b2DD9   LDA (p05),Y
        CMP f1077,Y
        BEQ b2DE4
        BPL b2DEA
        BNE b2DE9
b2DE4   INY 
        CPY #$08
        BNE b2DD9
b2DE9   RTS 

b2DEA   LDY #$01
b2DEC   LDA (p05),Y
        STA f1077,Y
        STA f0412,Y
        JMP j2E0D

        RTS 

;-------------------------------------------------------------------------
; j2DF8
;-------------------------------------------------------------------------
j2DF8
        LDA #>p044F
        STA a06
        LDA #<p044F
        STA a05
        JSR s2DD7
        LDA #$70
        STA a05
        JSR s2DD7
        JMP j1016

;-------------------------------------------------------------------------
; j2E0D
;-------------------------------------------------------------------------
j2E0D
        INY 
        CPY #$08
        BNE b2DEC
        RTS 

;-------------------------------------------------------------------------
; s2E13
;-------------------------------------------------------------------------
s2E13
        LDA a04C6
        CMP #$24
        BEQ b2E1B
        RTS 

b2E1B   LDA a6E
        CMP #$02
        BEQ b2E28
        LDA #$01
        STA a6C
        JMP j2E2C

b2E28   LDA #$01
        STA a6D
;-------------------------------------------------------------------------
; j2E2C
;-------------------------------------------------------------------------
j2E2C
        LDX #$1A
b2E2E   LDA f2E5E,X
        STA f07C5,X
        LDA #$03
        STA fDBC5,X
        DEX 
        BNE b2E2E
        LDY #$00
b2E3E   LDX #$00
b2E40   STX $D020    ;Border Color
        STX $D021    ;Background Color 0
        STX $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        DEX 
        BNE b2E40
        DEY 
        BNE b2E3E
        NOP 
        NOP 
        NOP 
f2E5E   =*+$02
        JMP j2E79

        .BYTE $13,$05,$03,$14,$0F,$12,$20,$04
        .BYTE $05,$06,$05,$0E,$03,$05,$13,$20
        .BYTE $10,$05,$0E,$05,$14,$12,$01,$14
        .BYTE $05,$04
;-------------------------------------------------------------------------
; j2E79
;-------------------------------------------------------------------------
j2E79
        LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        JMP j1DBE

;-------------------------------------------------------------------------
; j2E84
;-------------------------------------------------------------------------
j2E84
        LDA #$8A
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JMP j296A

;-------------------------------------------------------------------------
; j2E8C
;-------------------------------------------------------------------------
j2E8C
        LDA #$70
        STA a19
        JMP j26AE

;-------------------------------------------------------------------------
; s2E93
;-------------------------------------------------------------------------
s2E93
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$00
        STA a95
b2E9A   RTS 

b2E9B   LDA aC5
        CMP #$04
        BNE b2E9A
        LDA #$01
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
b2EA9   LDA aC5
        CMP #$40
        BNE b2EA9
b2EAF   LDA aC5
        CMP #$04
        BNE b2EAF
        LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
b2EBD   LDA aC5
        CMP #$40
        BNE b2EBD
        RTS 

;-------------------------------------------------------------------------
; s2EC4
;-------------------------------------------------------------------------
s2EC4
        LDA a028D
        CMP #$02
        BEQ b2E9B
        RTS 

        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA
.include "sprites.asm"
