;
; **** ZP ABSOLUTE ADRESSES **** 
;
a03 = $03
BOOT = $09
DOSINI = $0C
a0D = $0D
a40 = $40
ATRACT = $4D
aC0 = $C0
aC1 = $C1
shipSpeed = $C2
scrollingOffset = $C3
aC4 = $C4
aC5 = $C5
aC6 = $C6
aC7 = $C7
aC8 = $C8
aC9 = $C9
currentXPosition = $CA
currentYPosition = $CB
scrollDirection = $CC
aCD = $CD
shipDirection = $CE
scrollingPyraimdsLoPtr = $D0
scrollingPyramidsHiPtr = $D1
FR0 = $D4
aD5 = $D5
aD6 = $D6
bulletFireRate = $D7
bulletXPosition = $D8
bulletYPosition = $D9
FR3 = $DA
bulletDirection = $DB
aaDC = $DC
aDD = $DD
aDE = $DE
aDF = $DF
FR1 = $E0
camelSpeed = $E1
aE2 = $E2
aE3 = $E3
aE4 = $E4
aE5 = $E5
FR2 = $E6
aE7 = $E7
aE8 = $E8
currentCamalRadarSpeed = $E9
aEA = $EA
aEB = $EB
FPCOC = $EC
FPTEM1 = $ED
FPTEM2 = $EE
aEF = $EF
aF0 = $F0
updatedXPosition = $F1
CIX = $F2
INBUFF = $F3
aF4 = $F4
aF5 = $F5
aF6 = $F6
aF7 = $F7
aF8 = $F8
aF9 = $F9
currentPlayerOffset = $FA
DEGFLG = $FB
FLPTR = $FC
aFD = $FD
FPTR2 = $FE
aFF = $FF
;
; **** ZP POINTERS **** 
;
CASINI = $02
;
; **** FIELDS **** 
;
f3AFF = $3AFF
yPositionArray = $3B00

; Sprites are defined and vertically positioned by using a
; a 256 byte region of memory. The base position for this is
; defined as spriteData ($3800) and Player 0 (our ship) is
; located at a $400 offset from that base, giving $3C00. 
; The position of the bytes defining the sprite in the 
; 256 byte range is what defines its vertical position.
; So for example here is the ship's memory map when the
; ship is near the top of the screen.:
; 
; 3C00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C20: 00 00 00 00 00 00 00 00 C3 00 81 81 00 C3 00 00 
; 3C30: 00 00 00 00 00 00 00 01 03 1F 3F 00 3C 00 00 00 
; 3C40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CA0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CB0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CC0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CD0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CE0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CF0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
;
; And here it is when the ship is at the bottom of the
; screen:
;
; 3C00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C20: 00 00 00 00 00 00 00 00 C3 00 81 81 00 C3 00 00 
; 3C30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3C90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CA0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CB0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CC0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CD0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
; 3CE0: 00 00 00 00 00 00 00 01 03 1F 3F 00 3C 00 00 00 
; 3CF0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
;
; You can hopefully see that '01 03 1F 3F 00 3C', which
; are the bytes that define the appearance of the ship,
; have moved position. See shipFacingLeftSpriteDefinition
; for where these bytes are defined.
;
; See https://atariwiki.org/wiki/Wiki.jsp?page=Pm-memory-map
; for a full memory map of the offsets used.
missileMemory = $3B00
shipSpriteMemory = $3C00
camelSpriteMemory1 = $3D00
camelSpriteMemory2 = $3E00
camelSpriteMemory3 = $3F00
;
; **** ABSOLUTE ADRESSES **** 
;
a5886 = $5886
a5889 = $5889
;
; **** POINTERS **** 
;
p00 = $0000
p04D0 = $04D0
p7F00 = $7F00
pA080 = $A080
pBE01 = $BE01
pE0C0 = $E0C0
pE700 = $E700
;
; **** PREDEFINED LABELS **** 
;
DOSVEC = $000A
VDSLST = $0200
SDMCTL = $022F
SDLSTL = $0230
SDLSTH = $0231
SSKCTL = $0232
COLDST = $0244
GPRIOR = $026F
STICK0 = $0278
STRIG0 = $0284
PCOLR0 = $02C0
PCOLR1 = $02C1
PCOLR2 = $02C2
PCOLR3 = $02C3
COLOR0 = $02C4
COLOR1 = $02C5
COLOR2 = $02C6
COLOR3 = $02C7
COLOR4 = $02C8
CHBAS = $02F4
SETBV = $E45C
XITBV = $E462
WARMSV = $E474

*=$02E0
.addr b387D

*=$0FE1
f0FE1   .BYTE <f30E1,>f30E1,<f0FE1,>f0FE1,<LaunchGame,>LaunchGame
;-------------------------------------------------------------------------
; SomeKindOfSetup
;-------------------------------------------------------------------------
SomeKindOfSetup
        LDA #$3C
        STA $D302    ;PACTL
        LDA #$02
        STA BOOT     ;BOOT?   boot flag; 0 if none, 1 for disk, 2 for cassette
        LDA #$00
        STA COLDST   ;COLDST  cold start flag
        LDA DOSINI   ;DOSINI  
        STA CASINI   ;CASINI  cassette initialization vector
        LDA a0D
        STA a03
        JMP (DOSINI) ;DOSINI  

;-------------------------------------------------------------------------
; gameScreenDisplayList
; https://www.atariarchives.org/mapping/appendix8.php
;-------------------------------------------------------------------------
gameScreenDisplayList
        ; 70 - 8 blank lines
        .BYTE $70,$70

        ; + 40 - 'Load Memory Scan'
        ; +  2 - Text mode with 8 scan lines and 40 bytes per line
        ; = 42
        .BYTE $42,<scoreLine,>scoreLine
        .BYTE $42,<bannerLine2,>bannerLine2

        ;   80 - Enable a 'Display List Interrupt'
        ; + 40 - 'Load Memory Scan'
        ; +  2 - Text mode with 8 scan lines and 40 bytes per line
        ; = C2
        .BYTE $C2,<radarLine,>radarLine

        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine
        .BYTE $C2,<messageLine,>messageLine

        ; The scrolling pyramids.
        ;   80 - Enable a 'Display List Interrupt'
        ; + 40 - 'Load Memory Scan'
        ; + 10 - Horizontal Scroll
        ; +  4 - Text mode with 8 scan lines and 40 bytes per line
        ; = D4
scrollingPyramidsDisplayLists   
        .BYTE $D4
a102A   .BYTE <pyramidsLine1
a102B   .BYTE >pyramidsLine1
        .BYTE $D4
a102D   .BYTE <pyramidsLine2
a102E   .BYTE >pyramidsLine2
        .BYTE $D4
a1030   .BYTE <pyramidsLine3
a1031   .BYTE >pyramidsLine3
        .BYTE $D4
a1033   .BYTE <pyramidsLine4
a1034   .BYTE >pyramidsLine4
        .BYTE $D4
a1036   .BYTE <pyramidsLine5
a1037   .BYTE >pyramidsLine5

        ;  40 - 'Load Memory Scan'
        ;+  4 - Text mode with 8 scan lines and 40 bytes per line
        ;= 44
        .BYTE $44,<rollingHorizonLine1,>rollingHorizonLine1
        .BYTE $44,<rollingHorizonLine2,>rollingHorizonLine2
        .BYTE $44,<rollingHorizonLine3,>rollingHorizonLine3
        .BYTE $44,<rollingHorizonLine4,>rollingHorizonLine4
        .BYTE $44,<rollingHorizonLine5,>rollingHorizonLine5
        .BYTE $44,<rollingHorizonLine6,>rollingHorizonLine6

        ; 41 = Jump to following address and wait for VBlank.
        .BYTE $41,<p5000,>p5000

p5000 = $5000

scoreLine
.enc "atascii" 
score1Label   
        .TEXT '     '
titleScreenScoreLine
        .TEXT' SCORE 1'
currentScore1   
        .TEXT ':0000000 '
        .BYTE $44
        .TEXT ':'
camelsLeftText   
        .TEXT '0000  SCORE 2'
currentScore2   
        .TEXT ':0000000'
.enc "none"

        .BYTE $00,$00,$00,$00,$00,$00
radarLine   
        .BYTE $45,$45,$45,$45,$45,$45,$44,$45
        .BYTE $45,$45,$44,$45,$45,$45,$44,$45
        .BYTE $45,$45,$44,$45,$45,$45,$44,$45
        .BYTE $45,$45,$44,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$40,$41,$45,$45
pyramidsLine1   
        .BYTE $45,$45,$45,$45,$40,$41,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $40,$41,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
pyramidsLine2   
        .BYTE $45,$45,$45,$47,$43,$46,$41,$45
        .BYTE $45,$40,$41,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$47
        .BYTE $43,$46,$41,$45,$45,$40,$41,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
pyramidsLine3   
        .BYTE $45,$45,$47,$42,$46,$46,$46,$41
        .BYTE $47,$43,$46,$41,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$40,$41,$45,$45
        .BYTE $40,$41,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$47,$42
        .BYTE $46,$46,$46,$41,$47,$43,$46,$41
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $40,$41,$45,$45,$40,$41,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
pyramidsLine4   
        .BYTE $45,$47,$48,$43,$46,$46,$46,$46
        .BYTE $49,$46,$46,$46,$41,$45,$45,$45
        .BYTE $45,$45,$45,$47,$43,$46,$41,$47
        .BYTE $43,$46,$41,$45,$45,$40,$41,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$47,$48,$43
        .BYTE $46,$46,$46,$46,$49,$46,$46,$46
        .BYTE $41,$45,$45,$45,$45,$45,$45,$47
        .BYTE $43,$46,$41,$47,$43,$46,$41,$45
        .BYTE $45,$40,$41,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
pyramidsLine5   
        .BYTE $47,$48,$42,$46,$46,$46,$46,$46
        .BYTE $46,$46,$46,$46,$46,$41,$45,$45
        .BYTE $45,$45,$47,$42,$46,$46,$46,$49
        .BYTE $46,$46,$46,$41,$47,$43,$46,$41
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$47,$48,$42,$46
        .BYTE $46,$46,$46,$46,$46,$46,$46,$46
        .BYTE $46,$41,$45,$45,$45,$45,$47,$42
        .BYTE $46,$46,$46,$49,$46,$46,$46,$41
        .BYTE $47,$43,$46,$41,$45,$45,$45,$45
        .BYTE $45,$45,$45,$45,$45,$45,$45,$45
messageLine
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00
rollingHorizonLine1
        .BYTE $50,$50,$50,$50,$50,$50,$50,$50
        .BYTE $50,$50,$50,$50,$50,$50,$50,$50
        .BYTE $50,$50,$50,$50,$50,$50,$50,$50
        .BYTE $50,$50,$50,$50,$50,$50,$50,$50
        .BYTE $50,$50,$50,$50,$50,$50,$50,$50
        .BYTE $50,$50,$50,$50,$50,$50,$50
rollingHorizonLine2
        .BYTE $51,$51,$51,$51,$51,$51,$51,$51
        .BYTE $51,$51,$51,$51,$51,$51,$51,$51
        .BYTE $51,$51,$51,$51,$51,$51,$51,$51
        .BYTE $51,$51,$51,$51,$51,$51,$51,$51
        .BYTE $51,$51,$51,$51,$51,$51,$51,$51
        .BYTE $51,$51,$51,$51,$51,$51,$51
rollingHorizonLine3
        .BYTE $52,$52,$52,$52,$52,$52,$52,$52
        .BYTE $52,$52,$52,$52,$52,$52,$52,$52
        .BYTE $52,$52,$52,$52,$52,$52,$52,$52
        .BYTE $52,$52,$52,$52,$52,$52,$52,$52
        .BYTE $52,$52,$52,$52,$52,$52,$52,$52
        .BYTE $52,$52,$52,$52,$52,$52,$52
rollingHorizonLine4
        .BYTE $53,$53,$53,$53,$53,$53,$53,$53
        .BYTE $53,$53,$53,$53,$53,$53,$53,$53
        .BYTE $53,$53,$53,$53,$53,$53,$53,$53
        .BYTE $53,$53,$53,$53,$53,$53,$53,$53
        .BYTE $53,$53,$53,$53,$53,$53,$53,$53
        .BYTE $53,$53,$53,$53,$53,$53,$53
rollingHorizonLine5
        .BYTE $54,$54,$54,$54,$54,$54,$54,$54
        .BYTE $54,$54,$54,$54,$54,$54,$54,$54
        .BYTE $54,$54,$54,$54,$54,$54,$54,$54
        .BYTE $54,$54,$54,$54,$54,$54,$54,$54
        .BYTE $54,$54,$54,$54,$54,$54,$54,$54
        .BYTE $54,$54,$54,$54,$54,$54,$54
rollingHorizonLine6
        .BYTE $55,$55,$55,$55,$55,$55,$55,$55
        .BYTE $55,$55,$55,$55,$55,$55,$55,$55
        .BYTE $55,$55,$55,$55,$55,$55,$55,$55
        .BYTE $55,$55,$55,$55,$55,$55,$55,$55
        .BYTE $55,$55,$55,$55,$55,$55,$55,$55
        .BYTE $55,$55,$55,$55,$55,$55,$55

bannerLine2
.enc "atascii" 
        .TEXT '      JETS:'
player1LivesText   
        .TEXT '5         SHIELD:'
currentShieldText   
        .TEXT '9          JETS:'
player2LivesText   
        .TEXT '5       '

;-------------------------------------------------------------------------
; titleScreenDisplayList
; This controls the display of the title screen text.
;-------------------------------------------------------------------------
titleScreenDisplayList
        ; 70 - 8 blank lines
        .BYTE $70,$70
        ; + 40 - 'Load Memory Scan'
        ; +  2 - Text mode with 8 scan lines and 40 bytes per line
        ; = 42
        .BYTE $42,<titleScreenScoreLine,>titleScreenScoreLine

        ; 70 - 8 blank lines
        .BYTE $70

        ; + 40 - 'Load Memory Scan'
        ; +  7 - Text mode 2 with 16 scan lines and 40 bytes per line
        ; = 47
        .BYTE $47,<titleScreenText,>titleScreenText

        .BYTE $02
        ; 07 - Text mode with 16 scan lines high.
        ; This results in 'YAK THE HAIRY' in double font size. 
        .BYTE $07
        ; 06 - Text mode with 8 scan lines high.
        .BYTE $06,$07,$70,$02,$70
        .BYTE $02,$70,$02,$70
        .BYTE $02
        .BYTE $70
        ; 'Press Fire' in double font size.
        .BYTE $07
        .BYTE $41,<titleScreenDisplayList,>titleScreenDisplayList

titleScreenText
        .TEXT "   YAK THE HAIRY    "
        .TEXT "  PRESENTS LLAMASOFT'S CLASSIC BLAST    "
        .TEXT "       ATTACK       "
        .TEXT "       OF THE       "
        .TEXT "   MUTANT CAMELS    "
        .TEXT " NUMBER OF BLASTERS BLASTING: "
numberOfPlayersText   
        .TEXT '1          DIFFICULT'
        .TEXT 'Y: '
difficultyText   
        .TEXT 'FER SURE            '
        .TEXT '        BEAST BLASTI'
        .TEXT 'NG BULLET POTENTIAL:'
        .TEXT ' '
bulletStrengthText   
        .TEXT "2      BEST SPOT O' "
        .TEXT 'ZAPPING SO FAR: '
highScoreText   
        .TEXT '0000000    PRESS FIR'
        .TEXT "E T'START "
.enc "none"

p152D   
        .BYTE $73,$63,$63,$63,$61,$61,$73,$76
        .BYTE $3A,$BC,$BD,$FB,$7F,$3F,$3F,$1F
        .BYTE $0F,$07,$00,$00,$00,$8D,$0D,$19
        .BYTE $30,$98,$99,$0B,$07,$0E,$3F,$FF
        .BYTE $FF,$FF,$FC,$F8,$F0,$E0,$80,$00
        .BYTE $00,$00,$C0,$80,$80,$C0,$C0,$80
        .BYTE $00,$00,$00,$00,$80,$C0,$E0,$F0
        .BYTE $70,$38,$38,$1C,$16,$1C,$10,$27
        .BYTE $66,$C6,$C6,$C3,$C3,$E6,$E6,$78
        .BYTE $BC,$B9,$FB,$7F,$3F,$3F,$1F,$0F
        .BYTE $07,$00,$00,$00,$03,$1B,$33,$31
        .BYTE $31,$33,$1B,$06,$0E,$3F,$FF,$FF
        .BYTE $FF,$FC,$F8,$F0,$E0,$80,$00,$00
        .BYTE $00,$80,$00,$00,$80,$80,$00,$00
        .BYTE $00,$00,$00,$80,$C0,$E0,$E0,$70
        .BYTE $70,$38,$3C,$16,$1C,$10,$18,$00
        .BYTE $1E,$18,$34,$6C,$64,$78,$78,$3C
        .BYTE $B9,$FB,$7F,$3F,$3F,$1F,$0F,$07
        .BYTE $00,$00,$00,$07,$06,$16,$06,$07
        .BYTE $06,$06,$06,$0E,$3F,$FF,$FF,$FF
        .BYTE $FC,$F8,$F0,$E0,$80,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$80,$80
        .BYTE $00,$00,$80,$C0,$E0,$F0,$78,$38
        .BYTE $1C,$1C,$16,$1C,$10,$38,$30,$33
        .BYTE $36,$2C,$0C,$1C,$38,$7C,$B7,$BD
        .BYTE $FB,$7F,$3F,$3F,$1F,$0F,$07,$00
        .BYTE $00,$00,$07,$06,$06,$16,$16,$06
        .BYTE $06,$06,$0E,$3F,$FF,$FF,$FF,$FC
        .BYTE $F8,$F0,$E0,$80,$00,$00,$00,$00
        .BYTE $00,$00,$00,$80,$C0,$C0,$80,$00
        .BYTE $00,$80,$C0,$E0,$F0,$78,$3C,$1C
        .BYTE $16,$1C,$10,$00,$70,$60,$61,$61
        .BYTE $23,$0E,$1C,$38,$3C,$BE,$BD,$FB
        .BYTE $7F,$3F,$3F,$1F,$0F,$07,$00,$00
        .BYTE $00,$07,$06,$CD,$8D,$0E,$0C,$06
        .BYTE $06,$0E,$3F,$FF,$FF,$FF,$FC,$F8
        .BYTE $F0,$E0,$80,$00,$00,$00,$00,$00
        .BYTE $00,$80,$C0,$C0,$80,$80,$00,$00
        .BYTE $80,$E0,$F0,$F8,$38,$1C,$1C,$16
        .BYTE $1C,$10,$00,$70,$61,$61,$63,$73
        .BYTE $46,$1C,$1E,$3E,$BE,$BD,$FB,$7F
        .BYTE $3F,$3F,$1F,$0F,$07,$00,$00,$00
        .BYTE $EE,$8C,$8C,$0C,$0E,$0C,$06,$06
        .BYTE $0E,$3F,$FF,$FF,$FF,$FC,$F8,$F0
        .BYTE $E0,$80,$00,$00,$00,$30,$60,$60
        .BYTE $C0,$C0,$C0,$80,$80,$00,$00,$80
        .BYTE $C0,$E0,$F0,$78,$3C,$3C,$1C,$16
        .BYTE $1C,$10,$E1,$C3,$C3,$C3,$66,$66
        .BYTE $5C,$1E,$3E,$BE,$BD,$FB,$7F,$3F
        .BYTE $3F,$1F,$0F,$07,$00,$00,$00,$8E
        .BYTE $0D,$18,$18,$1C,$0C,$06,$06,$0E
        .BYTE $3F,$FF,$FF,$FF,$FC,$F8,$F0,$E0
        .BYTE $80,$00,$00,$00,$C0,$80,$C0,$C0
        .BYTE $C0,$80,$80,$80,$00,$00,$80,$C0
        .BYTE $E0,$E0,$70,$70,$38,$3C,$16,$1C
        .BYTE $10,$07,$66,$E6,$CC,$CC,$DC,$5C
        .BYTE $1E,$3E,$BE,$BD,$FB,$7F,$3F,$3F
        .BYTE $1F,$0F,$07,$00,$00,$00,$03,$1B
        .BYTE $31,$18,$1C,$1C,$0E,$06,$0E,$3F
        .BYTE $FF,$FF,$FF,$FC,$F8,$F0,$E0,$80
        .BYTE $00,$00,$00,$C0,$00,$80,$C0,$C0
        .BYTE $80,$80,$80,$00,$00,$80,$C0,$E0
        .BYTE $E0,$70,$70,$38,$3C,$16,$1C,$10
        .BYTE $0E,$0C,$0C,$58,$58,$DC,$5C,$1E
        .BYTE $3E,$BE,$BD,$FB,$7F,$3F,$3F,$1F
        .BYTE $0F,$07,$00,$00,$00,$0E,$0C,$0B
        .BYTE $06,$06,$07,$07,$07,$0F,$3F,$FF
        .BYTE $FF,$FF,$FC,$F8,$F0,$E0,$80,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$80,$C0,$E0,$E0
        .BYTE $70,$70,$38,$3C,$1E,$1C,$10,$1C
        .BYTE $18,$18,$30,$31,$3D,$1C,$1E,$3E
        .BYTE $BE,$BD,$FB,$7F,$3F,$3F,$1F,$0F
        .BYTE $07,$00,$00,$00,$0E,$0C,$0B,$0B
        .BYTE $0B,$03,$01,$03,$07,$3F,$FF,$FF
        .BYTE $FF,$FC,$F8,$F0,$E0,$80,$00,$00
        .BYTE $00,$00,$00,$C0,$00,$00,$80,$80
        .BYTE $00,$00,$00,$80,$C0,$E0,$F0,$70
        .BYTE $38,$38,$3C,$16,$1C,$10,$38,$30
        .BYTE $33,$33,$33,$3D,$1C,$1E,$3E,$BE
        .BYTE $BD,$FB,$7F,$3F,$3F,$1F,$0F,$07
        .BYTE $00,$00,$00,$0E,$0C,$8C,$0C,$0C
        .BYTE $0D,$05,$03,$03,$3F,$FF,$FF,$FF
        .BYTE $FC,$F8,$F0,$E0,$80,$00,$00,$00
        .BYTE $F0,$60,$C0,$C0,$C0,$C0,$80,$80
        .BYTE $00,$00,$80,$C0,$E0,$F0,$70,$38
        .BYTE $1C,$16,$1C,$10,$00,$39,$31,$31
        .BYTE $31,$33,$39,$1C,$1E,$3E,$BE,$BD
        .BYTE $FB,$7F,$3F,$3F,$1F,$0F,$07,$00
        .BYTE $00,$00,$CE,$8C,$98,$98,$18,$0D
        .BYTE $0D,$0B,$03,$3F,$FF,$FF,$FF,$FC
        .BYTE $F8,$F0,$E0,$80,$00,$00,$00,$F0
        .BYTE $60 

        .BYTE $C0,$C0,$C0,$C0,$80,$80,$00,$00
        .BYTE $80,$C0,$E0,$F0,$78,$38,$1C,$16
        .BYTE $1C,$10,$00,$FF
;-------------------------------------------------------------------------
; LaunchGame
;-------------------------------------------------------------------------
LaunchGame
        LDA #>charsetData
        STA CHBAS    ;CHBAS   shadow for CHBASE ($D409)

        LDA #$10
        STA a2A9A
        STA a2F0E
        JSR SetUpTitleScreenInterrupts
        JSR ResetPlayer1AndPlayer2
        JSR SetUpInGameInterrupts

SetUpTitleScreen
        LDA #<p152D
        STA aE2
        LDA #>p152D
        STA aE3
        LDA #$00
        STA FLPTR
        JSR s2396
        LDA #$0F
        STA COLOR1   ;COLOR1  shadow for COLPF1 ($D017)
        STA COLOR3   ;COLOR3  shadow for COLPF3 ($D019)
        STA FR3
        LDA #>p7F00
        STA aE5
        LDA #<p7F00
        STA aE4
        STA CIX      ;CIX     
        LDA #$23
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)
        LDA #$06
        STA aFD
        LDA a2F0E
        BEQ b1871
        JSR s2EBE
        LDA #$00
        STA a2F0E
b1871   LDA #$01
        STA DEGFLG
        STA aDE
        STA INBUFF   ;INBUFF  
        STA FR0      ;FR0     floating point register 0
        STA scrollingOffset
        STA aC6
        STA aC7
        STA aC5
        LDA #$FF
        STA aE8
        STA FLPTR
        JSR GetGameSettingsForDifficultyLevel
        JSR ClearMessageAndRadarLine
        JSR s2F43

        LDA #$00
        STA $D404    ;HSCROL
        STA aD5
        STA a2BA7
        STA aEA
        STA aD5
        STA aD6
        STA aEF
        STA aF8
        STA aF0
        STA a2400
        STA a2403
        STA aaDC
        STA aDD
        STA aDF
        STA FR2

        LDX #$00
b18B8   STA f3680,X
        INX 
        CPX #$40
        BNE b18B8

        STA aC4
        STA scrollingOffset
        STA scrollDirection
        STA shipSpeed
        STA shipDirection

        LDA #$7F
        STA COLOR4   ;COLOR4  shadow for COLBK ($D01A)
        LDA #$C0
        STA currentXPosition

        JSR UpdateCamelsLeftText
        JSR ClearGameData
        JSR UpdateCurrentPlayerText
        JSR UpdatePositionOnRadar
        JSR ClearMessageLine
        LDA aFD
        BNE GamePlayLoop
        LDA #$F0
        STA FLPTR
        JMP j18FF

GamePlayLoop   
        JSR UpdateShipDirectionAndSpeed
        JSR CheckIfFirePressed
        JSR s2441
        JSR s2335
        LDA FLPTR
        CMP #$F0
        BNE GamePlayLoop

j18FF
        JMP MaybePerformWarp

;-------------------------------------------------------------------------
; DisplayListInterrupt   
;-------------------------------------------------------------------------
DisplayListInterrupt   
        PHA 
        LDA aC0
        STA $D40A    ;WSYNC
        STA $D018    ;COLPF2
        STA $D01A    ;COLBK

        AND #$0F
        CMP #$0D
        BEQ b1924
        INC aC0
        BEQ b1924

        LDA currentXPosition
        STA $D000    ;HPOSP0

        LDA aC1
        STA $D017    ;COLPF1

        PLA 
        RTI 

b1924   INC aC0
b1926   DEC aC0
        DEC aC0
        LDA aC0
        STA $D40A    ;WSYNC
        STA $D01A    ;COLBK
        STA $D018    ;COLPF2
        AND #$0F
        BNE b1926
        LDA FR1      ;FR1     floating point register 1
        ADC #$04
        STA FR1      ;FR1     floating point register 1
        AND #$F0
        ORA #$06
        STA $D40A    ;WSYNC
        STA $D017    ;COLPF1
        TXA 
        PHA 
        TYA 
        PHA 
        JSR ScrollPyramidLeftOrRight
        PLA 
        TAY 
        PLA 
        TAX 
        LDA #$00
        STA ATRACT   ;ATRACT  screen attract counter
        PLA 
        RTI 

;-------------------------------------------------------------------------
; SetUpInGameInterrupts
;-------------------------------------------------------------------------
SetUpInGameInterrupts
        LDA #$00
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)

        LDA #<gameScreenDisplayList
        STA SDLSTL   ;SDLSTL  shadow for DLISTL ($D402)
        LDA #>gameScreenDisplayList
        STA SDLSTH   ;SDLSTH  shadow for DLISTH ($D403)

        LDA #$22
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)

        LDY #<VerticalBlankInterruptHandler
        LDX #>VerticalBlankInterruptHandler
        LDA #$07
        JSR SETBV    ;$E45C (jmp) SETBV

        LDA #<DisplayListInterrupt
        STA VDSLST   ;VDSLST  display list interrupt vector
        LDA #>DisplayListInterrupt
        STA VDSLST + 1

        ; Enable Display List Interrupts
        LDA #$C0
        STA $D40E    ;NMIEN
        RTS 

;-------------------------------------------------------------------------
; VerticalBlankInterruptHandler
;-------------------------------------------------------------------------
VerticalBlankInterruptHandler
        LDA FLPTR
        CMP #$01
        BNE b1992
        LDA aC0
        JMP j1995

b1992   LDA a2A9A

j1995
        STA aC0
        STA $D01A    ;COLBK
        STA $D018    ;COLPF2
        LDA FLPTR
        CMP #$01
        BEQ b19C3

        LDA aC0
        CLC 
        ADC #$10
        STA aC0

        EOR #$F0
        ORA #$06
        STA aC1

        SBC #$04
        STA COLOR0   ;COLOR0  shadow for COLPF0 ($D016)

        LDA FPTEM1
        CMP #$BD
        BNE b19C3

        LDA #$0F
        STA COLOR0   ;COLOR0  shadow for COLPF0 ($D016)
        STA $D019    ;COLPF3

b19C3   LDA #$0F
        STA COLOR1   ;COLOR1  shadow for COLPF1 ($D017)

        JSR LookAfterScrolling
        JSR GetJoystickInput

        LDA updatedXPosition
        STA $D000    ;HPOSP0
        LDA PCOLR0   ;PCOLR0  shadow for COLPM0 ($D012)
        CLC 
        ADC #$10
        ORA #$0F
        STA PCOLR0   ;PCOLR0  shadow for COLPM0 ($D012)
        LDA $D009    ;SIZEP1
        STA aE7

        JSR CheckForCollisions
        JSR UpdateCamelYPosition
        JSR UpdateTheRadarView
        JSR FlashingOfPlayerAndCamels

        JMP XITBV    ;$E462 (jmp) XITBV

;-------------------------------------------------------------------------
; j19F2
;-------------------------------------------------------------------------
j19F2
        PLA 
        STA scrollingPyraimdsLoPtr
        LDA scrollingOffset
        SEC 
        SBC scrollingPyraimdsLoPtr
        STA scrollingOffset
        AND #$F0
        BEQ b1A03
f1A00   
        JSR ScrollPyramids
b1A03   LDA scrollingOffset
        AND #$0F
        STA $D404    ;HSCROL
        STA scrollingOffset
        RTS 

;-------------------------------------------------------------------------
; ScrollPyramids
;-------------------------------------------------------------------------
ScrollPyramids
        LDA #<scrollingPyramidsDisplayLists
        STA scrollingPyraimdsLoPtr
        LDA #>scrollingPyramidsDisplayLists
        STA scrollingPyramidsHiPtr
        LDX #$05
b1A17   LDY #$01
        LDA (scrollingPyraimdsLoPtr),Y
        CLC 
        ADC #$04
        STA (scrollingPyraimdsLoPtr),Y
        INY 
        LDA (scrollingPyraimdsLoPtr),Y
        ADC #$00
        STA (scrollingPyraimdsLoPtr),Y
        LDA scrollingPyraimdsLoPtr
        CLC 
        ADC #$03
        STA scrollingPyraimdsLoPtr
        LDA scrollingPyramidsHiPtr
        ADC #$00
        STA scrollingPyramidsHiPtr
        DEX 
        BNE b1A17
        INC aC4
        LDA aC4
        CMP #$0B
        BEQ ResetScrollingPyramids
        RTS 

ResetScrollingPyramids   
        LDA #$00
        STA aC4
        LDA #<pyramidsLine1
        STA a102A
        LDA #>pyramidsLine1
        STA a102B
        LDA #<pyramidsLine2
        STA a102D
        LDA #>pyramidsLine2
        STA a102E
        LDA #<pyramidsLine3
        STA a1030
        LDA #>pyramidsLine3
        STA a1031
        LDA #<pyramidsLine4
        STA a1033
        LDA #>pyramidsLine4
        STA a1034
        LDA #<pyramidsLine5
        STA a1036
        LDA #>pyramidsLine5
        STA a1037
        RTS 

;-------------------------------------------------------------------------
; j1A77
;-------------------------------------------------------------------------
j1A77
        PLA 
        CLC 
        ADC scrollingOffset
        STA scrollingOffset
        AND #$F0
        BEQ b1A84
        JSR s1A8E
b1A84   LDA scrollingOffset
        AND #$0F
        STA $D404    ;HSCROL
        STA scrollingOffset
        RTS 

;-------------------------------------------------------------------------
; s1A8E
;-------------------------------------------------------------------------
s1A8E
        LDA #<scrollingPyramidsDisplayLists
        STA scrollingPyraimdsLoPtr
        LDA #>scrollingPyramidsDisplayLists
        STA scrollingPyramidsHiPtr
        LDX #$05
b1A98   LDY #$01
        LDA (scrollingPyraimdsLoPtr),Y
        SEC 
        SBC #$04
        STA (scrollingPyraimdsLoPtr),Y
        BCS b1AAB
        INY 
        LDA (scrollingPyraimdsLoPtr),Y
        SEC 
        SBC #$01
        STA (scrollingPyraimdsLoPtr),Y
b1AAB   LDA scrollingPyraimdsLoPtr
        CLC 
        ADC #$03
        STA scrollingPyraimdsLoPtr
        LDA scrollingPyramidsHiPtr
        ADC #$00
        STA scrollingPyramidsHiPtr
        DEX 
        BNE b1A98
        DEC aC4
        LDA aC4
        CMP #$FF
        BEQ b1AC4
        RTS 

b1AC4   LDA #$0A
        STA aC4
        LDA #<scrollingPyramidsDisplayLists
        STA scrollingPyraimdsLoPtr
        LDA #>scrollingPyramidsDisplayLists
        STA scrollingPyramidsHiPtr
        LDX #$05
b1AD2   LDY #$01
        LDA (scrollingPyraimdsLoPtr),Y
        CLC 
        ADC #$2C
        STA (scrollingPyraimdsLoPtr),Y
        INY 
        LDA (scrollingPyraimdsLoPtr),Y
        ADC #$00
        STA (scrollingPyraimdsLoPtr),Y
        LDA scrollingPyraimdsLoPtr
        CLC 
        ADC #$03
        STA scrollingPyraimdsLoPtr
        LDA scrollingPyramidsHiPtr
        ADC #$00
        STA scrollingPyramidsHiPtr
        DEX 
        BNE b1AD2
        RTS 

f1AF3   .BYTE $08,$08,$08,$08,$04,$04,$04,$04
        .BYTE $02,$02,$02,$02,$01,$01,$01,$01
        .BYTE $01,$01,$01,$01,$01,$01,$01,$01
        .BYTE $01,$01,$01,$01
f1B0F   .BYTE $01,$01,$01,$01,$02,$02,$02,$02
        .BYTE $03,$03,$03,$03,$04,$04,$04,$04
        .BYTE $05,$05,$05,$05,$06,$06,$06,$06
        .BYTE $06,$07,$07,$07,$07
f1B2C   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
f1B3C   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
;-------------------------------------------------------------------------
; LookAfterScrolling
;-------------------------------------------------------------------------
LookAfterScrolling
        DEC aC6
        BEQ b1B51
        RTS 

b1B51   LDA aC5
        STA aC6
        INC COLOR3   ;COLOR3  shadow for COLPF3 ($D019)
        DEC aC7
        BNE b1B79
        LDA #$1C
        STA aC7
        LDX #$00
b1B62   LDA f1B3C,X
        BEQ b1B6F
        INX 
        CPX #$10
        BNE b1B62
        JMP b1B79

b1B6F   LDA #$01
        STA f1B3C,X
        LDA #$00
        STA f1B2C,X
b1B79   LDX #$00
b1B7B   LDA f1B3C,X
        BEQ b1B8C
        DEC f1B3C,X
        BNE b1B8C
        TXA 
        PHA 
        JSR s1B92
        PLA 
        TAX 
b1B8C   INX 
        CPX #$10
        BNE b1B7B
        RTS 

;-------------------------------------------------------------------------
; s1B92
;-------------------------------------------------------------------------
s1B92
        LDA f1B2C,X
        STA scrollingPyraimdsLoPtr
        CLC 
        ROR 
        STA scrollingPyramidsHiPtr
        INC f1B2C,X
        LDA #$00
        LDY scrollingPyraimdsLoPtr
        STA f3680,Y
        INY 
        TYA 
        STA scrollingPyraimdsLoPtr
        CMP #$30
        BNE b1BAE
        RTS 

b1BAE   LDY scrollingPyramidsHiPtr
        LDA f1AF3,Y
        STA f1B3C,X
        LDX f1B0F,Y
        LDY scrollingPyraimdsLoPtr
        LDA #$AA
        STA f3680,Y
b1BC0   INY 
        STA f3680,Y
        DEX 
        BNE b1BC0
        RTS 

;-------------------------------------------------------------------------
; ClearGameData
;-------------------------------------------------------------------------
ClearGameData
        LDA #>spriteData
        STA $D407    ;PMBASE

        LDA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)
        ORA #$1C
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)

        LDA #$00
        STA $D208    ;AUDCTL

        LDA #$03
        STA SSKCTL   ;SSKCTL  shadow for SKCTL ($D20F)
        STA $D20F    ;SKCTL

        ; Clear the sprite memory.
        LDX #$00
b1BE4   LDA #$00
        STA yPositionArray,X
        STA shipSpriteMemory,X
        STA camelSpriteMemory1,X
        STA camelSpriteMemory2,X
        STA camelSpriteMemory3,X
        INX 
        BNE b1BE4

b1BF8   STA $D000,X  ;HPOSP0
        INX 
        CPX #$08
        BNE b1BF8

        LDA #$C0
        STA $D000    ;HPOSP0
        STA $D004    ;HPOSM0

        ; Turn on players and missiles.
        LDA #$03
        STA $D01D    ;GRACTL

        ; Make the camels double size.
        LDA #$01
        STA $D009    ;SIZEP1
        STA $D00A    ;SIZEP2
        STA $D00B    ;SIZEP3

        LDA #$11
        STA GPRIOR   ;GPRIOR  shadow for PRIOR ($D01B)

        LDA #$5F
        STA $D00C    ;SIZEM

        RTS 

f1C23   .BYTE $00,$00,$00,$00,$00
a1C28   .BYTE $00
f1C29   .BYTE $10,$10,$10,$10,$10,$10
f1C2F   .BYTE $04,$04,$04,$04,$04,$04
shipFacingLeftSpriteDefinition
        .BYTE $3C,$00,$3F,$1F,$03,$01           ;.BYTE $3C,$00,$3F,$1F,$03,$01
                                                ; 00000001          *
                                                ; 00000011         **
                                                ; 00011111      *****
                                                ; 00111111     ******
                                                ; 00000000           
                                                ; 00111100     ****  

shipFacingRightSpriteDefinition
        .BYTE $3C,$00,$FC,$E0,$C0,$80

f1C41   .BYTE $01,$01,$02,$02,$04,$04,$08,$08
        .BYTE $10
f1C4A   .BYTE $90,$8F,$8E,$8D,$8C
a1C4F   .BYTE $8B
f1C50   .BYTE $08,$08,$08,$08,$08,$08
;-------------------------------------------------------------------------
; UpdatePositionOnRadar
;-------------------------------------------------------------------------
UpdatePositionOnRadar
        LDA #$00
        STA aC8
        LDA #$20
        STA aC9
b1C5E   DEC aC9
        BEQ b1C65
        JMP j1C87

b1C65   LDA #$20
        STA aC9
        LDA aC8
        CMP #$06
        BNE b1C72
        JMP j1C87

b1C72   LDX aC8
        LDA #$01
        STA f1C23,X
        INC aC8
        LDA #$10
        STA aD5
        STA $D200    ;POT0
        LDA #$8F
        STA $D201    ;POT1

        ; Copy the 
j1C87
        LDX #$00
b1C89   LDA f1C23,X
        BEQ b1C91
        JSR UpdateYPositionOfShipSprite
b1C91   INX 
        CPX #$06
        BNE b1C89

        LDX #$02
b1C98   LDY #$00
b1C9A   DEY 
        BNE b1C9A
        DEX 
        BNE b1C98

        LDA a1C28
        CMP a1C4F
        BNE b1C5E
        LDA #$03
        STA missileMemory + $8F
        LDA #$90
        STA currentYPosition
        LDA #$00
        STA $D201    ;POT1
        STA FLPTR
        STA aD5
        LDA #$C0
        STA updatedXPosition

        ; This updates the ship's current position on the 
        ; radar.
        LDA #$C3
        STA shipSpriteMemory + $28
        STA shipSpriteMemory + $2D
        LDA #$81
        STA shipSpriteMemory + $2A
        STA shipSpriteMemory + $2B
        RTS 

;-------------------------------------------------------------------------
; UpdateYPositionOfShipSprite
;-------------------------------------------------------------------------
UpdateYPositionOfShipSprite
        DEC f1C29,X
        BEQ b1CD5
b1CD4   RTS 

b1CD5   LDY f1C50,X
        LDA f1C41,Y
        STA f1C29,X
        DEC f1C2F,X
        BNE b1CF0
        LDA #$04
        STA f1C2F,X
        DEC f1C50,X
        BNE b1CF0
        INC f1C50,X
b1CF0   LDA f1C23,X
        CMP f1C4A,X
        BEQ b1CD4
        TAY 
        LDA #$00
        STA shipSpriteMemory,Y
        INY 
        LDA shipFacingLeftSpriteDefinition,X
        STA shipSpriteMemory,Y
        INC f1C23,X
        INC aD5
        LDA aD5
        STA $D200    ;POT0
ReturnEarly   
        RTS 

MIN_Y_POSITION = $38
LEFT = $00
RIGHT = $01
;-------------------------------------------------------------------------
; GetJoystickInput   
;-------------------------------------------------------------------------
GetJoystickInput   
        LDY currentYPosition
        BEQ ReturnEarly
        LDA FLPTR
        CMP #$FF
        BEQ ReturnEarly

        ; Clear the ship's current Y Position
        LDX #$06
        LDA #$00
b1D1E   LDA #$00
        STA shipSpriteMemory,Y
        DEY 
        DEX 
        BNE b1D1E

        LDY currentYPosition
        DEY 
        LDA yPositionArray,Y
        AND #$FC
        STA yPositionArray,Y

MaybeJoystickDown
        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #$01
        BNE MaybeJoystickUp

        ; Joystick moved down
        LDA currentYPosition
        SEC 
        SBC #$04
        CMP #MIN_Y_POSITION
        BNE UpdateYPos

        CLC 
        ADC #$04
UpdateYPos   
        STA currentYPosition

MaybeJoystickUp   
        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #$02
        BNE MaybeJoystickLeftOrRight
        LDA currentYPosition
        CLC 
        ADC #$04
        CMP #$F0
        BNE UpdateYPos2

        SEC 
        SBC #$04
UpdateYPos2   
        STA currentYPosition

MaybeJoystickLeftOrRight   
        LDA FLPTR
        BEQ MaybeJoystickLeft
        LDA #LEFT
        STA scrollDirection
        JMP UpdateDirectionAndSpeed

MaybeJoystickLeft   
        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #$04
        BNE MaybeJoystickRight
        LDA #LEFT
        STA scrollDirection

MaybeJoystickRight   
        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #$08
        BNE UpdateDirectionAndSpeed
        LDA #RIGHT
        STA scrollDirection

UpdateDirectionAndSpeed   
        LDY currentYPosition
        LDX #$00

UpdateShipYPositionLoop
        LDA scrollDirection
        BNE b1D8B

        LDA shipFacingLeftSpriteDefinition,X
        JMP j1D8E

b1D8B   LDA shipFacingRightSpriteDefinition,X

j1D8E
        STA shipSpriteMemory,Y
        DEY 
        INX 
        CPX #$06
        BNE UpdateShipYPositionLoop

        LDY currentYPosition
        DEY 
        LDA yPositionArray,Y
        ORA #$03
        STA yPositionArray,Y
        JMP j240D

b1DA5   RTS 

;-------------------------------------------------------------------------
; UpdateShipDirectionAndSpeed
;-------------------------------------------------------------------------
UpdateShipDirectionAndSpeed
        DEC aCD
        BNE b1DA5
        LDA scrollDirection
        BNE b1DBF
        LDA currentXPosition
        CMP #$C0
        BEQ b1DCB
        CLC 
        ADC #$02

j1DB7
        STA $D004    ;HPOSM0
        STA currentXPosition
        JMP b1DCB

b1DBF   LDA currentXPosition
        CMP #$40
        BEQ b1DCB
        SEC 
        SBC #$02
        JMP j1DB7

b1DCB   DEC FR0      ;FR0     floating point register 0
        BEQ b1DD0
ReturnFromDirectionAndSpeed   
        RTS 

JOY_RIGHT = $04
b1DD0   LDA #$04
        STA FR0      ;FR0     floating point register 0
        JSR CheckJoystickAndPlayASound

        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #JOY_RIGHT
        BNE MaybeStickMovedLeft

        ; Joystick Moved Right.
        LDA shipDirection
        BEQ b1DF3
        LDA shipSpeed
        BEQ b1DEA
        DEC shipSpeed
        BNE ReturnFromDirectionAndSpeed

b1DEA   LDA #$00
        STA shipDirection
        LDA #$02
        STA shipSpeed
        RTS 

b1DF3   INC shipSpeed
        LDA shipSpeed
        CMP #$0A
        BNE ReturnFromDirectionAndSpeed
        DEC shipSpeed
b1DFD   RTS 

MaybeStickMovedLeft   
        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #$08
        BNE b1DFD

        ; Joystick moved left.
        LDA shipDirection
        BNE b1DF3
        LDA shipSpeed
        BEQ b1E11
        DEC shipSpeed
        BNE b1DFD

b1E11   LDA #$01
        STA shipDirection
        LDA #$02
        STA shipSpeed
b1E19   RTS 

;-------------------------------------------------------------------------
; ScrollPyramidLeftOrRight
;-------------------------------------------------------------------------
ScrollPyramidLeftOrRight
        LDA shipSpeed
        CLC 
        ROR 
        BEQ b1E19
        PHA 
        LDA shipDirection
        BNE b1E28
        JMP j1A77

b1E28   JMP j19F2

JOYSTICK_UP_OR_DOWN = $0C
;-------------------------------------------------------------------------
; CheckJoystickAndPlayASound
;-------------------------------------------------------------------------
CheckJoystickAndPlayASound
        LDA a2BA7
        BEQ b1E33
        JMP PlayASound1

b1E33   LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #JOYSTICK_UP_OR_DOWN
        CMP #JOYSTICK_UP_OR_DOWN
        BEQ b1E59
        INC aD5
        LDA aD5
        CMP #$0F
        BNE b1E46
        DEC aD5
b1E46   CLC 
        ROR 
        ORA #$80
        STA $D201    ;POT1
        LDA currentYPosition
        CLC 
        ROR 
        ADC #$10
        ADC aD5
        STA $D200    ;POT0
        RTS 

b1E59   LDA aD5
        BEQ b1E46
        DEC aD5
        LDA aD5
        JMP b1E46

;-------------------------------------------------------------------------
; CheckIfFirePressed
;-------------------------------------------------------------------------
CheckIfFirePressed
        DEC bulletFireRate
        BEQ b1E69
b1E68   RTS 

b1E69   LDA #$50
        STA bulletFireRate

        LDA bulletXPosition
        BNE b1E97

        ; Check if fire pressed.
        LDA STRIG0   ;STRIG0  shadow for TRIG0 ($D001)
        BNE b1E68

        ;Fire was pressed.
        LDA currentXPosition
        STA bulletXPosition
        LDA scrollDirection
        STA bulletDirection
        LDY currentYPosition
        STY bulletYPosition

        LDA #$0C
        STA yPositionArray - 1,Y

        LDA #$30
        STA aF7

        LDA #$10
        STA aD6

        LDA #$C5
        STA $D203    ;POT3
        STA CLEAR_HIT_REGISTER

b1E97   LDA aE7
        AND #$0E
        BEQ b1EF2
        LDA aEA
        BNE b1EF2
        LDA aE8
        CMP #$FF
        BEQ b1EF2
        TAX 
        LDA f1F44,X
        SEC 
        SBC a2C30
        STA f1F44,X

        LDA #>p04D0
        STA aF0
        LDA #<p04D0
        STA aEF

        LDA f1F44,X
        AND #$F0
        CMP #$F0
        BNE b1EE0

        LDA #$00
        STA aF0
        JSR s2216
        TXA 
        PHA 
        LDY DEGFLG
        LDA #$04
        JSR IncrementCurrentPlayerScore
        LDA DEGFLG
        ASL 
        STA DEGFLG
        JSR UpdateCamelsLeftText
        PLA 
        TAX 
        JMP j1F1F

b1EE0   TYA 
        PHA 
        TXA 
        PHA 
        LDA #$06
        LDY #$01
        JSR IncrementCurrentPlayerScore
        PLA 
        TAX 
        PLA 
        TAY 
        JMP j1F1F

b1EF2   LDA bulletDirection
        BNE b1EFE
        DEC bulletXPosition
        DEC bulletXPosition
        DEC bulletXPosition
        DEC bulletXPosition
b1EFE   INC bulletXPosition
        INC bulletXPosition
        LDA bulletXPosition
        AND #$F0
        CMP #$10
        BEQ j1F1F
        CMP #$E0
        BEQ j1F1F
        DEC aF7
        BEQ j1F1F

        INC aD6
        LDA aD6
        STA $D202    ;POT2

        LDA bulletXPosition
        STA $D005    ;HPOSM1
        RTS 

;-------------------------------------------------------------------------
; j1F1F
;-------------------------------------------------------------------------
j1F1F
        LDA #$00
        STA $D203    ;POT3
        STA bulletXPosition
        STA $D005    ;HPOSM1
        LDY bulletYPosition
        LDA f3AFF,Y
        AND #$F3
        STA f3AFF,Y
        STA CLEAR_HIT_REGISTER
        RTS 

a1F37   .BYTE $00

; Arrays for Camel Data.
f1F38   .BYTE $12,$10,$0E,$0C,$0A,$08
f1F3E   .BYTE $12,$10,$0E,$0C,$0A,$08
f1F44   .BYTE $F1,$F1,$FF,$FF,$FF,$FF
currentCamelPositionOnRadarArray   
        .BYTE $06,$0A,$0E,$12,$16,$1A
f1F50   .BYTE $06,$0A,$0E,$12,$16,$1A
;-------------------------------------------------------------------------
; CheckForCollisions
;-------------------------------------------------------------------------
CheckForCollisions
        LDA $D00C    ;SIZEM
        STA FPTR2
        LDA aDF
        BEQ b1F64
        DEC aDF
b1F61   JMP j202D

b1F64   LDA FLPTR
        CMP #$FF
        BEQ b1F61
        CMP #$01
        BEQ b1F61
        LDA $D00C    ;SIZEM
        AND #$0F
        BNE b1FA1
        LDA $D00A    ;SIZEP2
        ORA $D00B    ;SIZEP3
        AND #$01
        BEQ b1F61
        LDA #$00
        STA a2403
        STA a2401
        STA a2400
        LDA #$10
        STA a2BA7
        LDA shipDirection
        EOR #$01
        STA shipDirection
        LDA #$06
        STA shipSpeed
        STA CLEAR_HIT_REGISTER
        STA aDF
        JMP DecrementCurrentShields

b1FA1   LDA aEA
        BEQ b1FA8
        JMP j202D

b1FA8   LDA shipDirection
        EOR #$01
        STA shipDirection
        LDA #$09
        STA shipSpeed
        LDA #$10
        STA aDF
        LDA #$10
        STA a2BA7
        LDX aE8
        LDA f1F44,X
        SEC 
        SBC #$10
        STA f1F44,X
        AND #$F0
        BEQ b1FCE
        CMP #$F0
        BNE b1FE4
b1FCE   JSR s2216
        TXA 
        PHA 
        LDY DEGFLG
        LDA #$04
        JSR IncrementCurrentPlayerScore
        LDA DEGFLG
        ASL 
        STA DEGFLG
        JSR UpdateCamelsLeftText
        PLA 
        TAX 
b1FE4   JSR DecrementCurrentShields
        JMP j202D

;-------------------------------------------------------------------------
; DecrementCurrentShields
;-------------------------------------------------------------------------
DecrementCurrentShields
        DEC currentShieldText
        LDA currentShieldText
        CMP #$10
        BNE b202C

j1FF4
        LDA aEA
        BEQ b1FFB
        JSR s2311
b1FFB   LDA #$FF
        STA FLPTR
p2000   =*+$01
        LDA #$00
        STA $D004    ;HPOSM0
        STA $D005    ;HPOSM1
        STA $D006    ;HPOSM2
        STA $D007    ;HPOSM3
        STA $D201    ;POT1
        STA $D203    ;POT3
        STA $D205    ;POT5
        JSR s2216
b2019   LDA aEA
        BNE b2019
        JSR ClearMessageAndRadarLine
        JSR DecrementCurrentPlayerLives
        JSR s2396
        LDX #$F8
        TXS 
        JMP b1871

b202C   RTS 

CLEAR_HIT_REGISTER = $D01E
;-------------------------------------------------------------------------
; j202D
;-------------------------------------------------------------------------
j202D
        LDA shipSpeed
        STA CLEAR_HIT_REGISTER
        CMP #$01
        BEQ b2085
        LDA shipDirection
        BEQ b206F
        LDA aaDC
        SEC 
        SBC shipSpeed
        STA aaDC
        LDA aDD
        SBC #$00
        CMP #$FE
        BNE b204B
        LDA #$11
b204B   STA aDD
;-------------------------------------------------------------------------
; j204D
;-------------------------------------------------------------------------
j204D
        CLC 
        ASL 
        ASL 
        ASL 
        STA scrollingPyraimdsLoPtr
        LDA aaDC
        CLC 
        ROL 
        ADC #$00
        ROL 
        ADC #$00
        ROL 
        ADC #$00
        AND #$07
        ADC scrollingPyraimdsLoPtr
        STA scrollingPyraimdsLoPtr
        LDA #$C0
        SEC 
        SBC scrollingPyraimdsLoPtr
        STA updatedXPosition
        JMP b2085

b206F   LDA aaDC
        CLC 
        ADC shipSpeed
        STA aaDC
        LDA aDD
        ADC #$00
        CMP #$12
        BNE b2080
        LDA #$FF
b2080   STA aDD
        JMP j204D

b2085   LDA FLPTR
        CMP #$01
        BNE b208C
        RTS 

b208C   LDX #$00
b208E   LDA a1F37
        SEC 
        SBC aaDC
        STA scrollingPyraimdsLoPtr
        LDA f1F38,X
        SBC aDD
        BEQ b20B0
        INX 
        CPX #$06
        BNE b208E
        LDA #$00
        STA $D001    ;HPOSP1
        STA $D002    ;HPOSP2
        STA $D003    ;HPOSP3
        STA aF4
        RTS 

b20B0   LDA scrollingPyraimdsLoPtr
        EOR #$FF
        STA $D001    ;HPOSP1
        CLC 
        ADC #$10
        STA $D002    ;HPOSP2
        CLC 
        ADC #$10
        STA $D003    ;HPOSP3
        CLC 
        ADC #$06
        STA aF4

        LDA aEA
        BEQ b20D8
        TXA 
        CMP aE8
        BEQ b20D8
        LDA FLPTR
        BNE b20D8
        JMP j230B

b20D8   STX aE8
        LDA f1F44,X
        ASL 
        ADC #$00
        ASL 
        ADC #$00
        ASL 
        ADC #$00
        ASL 
        ADC #$00
        STA scrollingPyraimdsLoPtr
        AND #$0F
        STA aE4
        LDA scrollingPyraimdsLoPtr
        AND #$F0
        STA scrollingPyraimdsLoPtr
        LDA aE5
        AND #$0F
        ORA scrollingPyraimdsLoPtr
        STA aE5
b20FD   RTS 

;-------------------------------------------------------------------------
; UpdateCamelYPosition
;-------------------------------------------------------------------------
UpdateCamelYPosition
        LDA aEA
        BEQ b2105
        JMP j2255

b2105   LDA FLPTR
        BEQ b2111
        CMP #$01
        BEQ b210E
        RTS 

b210E   JMP ClearCamelSpriteMemory

b2111   DEC camelSpeed
        BNE b20FD
        LDA camelRadarSpeed
        STA camelSpeed
        DEC aF9
        LDA aF9
        AND #$07
        CMP #$01
        BNE b2126
        LDA #$07
b2126   STA aF9
        STA $D207    ;POT7
        LDA #$30
        STA $D206    ;POT6
        LDY #$00
        LDA #$DC
        STA scrollingPyraimdsLoPtr

b2136   TYA 
        PHA 
        LDA (aE2),Y
        LDX scrollingPyraimdsLoPtr
        STA camelSpriteMemory1,X
        DEX 
        STA camelSpriteMemory1,X
        DEX 
        STA camelSpriteMemory1,X
        TYA 
        CLC 
        ADC #$15
        TAY 
        LDA (aE2),Y
        LDX scrollingPyraimdsLoPtr
        STA camelSpriteMemory2,X
        DEX 
        STA camelSpriteMemory2,X
        DEX 
        STA camelSpriteMemory2,X
        TYA 
        CLC 
        ADC #$15
        TAY 
        LDA (aE2),Y
        LDX scrollingPyraimdsLoPtr
        STA camelSpriteMemory3,X
        DEX 
        STA camelSpriteMemory3,X
        DEX 
        STA camelSpriteMemory3,X
        LDA scrollingPyraimdsLoPtr
        SEC 
        SBC #$03
        STA scrollingPyraimdsLoPtr
        PLA 
        TAY 
        INY 
        CPY #$15
        BNE b2136

        LDA aE2
        CLC 
        ADC #$3F
        STA aE2

        LDA aE3
        ADC #$00
        STA aE3

        LDY #$00
        LDA (aE2),Y
        CMP #$FF
        BEQ b2193

        RTS 

b2193   LDA #<p152D
        STA aE2
        LDA #>p152D
        STA aE3
        RTS 

;-------------------------------------------------------------------------
; FlashingOfPlayerAndCamels
;-------------------------------------------------------------------------
FlashingOfPlayerAndCamels
        LDA aE4
        CMP #$0F
        BNE b21AB
        LDA aE5
        ORA #$0F
        STA aE5
        JMP j21BF

b21AB   LDA FR2
        BNE b21CB
        DEC aE5
        LDA aE5
        AND #$0F
        CMP aE4
        BNE j21BF
        LDA FR2
        EOR #$FF
        STA FR2

j21BF
        LDA aE5
        STA PCOLR1   ;PCOLR1  shadow for COLPM1 ($D013)
        STA PCOLR2   ;PCOLR2  shadow for COLPM2 ($D014)
        STA PCOLR3   ;PCOLR3  shadow for COLPM3 ($D015)
        RTS 

b21CB   INC aE5
        LDA aE5
        AND #$0F
        CMP #$0F
        BNE j21BF
        LDA FR2
        EOR #$FF
        STA FR2
        JMP j21BF

;-------------------------------------------------------------------------
; UpdateTheRadarView
;-------------------------------------------------------------------------
UpdateTheRadarView
        DEC currentCamalRadarSpeed
        BNE b2203
        LDA camelRadarSpeed
        STA currentCamalRadarSpeed
        LDA FLPTR
        BNE b2203
        INC CIX      ;CIX     
        LDA CIX      ;CIX     
        CMP #$40
        BNE b21F6
        JSR UpdateCamelRadar
b21F6   DEC a1F37
        DEC a1F37
        LDA a1F37
        CMP #$FE
        BEQ b2204
b2203   RTS 

b2204   LDX #$00
b2206   LDA f1F38,X
        AND #$80
        BNE b2210
        DEC f1F38,X
b2210   INX 
        CPX #$06
        BNE b2206
        RTS 

;-------------------------------------------------------------------------
; s2216
;-------------------------------------------------------------------------
s2216
        LDA FLPTR
        BNE b2241
        LDX aE8
        LDA currentCamelPositionOnRadarArray,X
        TAY 
        LDA #$FF
        STA currentCamelPositionOnRadarArray,X
        LDA #$00
        STA radarLine,Y
        DEC aFD
        BNE b223D
        LDA #$F0
        STA FLPTR
        JSR ResetSoundChannels
        LDA #$00
        STA a2400
        STA a2403
b223D   LDA #$9D
        BNE b2246
b2241   LDA currentYPosition
        SEC 
        SBC #$0A
b2246   STA aEB
        LDA #<pBE01
        STA FPCOC
        LDA #>pBE01
        STA FPTEM1
        LDA #$FF
        STA aEA
        RTS 

;-------------------------------------------------------------------------
; j2255
;-------------------------------------------------------------------------
j2255
        LDA aEB
        STA scrollingPyraimdsLoPtr
        SEC 
        SBC FPCOC
        STA scrollingPyramidsHiPtr
        LDA #$BF
        SBC FPTEM1
        STA $D204    ;POT4
        LDA #$0F
        STA $D205    ;POT5
        INC aEF
        LDA scrollingPyramidsHiPtr
        AND #$F0
        BEQ b2279
        CMP #$F0
        BEQ b2279
        JMP j22AA

b2279   LDA aEB
        CLC 
        ADC FPCOC
        STA aEB
        DEC FPCOC
        LDA scrollingPyraimdsLoPtr
        ADC FPCOC
        TAY 
        INY 
        LDA #$00
        LDA FLPTR
        CMP #$FF
        BNE b2298
        LDA #$00
        STA shipSpriteMemory,Y
        JMP j22A3

b2298   LDA #$00
        STA camelSpriteMemory1,Y
        STA camelSpriteMemory2,Y
        STA camelSpriteMemory3,Y
;-------------------------------------------------------------------------
; j22A3
;-------------------------------------------------------------------------
j22A3
        DEC FPTEM1
        BNE j2255
        JMP j230B

;-------------------------------------------------------------------------
; j22AA
;-------------------------------------------------------------------------
j22AA
        LDA scrollingPyramidsHiPtr
        STA aEB
        LDA FPCOC
        PHA 
;-------------------------------------------------------------------------
; j22B1
;-------------------------------------------------------------------------
j22B1
        DEC FPCOC
        BNE b22BB
b22B5   PLA 
        STA FPCOC
        INC FPCOC
        RTS 

b22BB   LDA scrollingPyraimdsLoPtr
        CLC 
        ADC FPCOC
        STA scrollingPyraimdsLoPtr
        INC scrollingPyraimdsLoPtr
        LDA scrollingPyraimdsLoPtr
        SEC 
        SBC FPCOC
        STA scrollingPyramidsHiPtr
        LDA scrollingPyraimdsLoPtr
        CMP #$FC
        BEQ b22B5
        JSR ChangeCamelVerticalPosition
        JMP j22B1

;-------------------------------------------------------------------------
; ChangeCamelVerticalPosition
;-------------------------------------------------------------------------
ChangeCamelVerticalPosition
        LDX scrollingPyraimdsLoPtr
        LDY scrollingPyramidsHiPtr
        LDA FLPTR
        CMP #$FF
        BEQ b22FF
        LDA camelSpriteMemory1,X
        STA camelSpriteMemory1,Y
        LDA camelSpriteMemory2,X
        STA camelSpriteMemory2,Y
        LDA camelSpriteMemory3,X
        STA camelSpriteMemory3,Y
        LDA #$00
        STA camelSpriteMemory1,X
        STA camelSpriteMemory2,X
        STA camelSpriteMemory3,X
        RTS 

b22FF   LDA shipSpriteMemory,X
        STA shipSpriteMemory,Y
        LDA #$00
        STA shipSpriteMemory,X
        RTS 

;-------------------------------------------------------------------------
; j230B
;-------------------------------------------------------------------------
j230B
        LDA FLPTR
        CMP #$FF
        BEQ b2318
;-------------------------------------------------------------------------
; s2311
;-------------------------------------------------------------------------
s2311
        LDY aE8
        LDA #$80
        STA f1F38,Y
b2318   LDA #$00
        STA aEA
        STA $D205    ;POT5
        LDA FLPTR
        CMP #$FF
        BEQ b2334
        LDY #$00
        TYA 
b2328   STA camelSpriteMemory1,Y
        STA camelSpriteMemory2,Y
        STA camelSpriteMemory3,Y
        INY 
        BNE b2328
b2334   RTS 

;-------------------------------------------------------------------------
; s2335
;-------------------------------------------------------------------------
s2335
        DEC FPTEM2
        BNE b2334
        LDA #$30
        STA FPTEM2
        JSR PlayASound1
        LDA aF0
        BEQ b2334
        TAY 
        LDA f2368,Y
        ORA #$C0
        STA $D205    ;POT5
        LDA aEF
        STA $D204    ;POT4
        INC aEF
        LDA aEF
        CMP #$06
        BNE b2334
        LDA #$F0
        STA aEF
        DEC aF0
        BNE b2334
        LDA #$00
        STA $D205    ;POT5
        RTS 

f2368   .BYTE $00,$05,$08
        .BYTE $0C,$0F
;-------------------------------------------------------------------------
; UpdateCamelRadar
;-------------------------------------------------------------------------
UpdateCamelRadar
        LDX #$00
        LDA #$00
        STA CIX      ;CIX     
b2373   LDA currentCamelPositionOnRadarArray,X
        TAY 
        CMP #$FF
        BEQ b2390
        LDA #$00
        STA radarLine,Y
        INY 
        INC currentCamelPositionOnRadarArray,X
        LDA #CAMEL
        STA radarLine,Y
        CPY #$29
        BNE b2390

        JMP WriteYouAreOverrunText

b2390   INX 
        CPX #$06
        BNE b2373
        RTS 

;-------------------------------------------------------------------------
; s2396
;-------------------------------------------------------------------------
s2396
        LDX #$00
b2398   LDA FLPTR
        CMP #$FF
        BEQ b23C0
        LDA f1F3E,X
        STA f1F38,X
        LDY currentCamelPositionOnRadarArray,X
        LDA #$00
        STA radarLine,Y
        STA a1F37
        LDA f1F50,X
        STA currentCamelPositionOnRadarArray,X
        TAY 
        LDA #$44
        STA radarLine,Y
        LDA #$F0
        STA f1F44,X
b23C0   LDA #$10
        STA f1C29,X
        LDA #$04
        STA f1C2F,X
        LDA #$08
        STA f1C50,X
        LDA #$00
        STA f1C23,X
        INX 
        CPX #$06
        BNE b2398
        LDA FLPTR
        BNE b23F8
        JMP ResetScrollingPyramids

;-------------------------------------------------------------------------
; ResetPlayer1AndPlayer2
;-------------------------------------------------------------------------
ResetPlayer1AndPlayer2
        LDX #$07
b23E2   LDA #$10
        STA currentScore1,X
        STA currentScore2,X
        DEX 
        BNE b23E2
        LDA #$15
        STA player1LivesText
        STA player2LivesText
        JSR ClearMessageAndRadarLine
b23F8   LDA #$19
        STA currentShieldText
        JMP ResetScrollingPyramids

a2400   .BYTE $00
a2401   .BYTE $00
a2402   .BYTE $00
a2403   .BYTE $02
a2404   .BYTE $01
a2405   .BYTE $01
a2406   .BYTE $00
a2407   .BYTE $01
a2408   .BYTE $03
a2409   .BYTE $01
a240A   .BYTE $00
a240B   .BYTE $01
a240C   .BYTE $01

;-------------------------------------------------------------------------
; j240D
;-------------------------------------------------------------------------
j240D
        LDA a2400
        STA $D007    ;HPOSM3
        CLC 
        ADC #$02
        STA $D006    ;HPOSM2
        LDY a2402
        LDX #$06
b241E   LDA yPositionArray,Y
        AND #$0F
        STA yPositionArray,Y
        INY 
        DEX 
        BNE b241E
        LDA a2401
        STA a2402
        TAY 
        LDX #$06
b2433   LDA f25DD,X
        ORA yPositionArray,Y
        STA yPositionArray,Y
        INY 
        DEX 
        BNE b2433
b2440   RTS 

;-------------------------------------------------------------------------
; s2441
;-------------------------------------------------------------------------
s2441
        DEC aF5
        BNE b2440
        LDA a2BA6
        STA aF5
        LDA a2403
        BNE b2452
        JSR s255A
b2452   JSR s2456
        RTS 

;-------------------------------------------------------------------------
; s2456
;-------------------------------------------------------------------------
s2456
        LDA aF8
        BEQ b2474
        INC aF8
        LDA aF8
        CMP #$20
        BNE b246C
        LDA #$00
        STA aF8
        STA $D205    ;POT5
        JMP b2474

b246C   STA $D204    ;POT4
        LDA #$C8
        STA $D205    ;POT5
b2474   LDA a2403
        CMP #$01
        BEQ b247E
        JMP j250D

b247E   LDA a2400
        CLC 
        ADC a2404
        STA a2400
        AND #$F0
        BEQ b2493
        CMP #$10
        BEQ b2493
        JMP j24A1

b2493   LDA #$00
        STA a2403
        STA a2401
        STA aF8
        STA $D205    ;POT5
b24A0   RTS 

;-------------------------------------------------------------------------
; j24A1
;-------------------------------------------------------------------------
j24A1
        DEC a2409
        BNE b24A0
        LDA a2408
        STA a2409
        LDA a2401
        CMP currentYPosition
        BMI b24E8
        LDA a2407
        BEQ b24CB
        LDA a2405
        BEQ b24CB
        DEC a2405
;-------------------------------------------------------------------------
; j24C0
;-------------------------------------------------------------------------
j24C0
        LDA a2405
        CLC 
        ADC a2401
        STA a2401
        RTS 

b24CB   LDA #$00
        STA a2407
        INC a2405
        LDA a2405
        CMP #$06
        BNE b24DD
        DEC a2405
b24DD   LDA a2401
        SEC 
        SBC a2405
        STA a2401
        RTS 

b24E8   LDA a2407
        BNE b24F8
        LDA a2405
        BEQ b24F8
        DEC a2405
        JMP b24DD

b24F8   LDA #$01
        STA a2407
        INC a2405
        LDA a2405
        CMP #$06
        BNE b250A
        DEC a2405
b250A   JMP j24C0

;-------------------------------------------------------------------------
; j250D
;-------------------------------------------------------------------------
j250D
        CMP #$02
        BEQ b2514
        JMP j25F3

b2514   LDA a2404
        CLC 
        ADC a2400
        STA a2400
        AND #$F0
        BEQ b2529
        CMP #$10
        BEQ b2529
        JMP j2532

b2529   LDA #$00
        STA a2403
        STA a2401
b2531   RTS 

;-------------------------------------------------------------------------
; j2532
;-------------------------------------------------------------------------
j2532
        DEC a2409
        BNE b2531
        LDA a2408
        STA a2409
        LDA a2401
        CMP currentYPosition
        BMI b254F
        LDA a2401
        SEC 
        SBC a2405
        STA a2401
        RTS 

b254F   LDA a2401
        CLC 
        ADC a2405
        STA a2401
b2559   RTS 

;-------------------------------------------------------------------------
; s255A
;-------------------------------------------------------------------------
s255A
        LDA aF4
        BEQ b2559
        AND #$F0
        CMP #$20
        BEQ b2559
        CMP #$10
        BEQ b2559
        LDA aEA
        BNE b2559
        LDA #$01
        STA aF8
        DEC a26AD
        BNE b2588
        INC INBUFF   ;INBUFF  
        LDA INBUFF   ;INBUFF  
        CMP #$04
        BNE b2581
        LDA #$01
        STA INBUFF   ;INBUFF  
b2581   TAX 
        LDA f26AE,X
        STA a26AD
b2588   LDA INBUFF   ;INBUFF  
        CMP #$01
        BNE b25CA
        STA a2403
        LDA #$00
        STA a2405
        JSR GetAPseudoRandomValue
        AND a25F1
        ORA a25F2
        STA a2408
;-------------------------------------------------------------------------
; j25A2
;-------------------------------------------------------------------------
j25A2
        LDA #$A0
        STA a2401
        LDA aF4
        STA a2400
        CMP currentXPosition
        BMI b25BE
        JSR GetAPseudoRandomValue
        AND a25F0
        ORA #$01
        EOR #$FF
        STA a2404
        RTS 

b25BE   JSR GetAPseudoRandomValue
        AND a25F0
        ORA #$01
        STA a2404
        RTS 

b25CA   CMP #$02
        BEQ b25D1
        JMP j2676

b25D1   STA a2403
        LDA a25F0
        STA a2405
        JMP j25A2

f25DD   .BYTE $00,$60,$F0,$60,$60,$F0,$60
;-------------------------------------------------------------------------
; GetAPseudoRandomValue
;-------------------------------------------------------------------------
GetAPseudoRandomValue
        INC aF6
        STX aFF
        LDX aF6
        LDA f1A00,X
        LDX aFF
b25EF   RTS 

a25F0   .BYTE $03
a25F1   .BYTE $07
a25F2   .BYTE $04
;-------------------------------------------------------------------------
; j25F3
;-------------------------------------------------------------------------
j25F3
        CMP #$03
        BNE b25EF
        JSR j24A1
        DEC a240B
        BEQ b2600
        RTS 

b2600   LDA a240A
        STA a240B
        LDA a2400
        CMP currentXPosition
        BPL b2648
        LDA a240C
        BNE b2629
        LDA a2404
        BEQ b2629
        DEC a2404
b261A   LDA a2404
        EOR #$FF
        CLC 
        ADC a2400
        STA a2400
        JMP j266D

b2629   LDA #$01
        STA a240C
        INC a2404
        LDA a2404
        CMP #$07
        BNE b263B
        DEC a2404
b263B   LDA a2400
        CLC 
b2641   =*+$02
        ADC a2404
b2644   =*+$02
        STA a2400
        JMP j266D

b2648   LDA a240C
        BEQ b2658
        LDA a2404
        BEQ b2658
        DEC a2404
        JMP b263B

b2658   LDA #$00
        STA a240C
        INC a2404
        LDA a2404
        CMP #$07
        BNE b261A
        DEC a2404
        JMP b261A

;-------------------------------------------------------------------------
; j266D
;-------------------------------------------------------------------------
j266D
        DEC a2406
        BEQ b2673
        RTS 

b2673   JMP b2493

;-------------------------------------------------------------------------
; j2676
;-------------------------------------------------------------------------
j2676
        STA a2403
        LDA aF4
        SEC 
        SBC #$28
        STA a2400
        CMP #$30
        BMI b2673
        LDA #$B0
        STA a2401
        LDA #$40
        STA a2406
        JSR GetAPseudoRandomValue
        AND a25F1
        ORA a25F2
        STA a240B
        STA a240A
        STA a2409
        STA a2408
        LDA #$00
        STA a2405
        STA a2404
        RTS 

a26AD   .BYTE $04
f26AE   .BYTE $00,$04,$06,$03
;-------------------------------------------------------------------------
; IncrementCurrentPlayerScore
;-------------------------------------------------------------------------
IncrementCurrentPlayerScore
        CLC 
        ADC currentPlayerOffset
        TAX 
b26B6   TXA 
        PHA 
b26B8   INC score1Label,X
        LDA score1Label,X
        CMP #$1A
        BNE b26CA
        LDA #$10
        STA score1Label,X
        DEX 
        BNE b26B8
b26CA   PLA 
        TAX 
        DEY 
        BNE b26B6
        RTS 

;-------------------------------------------------------------------------
; UpdateCamelsLeftText
;-------------------------------------------------------------------------
UpdateCamelsLeftText
        LDA #$10
        LDX #$04
b26D4   STA camelsLeftText - $01,X
        DEX 
        BNE b26D4

        LDX #$01
        LDY DEGFLG
b26DE   TXA 
        PHA 

j26E0
        INC camelsLeftText,X
        LDA camelsLeftText,X
        CMP #$1A
        BNE b26F3
        LDA #$10
        STA camelsLeftText,X
        DEX 
        JMP j26E0

b26F3   PLA 
        TAX 
        DEY 
        BNE b26DE
        RTS 

;-------------------------------------------------------------------------
; DecrementCurrentPlayerLives
;-------------------------------------------------------------------------
DecrementCurrentPlayerLives
        LDA currentPlayerOffset
        CMP #$0E
        BNE b2708
        DEC player1LivesText
        LDA player1LivesText
        JMP j270E

b2708   DEC player2LivesText
        LDA player2LivesText

j270E
        JSR MaybeSwitchCurrentPlayer
        BEQ b2714
        RTS 

b2714   LDX #$F8
        TXS 
        JMP WriteGameOverTextAndRestart

;-------------------------------------------------------------------------
; ResetSoundChannels
;-------------------------------------------------------------------------
ResetSoundChannels
        LDA #$00
        STA $D201    ;POT1
        STA $D203    ;POT3
        STA $D205    ;POT5
        STA $D207    ;POT7
        RTS 

;-------------------------------------------------------------------------
; MaybePerformWarp
;-------------------------------------------------------------------------
MaybePerformWarp
        LDA aEA
        BNE MaybePerformWarp
        LDA #$00
        STA shipSpeed
        STA shipDirection
        STA bulletXPosition
        STA $D005    ;HPOSM1
        LDA #$C0
        STA currentXPosition
        STA $D004    ;HPOSM0
        JSR ResetSoundChannels
        LDA #<pA080
        STA aD5
        LDA #>pA080
        STA aD6
        LDA #<pE0C0
        STA aEF
        LDA #>pE0C0
        STA aF0
        LDA #$E8
        STA $D201    ;POT1
        STA $D203    ;POT3
        STA $D205    ;POT5
        STA $D207    ;POT7
;-------------------------------------------------------------------------
; j2760
;-------------------------------------------------------------------------
j2760
        DEC aD5
        LDA aD5
        CMP #$20
        BNE b276A
        INC aD5
b276A   EOR #$FF
        STA $D200    ;POT0
        DEC aD6
        LDA aD6
        CMP #$21
        BNE b2779
        INC aD6
b2779   EOR #$FF
        STA $D202    ;POT2
        DEC aEF
        LDA aEF
        CMP #$22
        BNE b2788
        INC aEF
b2788   EOR #$FF
        STA $D204    ;POT4
        DEC aF0
        LDA aF0
        CMP #$23
        BEQ b27A7
        EOR #$FF
        STA $D206    ;POT6
        LDX #$08
b279C   LDY #$00
b279E   DEY 
        BNE b279E
        DEX 
        BNE b279C
        JMP j2760

b27A7   EOR #$FF
        STA $D206    ;POT6
        LDX #$00
b27AE   DEY 
        BNE b27AE
        DEX 
        BNE b27AE
        LDA #$01
        STA $D208    ;AUDCTL
        LDX #$00
b27BB   LDA warpMessageText,X
        STA radarLine,X
        INX 
        CPX #$30
        BNE b27BB
        JMP j27FA

.enc "atascii"  ;define an ascii->atascii encoding
        .cdef " Z", $00
.enc "none"

.enc "atascii" 
warpMessageText   
        .TEXT '         PREPARE FOR'
        .TEXT ' HYPERWARP ACTIVATIO'
        .TEXT 'N        '
.enc "none"
;-------------------------------------------------------------------------
; j27FA
;-------------------------------------------------------------------------
j27FA
        LDA #$06
        STA aD5
b27FE   DEY 
        BNE b27FE
        DEX 
        BNE b27FE
        DEC aD5
        BNE b27FE
        TXA 
        STA $D203    ;POT3
        STA $D205    ;POT5
        STA $D207    ;POT7
        STA $D208    ;AUDCTL
        JSR s2A1B
        LDA #$01
        STA FLPTR
        LDA #$8A
        STA $D201    ;POT1
        LDA #$06
        STA aD5
;-------------------------------------------------------------------------
; j2825
;-------------------------------------------------------------------------
j2825
        DEC currentXPosition
        JSR s2A57
        LDA currentXPosition
        STA $D004    ;HPOSM0
        CMP #$40
        BEQ b2853
        SBC #$20
        STA $D200    ;POT0
        DEC aD5
        BNE b2848
        LDA shipSpeed
        CMP #$0F
        BEQ b2848
        INC shipSpeed
        LDA #$06
        STA aD5
b2848   LDX #$40
b284A   DEY 
        BNE b284A
        DEX 
        BNE b284A
        JMP j2825

b2853   LDA #$01
        STA $D008    ;SIZEP0
        JSR WriteHyperTransitionText
        LDA #$E8
        STA $D201    ;POT1
;-------------------------------------------------------------------------
; j2860
;-------------------------------------------------------------------------
j2860
        DEC currentXPosition
        LDY currentDifficultyLevel
        INY 
        LDA #$04
        JSR IncrementCurrentPlayerScore
        LDA currentXPosition
        CMP #$10
        BEQ b288D
        STA $D004    ;HPOSM0
        LDA #$00
        STA aD5
b2878   LDA aD5
        STA $D200    ;POT0
        LDY #$80
b287F   DEY 
        BNE b287F
        INC aD5
        LDA aD5
        CMP #$50
        BNE b2878
        JMP j2860

b288D   LDA a2A9A
        CLC 
        ADC #$F0
        STA a2A9A
        INC currentDifficultyLevel
        LDA currentDifficultyLevel
        CMP #$19
        BNE b28A5
        LDA #$12
        STA currentDifficultyLevel
b28A5   JSR ResetSoundChannels
        JSR ClearMessageAndRadarLine
        LDA #$00
        STA $D008    ;SIZEP0
        JMP SetUpTitleScreen

;-------------------------------------------------------------------------
; WriteHyperTransitionText
;-------------------------------------------------------------------------
WriteHyperTransitionText
        LDX #$00
b28B5   LDA hyperTransitionActivatedText,X
        STA radarLine,X
        INX 
        CPX #$30
        BNE b28B5
        RTS 

;-------------------------------------------------------------------------
; ClearMessageAndRadarLine
;-------------------------------------------------------------------------
ClearMessageAndRadarLine
        LDX #$00
b28C3   LDA #$00
        STA radarLine,X
        STA messageLine,X
        INX 
        CPX #$30
        BNE b28C3
        STA $D008    ;SIZEP0
        RTS 

.enc "atascii" 
hyperTransitionActivatedText   
        .TEXT '           HYPER TRA'
        .TEXT 'NSITION ACTIVATED   '
        .TEXT '      '
.enc "none"

xPositionArray   .BYTE $50,$C8,$78
a2905   .BYTE $64
a2906   .BYTE $A0
a2907   .BYTE $C8
a2908   .BYTE $64
a2909   .BYTE $A0
a290A   .BYTE $C8
f290B   .BYTE $01,$02,$03
f290E   .BYTE $00,$00,$00
f2911   .BYTE $03,$04,$05
f2914   .BYTE $01,$01,$01
a2917   .BYTE $01
a2918   .BYTE $06
a2919   .BYTE $01
a291A   .BYTE $06
a291B   .BYTE $01
f291C   .BYTE $F8,$C0,$F0,$FF,$F0,$C0,$F8,$00
f2924   .BYTE $00,$F8,$C0,$FF,$C0,$F8,$00,$00
f292C   .BYTE $00,$C0,$F8,$FF,$F8,$C0,$00,$00
;-------------------------------------------------------------------------
; ClearCamelSpriteMemory
;-------------------------------------------------------------------------
ClearCamelSpriteMemory
        LDX #$00
b2936   LDA xPositionArray,X
        STA $D001,X  ;HPOSP1
        INX 
        CPX #$03
        BNE b2936

        LDX #$00
        TXA 
        LDY a2908
b2947   STA camelSpriteMemory1,Y
        INY 
        DEX 
        BNE b2947

        LDX #$08
        LDY a2909
b2953   STA camelSpriteMemory2,Y
        INY 
        DEX 
        BNE b2953

        LDX #$08
        LDY a290A
b295F   STA camelSpriteMemory3,Y
        INY 
        DEX 
        BNE b295F

        LDX #$00
b2968   LDA a2917
        BNE b2973

        LDA f291C,X
        JMP j2980

b2973   CMP #$02
        BEQ b297D

        LDA f2924,X
        JMP j2980

b297D   LDA f292C,X
;-------------------------------------------------------------------------
; j2980
;-------------------------------------------------------------------------
j2980
        PHA 
        TXA 
        CLC 
        ADC a2905
        TAY 
        PLA 
        STA camelSpriteMemory1,Y
        PHA 
        TXA 
        CLC 
        ADC a2906
        TAY 
        PLA 
        STA camelSpriteMemory2,Y
        PHA 
        TXA 
        CLC 
        ADC a2907
        TAY 
        PLA 
        STA camelSpriteMemory3,Y
        INX 
        CPX #$08
        BNE b2968
        DEC a2918
        BEQ b29AD
        BNE b29CE
b29AD   LDA #$06
        STA a2918
        INC aD6
        LDA aD6
        STA $D013    ;TRIG3
        STA $D014    ;PAL
        STA $D015    ;COLPM3
        INC a2917
        LDA a2917
        CMP #$03
        BNE b29CE
        LDA #$00
        STA a2917
b29CE   LDX #$00
b29D0   LDA a2905,X
        STA a2908,X
        LDA xPositionArray,X
        CLC 
        ADC f290B,X
        STA xPositionArray,X
        AND #$F0
        CMP #$F0
        BNE b29EB
        LDA currentYPosition
        STA a2905,X
b29EB   DEC f2914,X
        BNE b2A15
        LDA f2911,X
        STA f2914,X
        LDA currentYPosition
        CLC 
        SBC #$05
        CMP a2905,X
        BMI b2A06
        LDA a2905,X
        JMP j2A0F

b2A06   LDA a2905,X
        SBC f290E,X
        SBC f290E,X
;-------------------------------------------------------------------------
; j2A0F
;-------------------------------------------------------------------------
j2A0F
        ADC f290E,X
        STA a2905,X
b2A15   INX 
        CPX #$03
        BNE b29D0
        RTS 

;-------------------------------------------------------------------------
; s2A1B
;-------------------------------------------------------------------------
s2A1B
        LDX #$00
b2A1D   LDA #$00
        STA xPositionArray,X
        LDA #$01
        STA f2914,X
        TXA 
        CLC 
        ADC a2919
        STA f290B,X
        TXA 
        CLC 
        ADC a291A
        STA f2911,X
        LDA a291B
        STA f290E,X
        JSR GetAPseudoRandomValue
        AND #$1F
        SBC #$10
        ADC currentYPosition
        STA a2905,X
        INX 
        CPX #$03
        BNE b2A1D
        LDA #$01
        STA a2917
        STA a2918
        RTS 

;-------------------------------------------------------------------------
; s2A57
;-------------------------------------------------------------------------
s2A57
        LDA FPTR2
        AND #$0F
        BNE b2A5E
        RTS 

b2A5E   LDA #$FF
        STA FLPTR
        STA $D004    ;HPOSM0
        JSR WriteFatalPreJumpImpactText
        JSR ResetSoundChannels
        LDA #$00
        STA shipSpeed
        JSR s2216
b2A72   LDA aEA
        BNE b2A72
        JSR ResetSoundChannels
        JSR ClearMessageLine
        LDA #$00
        STA CIX      ;CIX     
        STA FLPTR
        LDA #$06
        STA aFD
        JSR s2396
        LDA #$19
        STA currentShieldText
        JSR DecrementCurrentPlayerLives
        LDX #$F8
        TXS 
        JMP b1871

        JMP b28A5

a2A9A   .BYTE $00
;-------------------------------------------------------------------------
; WriteFatalPreJumpImpactText
;-------------------------------------------------------------------------
WriteFatalPreJumpImpactText
        LDX #$00
b2A9D   LDA fatalPreJumpImpactText,X
        STA messageLine + $0F,X
        INX 
        CPX #$15
        BNE b2A9D
        RTS 

.enc "atascii" 
fatalPreJumpImpactText   
        .TEXT 'FATAL PRE-JUMP IMPACT'
.enc "none"
currentDifficultyLevel   .BYTE $00
camelSpeedsPerDifficulty   
        .BYTE $08,$06,$06,$04,$04,$04,$03,$04
        .BYTE $04,$03,$03,$02,$04,$03,$03,$03
        .BYTE $03,$03,$02,$04,$03,$02,$02,$01
        .BYTE $01
f2AD8   .BYTE $70,$70,$70,$70,$70,$70,$70,$60
        .BYTE $60,$60,$60,$60,$50,$50,$50,$50
        .BYTE $50,$40,$40,$40,$40,$30,$30,$20
        .BYTE $20,$30
f2AF2   .BYTE $0F,$0E,$0C,$0A,$07,$07,$0E,$0E
        .BYTE $0C,$0A,$07,$0F,$0E,$0D,$07,$07
        .BYTE $07,$06,$05,$04,$03,$02,$02,$02
        .BYTE $01,$01,$01
f2B0D   .BYTE $07,$07,$07,$07,$06,$06,$06,$06
        .BYTE $05,$05,$05,$05,$04,$04,$04,$03
        .BYTE $03,$03,$02,$02,$02,$02,$02,$02
        .BYTE $01
f2B26   .BYTE $01,$02,$01,$02,$02,$03,$02,$03
        .BYTE $03,$02,$02,$02,$02,$02,$03,$02
        .BYTE $03,$02,$03,$02,$03,$02,$03,$02
        .BYTE $03
f2B3F   .BYTE $06,$06,$06,$06,$05,$05,$05,$05
        .BYTE $04,$04,$04,$04,$03,$03,$03,$02
        .BYTE $02,$02,$02,$02,$02,$01,$01,$01
        .BYTE $01
f2B58   .BYTE $01,$02,$03,$03,$01,$02,$03,$03
        .BYTE $01,$02,$03,$04,$01,$02,$03,$04
        .BYTE $02,$03,$04,$05,$03,$04,$05,$06
        .BYTE $07
;-------------------------------------------------------------------------
; GetGameSettingsForDifficultyLevel
;-------------------------------------------------------------------------
GetGameSettingsForDifficultyLevel
        LDX currentDifficultyLevel
        LDA camelSpeedsPerDifficulty,X
        STA camelSpeed
        STA currentCamalRadarSpeed
        STA camelRadarSpeed

        LDA f2AD8,X
        STA a2BA6
        STA aF5

        LDA f2AF2,X
        STA a25F1

        LDA f2B0D,X
        STA a25F2

        LDA f2B26,X
        STA a25F0

        LDA f2B3F,X
        STA a291A

        LDA f2B58,X
        STA a2919

        RTS 

camelRadarSpeed   .BYTE $00
a2BA6   .BYTE $00
a2BA7   .BYTE $00
;-------------------------------------------------------------------------
; PlayASound1
;-------------------------------------------------------------------------
PlayASound1
        LDA a2BA7
        BNE b2BAE
        RTS 

b2BAE   INC a2BA7
        LDA #$8F
        STA $D201    ;POT1
        LDA a2BA7
        STA $D200    ;POT0
        CMP #$66
        BEQ b2BC1
        RTS 

b2BC1   LDA #$00
        STA a2BA7
        STA $D201    ;POT1
        RTS 

;-------------------------------------------------------------------------
; SetUpTitleScreenInterrupts
;-------------------------------------------------------------------------
SetUpTitleScreenInterrupts
        LDA #$00
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)

        LDA #<titleScreenDisplayList
        STA SDLSTL   ;SDLSTL  shadow for DLISTL ($D402)
        LDA #>titleScreenDisplayList
        STA SDLSTH   ;SDLSTH  shadow for DLISTH ($D403)

        ; Initialize Direct Memory access control first.
        LDA #$22
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)

        ; Use a normal playfield.
        LDA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)
        AND #$FC
        ORA #$02
        STA SDMCTL   ;SDMCTL  shadow for DMACTL ($D400)

        JSR ResetSoundChannels

        LDY #<TitleScreenVerticalBlankInterruptHandler
        LDX #>TitleScreenVerticalBlankInterruptHandler
        LDA #$07
        JSR SETBV    ;$E45C (jmp) SETBV

        ; Initialise the horizontal position of all
        ; player graphics.
        LDA #$00
        LDX #$00
b2BF8   STA $D000,X  ;HPOSP0
        STA $D004,X  ;HPOSM0
        INX 
        CPX #$04
        BNE b2BF8

        STA COLOR4   ;COLOR4  shadow for COLBK ($D01A)
        STA COLOR3   ;COLOR3  shadow for COLPF3 ($D019)
        STA COLOR2   ;COLOR2  shadow for COLPF2 ($D018)
        LDA #$0F
        STA COLOR1   ;COLOR1  shadow for COLPF1 ($D017)
        JMP SetUpTitleScreenVariables

;-------------------------------------------------------------------------
; TitleScreenVerticalBlankInterruptHandler
;-------------------------------------------------------------------------
TitleScreenVerticalBlankInterruptHandler
        STY a40
        LDY #$C0
        STX aFF
        INC aEF
        LDX aEF
b2C1E   STX $D40A    ;WSYNC
        STX $D016    ;COLPF0
        INX 
        DEY 
        BNE b2C1E
        LDX aFF
        LDY a40
        JMP XITBV    ;$E462 (jmp) XITBV

a2C2F   .BYTE $00
a2C30   .BYTE $00
offsetToDifficultyText   .BYTE $00
difficultyLevels   
.enc "atascii" 
        .TEXT "FER SURE     $GETTIN"
        .TEXT "' HEAVY(FAR OUT, MAN"
        .TEXT " .INTENSE      2LIKE"
        .TEXT " WOW!!!! 4REAL COOL "
        .TEXT "    "
.enc "none"
;-------------------------------------------------------------------------
; SetUpTitleScreenVariables
;-------------------------------------------------------------------------
SetUpTitleScreenVariables
        LDA #$03
        STA a2C30
        LDA #$13
        STA bulletStrengthText
        LDA #$01
        STA a2C2F
        LDA #$11
        STA numberOfPlayersText
        LDA #$50
        STA a2A9A
        LDA #$00
        STA offsetToDifficultyText

        LDX #$00
b2CA6   STA $D000,X  ;HPOSP0
        INX 
        CPX #$08
        BNE b2CA6

        LDA #$04
        STA currentDifficultyLevel
        JMP UpdateDifficultyLevel

TitleScreenInputLoop   
        LDA STRIG0   ;STRIG0  shadow for TRIG0 ($D001)
        BNE b2CBE
        JMP j2D36

b2CBE   LDA #$08
        STA $D01F    ;CONSOL
        LDA STICK0   ;STICK0  shadow for PORTA lo ($D300)
        AND #$08
        BNE b2CCD
        JMP UpdateBulletStrength

b2CCD   LDA $D01F    ;CONSOL
        BEQ TitleScreenInputLoop
        CMP #$03
        BNE MaybeUpdateDifficultyLevel

        INC numberOfPlayersText
        LDA numberOfPlayersText
        CMP #$13
        BNE b2CE5
        LDA #$11
        STA numberOfPlayersText
b2CE5   AND #$03
        STA a2C2F
        JMP j2D14

MaybeUpdateDifficultyLevel   
        CMP #$05
        BNE TitleScreenInputLoop

UpdateDifficultyLevel
        LDX offsetToDifficultyText
        LDY #$00
b2CF6   LDA difficultyLevels,X
        STA difficultyText,Y
        INX 
        INY 
        CPY #$0D
        BNE b2CF6
        LDA difficultyLevels,X
        STA currentDifficultyLevel
        INX 
        STX offsetToDifficultyText
        LDA currentDifficultyLevel
        BNE j2D14
        STA offsetToDifficultyText

j2D14
        LDY #$60
b2D16   DEX 
        BNE b2D16
        DEY 
        BNE b2D16
        JMP TitleScreenInputLoop

;-------------------------------------------------------------------------
; UpdateBulletStrength
;-------------------------------------------------------------------------
UpdateBulletStrength
        INC bulletStrengthText
        LDA bulletStrengthText
        CMP #$19
        BNE b2D2E
        LDA #$11
        STA bulletStrengthText
b2D2E   AND #$0F
        STA a2C30
        JMP j2D14

;-------------------------------------------------------------------------
; j2D36
;-------------------------------------------------------------------------
j2D36
        LDA currentDifficultyLevel
        BNE b2D3C
        RTS 

b2D3C   TAY 
        LDA a2A9A
b2D40   CLC 
        ADC #$F0
        DEY 
        BNE b2D40
        STA a2A9A
        RTS 

;-------------------------------------------------------------------------
; WriteYouAreOverrunText
;-------------------------------------------------------------------------
WriteYouAreOverrunText
        LDX #$00
b2D4C   LDA youAreOverrunText,X
        STA messageLine + $12,X
        INX 
        CPX #$0F
        BNE b2D4C

        LDA currentPlayerOffset
        CMP #$0E
        BNE b2D65
        LDA #$11
        STA player1LivesText
        JMP j1FF4

b2D65   LDA #$11
        STA player2LivesText
        JMP j1FF4

.enc "atascii" 
youAreOverrunText   
        .TEXT 'YOU ARE OVERRUN'
.enc "none"
;-------------------------------------------------------------------------
; WriteGameOverTextAndRestart
;-------------------------------------------------------------------------
WriteGameOverTextAndRestart
        LDX #$00
        TXA 
b2D7F   STA $D000,X  ;HPOSP0
        STA $D004,X  ;HPOSM0
        INX 
        CPX #$04
        BNE b2D7F
        JSR ClearMessageAndRadarLine
        LDA #$00
        TAX 
b2D90   LDA gameOverText,X
        STA messageLine + $14,X
        INX 
        CPX #$09
        BNE b2D90

        JSR ResetSoundChannels

        LDA #$A7
        STA $D201    ;POT1
        STA $D203    ;POT3
        STA $D205    ;POT5
        STA $D207    ;POT7

        LDA #$60
        STA aEF
b2DB0   JSR GetAPseudoRandomValue
        TAX 
        STX $D200    ;POT0
        INX 
        STX $D202    ;POT2
        INX 
        STX $D204    ;POT4
        INX 
        STX $D206    ;POT6
        LDX aEF
b2DC5   DEY 
        BNE b2DC5
        DEX 
        BNE b2DC5
        LDA aEF
        AND #$01
        STA $D208    ;AUDCTL
        DEC aEF
        BNE b2DB0

        LDX #$F8
        TXS 
        JMP WARMSV   ;$E474 (jmp) WARMSV

.enc "atascii" 
gameOverText   
        .TEXT 'GAME OVER'
.enc "none"
;-------------------------------------------------------------------------
; UpdateHighScore
;-------------------------------------------------------------------------
UpdateHighScore
        LDY #$00
        LDX currentPlayerOffset
b2DE9   LDA highScoreText,Y
        CMP score1Label,X
        BEQ b2DF6
        BMI b2DFD
        JMP j2DFC

b2DF6   INX 
        INY 
        CPY #$07
        BNE b2DE9
;-------------------------------------------------------------------------
; j2DFC
;-------------------------------------------------------------------------
j2DFC
        RTS 

b2DFD   LDX currentPlayerOffset
        LDY #$00
b2E01   LDA score1Label,X
        STA highScoreText,Y
        INX 
        INY 
        CPY #$07
        BNE b2E01
        RTS 

f2E0E   .BYTE $00,$00,$00,$00,$00,$00
a2E14   .BYTE $00
a2E15   .BYTE $00
;-------------------------------------------------------------------------
; MaybeSwitchCurrentPlayer
;-------------------------------------------------------------------------
MaybeSwitchCurrentPlayer
        JSR UpdateHighScore
        LDA a2C2F
        CMP #$01
        BNE b2E27
        LDA player1LivesText
        AND #$07
        RTS 

        RTS 

b2E27   LDA currentDifficultyLevel
        PHA 
        LDA a2E14
        STA currentDifficultyLevel
        PLA 
        STA a2E14
        LDA aFD
        PHA 
        LDA a2E15
        STA aFD
        PLA 
        STA a2E15
        LDX #$00
b2E43   LDA f1F38,X
        PHA 
        LDA f2E0E,X
        STA f1F38,X
        PLA 
        STA f2E0E,X
        LDA currentCamelPositionOnRadarArray,X
        PHA 
        TAY 
        CMP #$FF
        BEQ b2E5F
        LDA #$00
        STA radarLine,Y
b2E5F   LDA f2EA4,X
        STA currentCamelPositionOnRadarArray,X
        TAY 
        CMP #$FF
        BEQ b2E6F
        LDA #$44
        STA radarLine,Y
b2E6F   PLA 
        STA f2EA4,X
        LDA #$F0
        STA f1F44,X
        LDA #$50
        STA a2A9A
        JSR j2D36
        INX 
        CPX #$06
        BNE b2E43
        LDA CIX      ;CIX     
        PHA 
        LDA a2EA3
        STA CIX      ;CIX     
        PLA 
        STA a2EA3
        LDA a1F37
        PHA 
        LDA a2EA2
        STA a1F37
        PLA 
        STA a2EA2
        JMP j2EAA

a2EA2   .BYTE $00
a2EA3   .BYTE $00
f2EA4   .BYTE $00,$00,$00,$00,$00,$00
;-------------------------------------------------------------------------
; j2EAA
;-------------------------------------------------------------------------
j2EAA
        LDA currentPlayerOffset
        CMP #$0E
        BNE b2EB7
        LDA #$26
        STA currentPlayerOffset
        JMP j2EEC

b2EB7   LDA #$0E
        STA currentPlayerOffset
        JMP j2EEC

;-------------------------------------------------------------------------
; s2EBE
;-------------------------------------------------------------------------
s2EBE
        LDA currentDifficultyLevel
        STA a2E14
        LDA CIX      ;CIX     
        STA a2EA3
        LDA a1F37
        STA a2EA2
        LDA aFD
        STA a2E15

        LDX #$00
b2ED6   LDA currentCamelPositionOnRadarArray,X
        STA f2EA4,X
        LDA f1F38,X
        STA f2E0E,X
        INX 
        CPX #$06
        BNE b2ED6

        LDA #$0E
        STA currentPlayerOffset
        RTS 

;-------------------------------------------------------------------------
; j2EEC
;-------------------------------------------------------------------------
j2EEC
        LDA currentPlayerOffset
        CMP #$0E
        BNE b2EF8
        LDA player1LivesText
        JMP j2EFB

b2EF8   LDA player2LivesText
;-------------------------------------------------------------------------
; j2EFB
;-------------------------------------------------------------------------
j2EFB
        AND #$07
        BEQ b2F00
        RTS 

b2F00   LDA player1LivesText
        CMP player2LivesText
        BEQ b2F0B
        JMP MaybeSwitchCurrentPlayer

b2F0B   LDA #$00
        RTS 

a2F0E   .BYTE $00
;-------------------------------------------------------------------------
; UpdateCurrentPlayerText
;-------------------------------------------------------------------------
UpdateCurrentPlayerText
        LDX #$00
b2F11   LDA currentPlayerText,X
        STA messageLine + $15,X
        INX 
        CPX #$06
        BNE b2F11
        LDA currentPlayerOffset
        CMP #$0E
        BNE b2F28
        LDA #$11
        STA messageLine + $1C
        RTS 

b2F28   LDA #$12
        STA messageLine + $1C
        RTS 

;-------------------------------------------------------------------------
; ClearMessageLine
;-------------------------------------------------------------------------
ClearMessageLine
        LDA #$00
        TAX 
b2F31   STA messageLine,X
        INX 
        CPX #$2F
        BNE b2F31
        RTS 

.enc "atascii"  ;define an ascii->atascii encoding
currentPlayerText   
        .TEXT 'PLAYER'
        .BYTE $8D,$00
        .BYTE $00
.enc "none"
;-------------------------------------------------------------------------
; s2F43
;-------------------------------------------------------------------------
s2F43
        LDX #$00
b2F45   LDA currentCamelPositionOnRadarArray,X
        CMP #$FF
        BEQ b2F52
        TAY 
        LDA #$44
        STA radarLine,Y
b2F52   INX 
        CPX #$06
        BNE b2F45
        RTS 

        .BYTE $4F,$4C,$4C,$49,$4E,$0B,$81,$2D
        .BYTE $C0,$78,$15,$47,$41,$4D,$4F,$30
        .BYTE $0B,$92,$2D,$C0,$83,$15,$47,$41
        .BYTE $4D,$4F,$31,$0B,$DB,$2D,$C0,$8E
        .BYTE $15,$47,$4F,$56,$41,$4D,$0B,$B2
        .BYTE $2D,$C0,$44,$FF,$47,$4F,$41,$54
        .BYTE $53,$0B,$C5,$2D,$C0,$A4,$15,$53
        .BYTE $48,$45,$45,$50,$09,$C7,$2D,$C0
        .BYTE $24,$16,$53,$48,$52,$0C,$E4,$2D
        .BYTE $C0,$B9,$15,$48,$49,$53,$43,$4F
        .BYTE $52,$09,$E8,$2D,$C0,$41,$FF,$48
        .BYTE $49,$31,$0A,$F5,$2D,$C0,$50,$FF
        .BYTE $4E,$45,$58,$31,$0A,$FC,$2D,$C0
        .BYTE $D6,$15,$58,$46,$45,$52,$0A,$00
        .BYTE $2E,$C0,$4F,$FF,$58,$46,$45,$31
        .BYTE $0D,$0D,$2E,$C0,$25,$FF,$43,$41
        .BYTE $4D,$50,$4F,$53,$53,$0C,$13,$2E
        .BYTE $C0,$F9,$15,$54,$4C,$45,$56,$45
        .BYTE $4C,$0C,$14,$2E,$C0,$3C,$16,$54
        .BYTE $43,$43,$4F,$55,$4E,$0A,$26,$2E
        .BYTE $C0,$0F,$16,$45,$58,$58,$31,$0A
f3000   .BYTE $42,$2E,$C0,$6A,$16,$45,$58,$58
        .BYTE $32,$0B,$5E,$2E,$C0,$30,$16,$55
        .BYTE $4E,$44,$49,$45,$0C,$A3,$2E,$C0
        .BYTE $54,$16,$53,$43,$41,$4E,$53,$54
        .BYTE $0C,$6E,$2E,$C0,$08,$FF,$55,$4E
        .BYTE $44,$49,$45,$32,$0C,$A2,$2E,$C0
        .BYTE $48,$16,$54,$53,$43,$41,$4E,$43
        .BYTE $0C,$A1,$2E,$C0,$25,$FF,$54,$43
        .BYTE $41,$4D,$4C,$4F,$0B,$A9,$2E,$C0
        .BYTE $5F,$16,$53,$57,$41,$50,$32,$0B
        .BYTE $B4,$2E,$C0,$B2,$FF,$53,$57,$41
        .BYTE $50,$33,$0C,$E9,$2E,$C0,$76,$16
        .BYTE $45,$58,$58,$54,$52,$41,$0A,$D3
        .BYTE $2E,$C0,$80,$16,$45,$51,$55,$55
        .BYTE $0B,$F5,$2E,$C0,$8B,$16,$45,$58
        .BYTE $58,$54,$31,$0B,$F8,$2E,$C0,$96
        .BYTE $16,$45,$58,$58,$54,$32,$0B,$FD
        .BYTE $2E,$C0,$A1,$16,$45,$58,$58,$54
        .BYTE $33,$0B,$08,$2F,$C0,$59,$FF,$45
        .BYTE $58,$58,$54,$34,$0B,$0E,$2F,$C0
        .BYTE $B7,$16,$50,$4D,$45,$53,$31,$0A
        .BYTE $37,$2F,$C0,$C1,$16,$50,$4C,$41
        .BYTE $4D,$0B,$25,$2F,$C0,$CC,$16,$50
        .BYTE $4D,$45,$53,$32,$0B,$2E,$2F,$C0
        .BYTE $0B,$FF,$50,$4D,$45,$53,$33,$0C
        .BYTE $00,$00,$01,$0A,$FF,$46,$55,$43
        .BYTE $4B,$4D,$45,$0B,$42,$2F,$C0,$EE
        .BYTE $16,$44,$45,$43,$41,$30,$0B,$4F
        .BYTE $2F
f30E1
        .BYTE $C0,$4C,$FF,$44,$45,$43,$41
        .BYTE $31,$55,$4C,$58,$2A,$26,$0B,$50
        .BYTE $86,$48,$50,$4F,$53,$4D,$33,$34
        .BYTE $26,$04,$2C,$3E,$26,$07,$4F,$3E
        .BYTE $06,$02,$48,$26,$0B,$50,$86,$48
        .BYTE $50,$4F,$53,$4D,$32,$52,$26,$0A
        .BYTE $25,$85,$43,$42,$55,$4C,$52,$5C
        .BYTE $26,$07,$24,$3E,$06,$06,$66,$26
        .BYTE $12,$85,$48,$4F,$52,$53,$45,$51
        .BYTE $86,$4D,$49,$53,$52,$41,$4D,$38
        .BYTE $70,$26,$07,$4D,$3E,$06,$0F,$7A
        .BYTE $26,$0C,$50,$86,$4D,$49,$53,$52
        .BYTE $41,$4D,$38,$84,$26,$04,$33,$8E
        .BYTE $26,$04,$30,$98,$26,$0A,$48,$85
        .BYTE $48,$4F,$52,$53,$45,$A2,$26,$0A
        .BYTE $51,$85,$43,$42,$55,$4C,$59,$AC
        .BYTE $26,$0A,$50,$85,$43,$42,$55,$4C
        .BYTE $52,$B6,$26,$04,$3F,$C0,$26,$07
        .BYTE $24,$3E,$06,$06,$CA,$26,$12,$85
        .BYTE $42,$55,$4C,$55,$32,$51,$86,$42
        .BYTE $55,$4C,$49,$4D,$54,$39,$D4,$26
        .BYTE $0C,$4C,$86,$4D,$49,$53,$52,$41
        .BYTE $4D,$38,$DE,$26,$0C,$50,$86,$4D
        .BYTE $49,$53,$52,$41,$4D,$38,$E8,$26
        .BYTE $04,$33,$F2,$26,$04,$30,$FC,$26
        .BYTE $0A,$48,$85,$42,$55,$4C,$55,$32
        .BYTE $06,$27,$04,$3A,$10,$27,$11,$86
        .BYTE $42,$55,$4C,$43,$4F,$4E,$22,$85
        .BYTE $42,$53,$50,$45,$45,$1A,$27,$0E
        .BYTE $48,$86,$42,$55,$4C,$43,$4F,$4E
        .BYTE $13,$08,$01,$24,$27,$0A,$51,$85
        .BYTE $42,$55,$4C,$53,$53,$2E,$27,$0A
        .BYTE $50,$85,$42,$53,$50,$45,$45,$38
        .BYTE $27,$10,$85,$42,$55,$4C,$43,$31
        .BYTE $51,$85,$43,$42,$55,$4C,$54,$42
        .BYTE $27,$0A,$48,$85,$42,$55,$4C,$43
        .BYTE $32,$4C,$27,$0A,$20,$85,$43,$42
        .BYTE $47,$45,$4E,$56,$27,$11,$85,$42
        .BYTE $55,$4C,$43,$32,$20,$86,$41,$58
        .BYTE $58,$49,$4F,$4E,$60,$27,$04,$3A
        .BYTE $6A,$27,$11,$86,$41,$58,$58,$49
        .BYTE $4F,$4E,$51,$85,$53,$4F,$4E,$58
        .BYTE $35,$74,$27,$09,$46,$84,$41,$58
        .BYTE $41,$58,$7E,$27,$0A,$23,$85,$53
        .BYTE $4F,$4E,$58,$35,$88,$27,$0A,$51
        .BYTE $85,$53,$4F,$4E,$58,$35,$92,$27
        .BYTE $07,$52,$3E,$06,$20,$9C,$27,$09
        .BYTE $48,$84,$41,$58,$58,$32,$A6,$27
        .BYTE $07,$51,$3E,$06,$00,$B0,$27,$0A
        .BYTE $50,$85,$53,$4F,$4E,$58,$35,$BA
        .BYTE $27,$0A,$50,$85,$41,$55,$44,$43
        .BYTE $33,$C4,$27,$09,$21,$84,$41,$58
        .BYTE $41,$58,$CE,$27,$0F,$84,$41,$58
        .BYTE $58,$32,$50,$85,$41,$55,$44,$46
        .BYTE $33,$D8,$27,$07,$51,$3E,$06,$C8
        .BYTE $E2,$27,$0A,$50,$85,$41,$55,$44
        .BYTE $43,$33,$EC,$27,$0F,$84,$41,$58
        .BYTE $41,$58,$51,$85,$43,$42,$55,$4C
        .BYTE $54,$F6,$27,$07,$52,$3E,$06,$01
        .BYTE $00,$28,$08,$46,$83,$41,$58,$45
        .BYTE $0A,$28,$0B,$21,$86,$53,$54,$52
        .BYTE $41,$49,$54,$14,$28,$0E,$83,$41
        .BYTE $58,$45,$51,$85,$43,$42,$55,$4C
        .BYTE $58,$1E,$28,$04,$2C,$28,$28,$0D
        .BYTE $4F,$88,$43,$42,$55,$4C,$58,$50
        .BYTE $49,$58,$32,$28,$0A,$50,$85,$43
        .BYTE $42,$55,$4C,$58,$3C,$28,$07,$4D
        .BYTE $3E,$06,$F0,$46,$28,$08,$46,$83
        .BYTE $41,$53,$58,$50,$28,$07,$52,$3E
        .BYTE $06,$10,$5A,$28,$08,$46,$83,$41
        .BYTE $53,$58,$64,$28,$08,$21,$83,$44
        .BYTE $4C,$4C,$6E,$28,$0B,$83,$41,$53
        .BYTE $58,$51,$3E,$06,$00,$78,$28,$0A
        .BYTE $50,$85,$43,$42,$55,$4C,$54,$82
        .BYTE $28,$0A,$50,$85,$43,$42,$55,$4C
        .BYTE $59,$8C,$28,$0A,$50,$85,$53,$4F
        .BYTE $4E,$58,$35,$96,$28,$0A,$50,$85
        .BYTE $41,$55,$44,$43,$33,$A0,$28,$04
        .BYTE $3A,$AA,$28,$10,$83,$44,$4C,$4C
        .BYTE $22,$87,$43,$42,$44,$4C,$59,$59
        .BYTE $52,$B4,$28,$0B,$48,$83,$44,$4C
        .BYTE $4C,$13,$08,$01,$BE,$28,$0B,$51
        .BYTE $86,$43,$42,$44,$4C,$59,$59,$C8
        .BYTE $28,$0C,$50,$87,$43,$42,$44,$4C
        .BYTE $59,$59,$52,$D2,$28,$10,$85,$41
        .BYTE $43,$45,$4C,$59,$51,$85,$43,$42
        .BYTE $55,$4C,$59,$DC,$28,$0A,$52,$85
        .BYTE $53,$48,$49,$50,$59,$E6,$28,$0A
        .BYTE $47,$85,$41,$43,$44,$57,$4E,$F0
        .BYTE $28,$0B,$51,$86,$43,$42,$55,$4C
        .BYTE $44,$59,$FA,$28,$0B,$46,$86,$41
        .BYTE $43,$55,$50,$4F,$4B,$04,$29,$0D
        .BYTE $51,$88,$43,$42,$55,$4C,$59,$50
        .BYTE $49,$58,$0E,$29,$0B,$46,$86,$41
        .BYTE $43,$55,$50,$4F,$4B,$18,$29,$0D
        .BYTE $22,$88,$43,$42,$55,$4C,$59,$50
        .BYTE $49,$58,$22,$29,$12,$84,$59,$41
        .BYTE $44,$44,$51,$88,$43,$42,$55,$4C
        .BYTE $59,$50,$49,$58,$2C,$29,$04,$2C
        .BYTE $36,$29,$0A,$4F,$85,$43,$42,$55

.include "charset.asm"

s3861
        LDX #$28
b3863   LDY #$00
b3865   LDA f3000,Y
        STA f0FE1,Y
        INY 
        BNE b3865
        INC a5886
        INC a5889
        DEX 
        BMI b387D
        BNE b3863
        LDA #$80
        BNE b3865

b387D   LDA #$22
        STA CASINI   ;CASINI  cassette initialization vector
        STA DOSINI   ;DOSINI  
        LDA #$18
        STA a03
        STA a0D
        JSR SomeKindOfSetup
        JSR LaunchGame
        JMP (DOSVEC) ;DOSVEC  


