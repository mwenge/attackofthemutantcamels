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
; A lot of this was adapted from:
; https://github.com/C64-Mark/Attack-of-the-Mutant-Camels
;
; **** ZP ABSOLUTE ADRESSES **** 
;
currentXPosition              = $02
currentYPosition              = $03
currentCharacter              = $04
colorForCurrentCharacter      = $05
tempVar                       = $06
scoreScreenLoPtr              = $07
screenLineLoPtr               = $08
screenLineHiPtr               = $09
landscapePosition             = $10
shipDirection                 = $11
shipMoveCounter               = $13
shipXOffset                   = $14
shipSpeed                     = $15
shipSpriteFrame               = $16
shipSpeedCounter              = $17
shipXPosition                 = $18
shipYPosition                 = $19
lastJoystickInput             = $1A
inputJoystickLR               = $1B
shipState                     = $1C
gameTimer                     = $1D
shipOffsetChangeCounter       = $1E
shipTurnSoundFlag             = $1F
camelMarkerX                  = $20
unknownPurpose1               = $21
hyperdriveShipMoveCounter     = $22
currentEnemyID                = $23
hyperdriveLanscapeMoveCOunter = $24
hyperdriveLanscapeMoveRate    = $25
camelMarkerUpdateCounter      = $26
neverUsed2                    = $27
camelSpeedCounter             = $28
camelSpeed                    = $2B
tempXStorage                  = $2C
camelAnimationFrame           = $2D
enemyMoveCounterMinor         = $2E
enemyMoveCounterMajor         = $2F
enableBullets                 = $30
bulletDirection               = $31
bulletX                       = $32
bulletY                       = $33
starTwinkleCounter            = $34
bulletSoundFrequency          = $36
camelHeadFrame                = $38
camelState                    = $3A
landPositionMinor             = $3C
landPositionMajor             = $3D
camelPositionMinor            = $3E
camelPositionMajor            = $3F
camelMarkerOffset             = $40
shipX                         = $41
camelX                        = $42
camelLandPositionCounter      = $43
explosionY1                   = $44
camelFrameRate                = $45
camelKilledID                 = $46
currentStar                   = $47
explosionX1                   = $40
explosionX2                   = $41
explosionX3                   = $42
explosionX4                   = $43
explosionY2                   = $45
explosionY3                   = $46
explosionY4                   = $47
starTwinkleRate               = $48
camelSpitSoundFrequency       = $51
camelSpitRate                 = $52
a53Redundant                  = $53
a54Redundant                  = $54
camelSPitState                = $55
camelSpitX                    = $56
camelSpitFrame                = $57
camelSpitBombRate             = $58
camelSpitDirection            = $59
a5ARedundant                  = $5A
camelSpitBombRateCounter      = $5B
a5CRedundant                  = $5C
camelSpitSpeedCounter         = $5D
camelSPitSpeed                = $5E
camelSPitRateCounter          = $5F
camelSpitShipDifference       = $60
playerHealth                  = $61
damageFlashFlag               = $62
storeColourCounter            = $63
storeScreenLo                 = $64
scoreScreenHi                 = $65
scoreColorLo                  = $66
storeColorHi                  = $67
scoreBonus                    = $68
camelsRemaining               = $69
rocketMoveRate                = $6A
a6BRedundant                  = $6B
player1Lives                  = $6C
player2Lives                  = $6D
playerTUrn                    = $6E
playerSector                  = $6F
bottomRowFlag                 = $70
collisionDetectedBits         = $95
lastKeyPressed                = $C5
camelCollision                = $FD
CollisionDetectionRate        = $FE
aFFRedundant                  = $FF
;
; **** FIELDS **** 
;
screenLinesLoPtrArray         = $0340
screenLinesHiPtrArray         = $0360
SCREEN_RAM                    = $0400
COLOR_RAM                     = $D800

JOYSTICK_FIRE                 = $10
JOYSTICK_RIGHT                = $08
JOYSTICK_LEFT                 = $04
JOYSTICK_DOWN                 = $02
JOYSTICK_UP                   = $01
;
; **** ABSOLUTE ADRESSES **** 
;
a0038                         = $0038
a0042                         = $0042
f0043                         = $0043
a0046                         = $0046
a0095                         = $0095
a00A2                         = $00A2
a028D                         = $028D

IRQ_LO                        = $0314
IRQ_HI                        = $0315
camelHeadFrameF1              = $38F1
camelHeadFrameF2              = $38F2
camelHeadFrameF3              = $38F3
camelHeadFrameF4              = $38F4
joystickInput                 = $DC11

;
; **** POINTERS **** 
;
SpriteXPos                    = $D000

Sprite0Ptr                    = $07F8
Sprite1Ptr                    = $07F9
Sprite2Ptr                    = $07FA
Sprite3Ptr                    = $07FB
Sprite4Ptr                    = $07FC
Sprite5Ptr                    = $07FD
Sprite6Ptr                    = $07FE
Sprite7Ptr                    = $07FF

;
; **** EXTERNAL JUMPS **** 
;
KERNEL_INTERRUPT = $EA31

.include "constants.asm"

*=$0801
;-------------------------------------------------------
; SYS 16384 ($4000)
; This launches the program from address $4000, i.e. MainControlLoop.
;-------------------------------------------------------
; $9E = SYS
; $20,$34,$30,$39,$36,$00,$00,$00 = 4096 (StartGame
        .BYTE $0C,$08,$0A,$00,$9E,$20,$34,$30
        .BYTE $39,$36,$00,$00,$00
*=$1000
;-------------------------------------------------------------------------
; StartGame
;-------------------------------------------------------------------------
StartGame
        LDA #$D0
        STA scoreScreenLoPtr
        LDA #0
        STA tempVar
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0

        LDA #$18
        TAY 
        STA (tempVar),Y
        JSR InitializeScreenPointerArray
;-------------------------------------------------------------------------
; RestartGame
;-------------------------------------------------------------------------
RestartGame
        JSR DisplayMenu
        JMP InitializePlayerStats

        RTS 

        .BYTE $EA,$EA,$EA
;-------------------------------------------------------------------------
; InitializeScreenPointerArray
;-------------------------------------------------------------------------
InitializeScreenPointerArray
        LDA #<SCREEN_RAM + $0000
        STA currentXPosition
        LDA #>SCREEN_RAM + $0000
        STA currentYPosition
        LDY #$00
b102A   LDA currentXPosition
        STA screenLinesLoPtrArray,Y
        LDA currentYPosition
        STA screenLinesHiPtrArray,Y
        LDA currentXPosition
        CLC 
        ADC #$28
        STA currentXPosition
        LDA currentYPosition
        ADC #$00
        STA currentYPosition
        INY 
        CPY #$19
        BNE b102A
        LDX #$00
b1048   LDA screenLinesLoPtrArray,X
        STA currentXPosition
        LDA screenLinesHiPtrArray,X
        STA currentYPosition
        LDY #$00
        LDA #$20
b1056   STA (currentXPosition),Y
        INY 
        CPY #$28
        BNE b1056
        INX 
        CPX #$19
        BNE b1048
        JMP WriteScreenHeaderText

.enc "petscii"  ;define an ascii->petscii encoding
        .cdef "  ", $20  ;characters
        .cdef "--", $ad  ;characters
        .cdef "$$", $24  ;characters
        .cdef ">>", $3E  ;characters
        .cdef "<<", $3C  ;characters
        .cdef "::", $3A  ;characters
        .cdef "..", $2E  ;characters
        .cdef "AZ", $01
        .cdef "09", $30
        .cdef "@@", $00
.enc "none"

gameHiScore = txtScreenHeader + $13
txtScreenHeader   =*-$01
.enc "petscii"
                        .TEXT 'SCORE PL. 1 >  HI:  LLAMA   > SCORE PL.2'
                        .TEXT '            >               >           '
                        .TEXT '0000000     >   $ :  100    >    0000000'
                        .TEXT '@@@@@@@@@@@@<@@@@@@@@@@@@@@@<@@@@@@@@@@@'
                        .TEXT '   $   $   $   $   $   $                '
                        .TEXT '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
.enc "none"
;-------------------------------------------------------------------------
; WriteScreenHeaderText
;-------------------------------------------------------------------------
WriteScreenHeaderText
        LDY #$F0
b1157   LDA txtScreenHeader,Y
        STA SCREEN_RAM - $01,Y
        LDA #$01
        STA COLOR_RAM - $01,Y
        DEY 
        BNE b1157
        RTS 

        NOP 
        NOP 
;-------------------------------------------------------------------------
; GetLinePtrForCurrentYPosition
;-------------------------------------------------------------------------
GetLinePtrForCurrentYPosition
        LDX currentYPosition
        LDY currentXPosition
        LDA screenLinesLoPtrArray,X
        STA screenLineLoPtr
        LDA screenLinesHiPtrArray,X
        STA screenLineHiPtr
        RTS 

;-------------------------------------------------------------------------
; WriteCurrentCharacterToCurrentXYPos
;-------------------------------------------------------------------------
WriteCurrentCharacterToCurrentXYPos
        JSR GetLinePtrForCurrentYPosition
        LDA currentCharacter
        STA (screenLineLoPtr),Y
        LDA screenLineHiPtr
        CLC 
        ADC #$D4
        STA screenLineHiPtr
        LDA screenLineHiPtr
        NOP 
        NOP 
        STA screenLineHiPtr
        LDA colorForCurrentCharacter
        STA (screenLineLoPtr),Y
        RTS 

;-------------------------------------------------------------------------
; GetCharacterAtCurrentXYPos
;-------------------------------------------------------------------------
GetCharacterAtCurrentXYPos
        JSR GetLinePtrForCurrentYPosition
        LDA (screenLineLoPtr),Y
        RTS 

;---------------------------------------------------------------------------------
; DrawLandscape   
;---------------------------------------------------------------------------------
DrawLandscape   
        LDX landscapePosition
        LDY #$28
b119A   LDA landscapeRow0,X
        STA SCREEN_RAM + $01B7,Y
        LDA landscapeRow1,X
        STA SCREEN_RAM + $01DF,Y
        LDA landscapeRow2,X
        STA SCREEN_RAM + $0207,Y
        LDA landscapeRow3,X
        STA SCREEN_RAM + $022F,Y
        LDA #$08
        STA COLOR_RAM + $01B7,Y
        STA COLOR_RAM + $01DF,Y
        STA COLOR_RAM + $0207,Y
        STA COLOR_RAM + $022F,Y
        DEX 
        CPX #$00
        BNE b11C7
        LDX #$28
b11C7   DEY 
        BNE b119A
        RTS 

;-------------------------------------------------------------------------
; MoveLandscape
;-------------------------------------------------------------------------
MoveLandscape
        LDA shipDirection
        BEQ b11DE
        INC landscapePosition
        LDA landscapePosition
        CMP #$29
        BMI DrawLandscape
        LDA #$01
        STA landscapePosition
        JMP DrawLandscape

b11DE   DEC landscapePosition
        LDA landscapePosition
        CMP #$00
        BNE DrawLandscape
        LDA #$28
        STA landscapePosition
        JMP DrawLandscape

;-------------------------------------------------------------------------
; UpdateShipPosition
;-------------------------------------------------------------------------
UpdateShipPosition
        DEC shipMoveCounter
        BEQ b11F2
        RTS 

b11F2   LDA #$08
        STA shipMoveCounter
        NOP 
        NOP 
        NOP 
        NOP 
        LDA shipSpriteFrame
        STA Sprite0Ptr
        INC $D025    ;Sprite Multi-Color Register 0
        LDA shipYPosition
        STA $D001    ;Sprite 0 Y Pos
        LDA shipXPosition
        CLC 
        ASL 
        STA SpriteXPos    ;Sprite 0 X Pos
        BCS b121B
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FE
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP b121B._Return

b121B   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$01
        STA $D010    ;Sprites 0-7 MSB of X coordinate

_Return
        JMP UpdateShipSpeedCounter

;-------------------------------------------------------------------------
; DecreaseShipSpeed
;-------------------------------------------------------------------------
DecreaseShipSpeed
        DEC shipSpeedCounter
        BEQ b122B
        RTS 

b122B   LDA shipSpeed
        STA shipSpeedCounter
        JMP CamelCheckMarkerUpdate

;-------------------------------------------------------------------------
; MaybeCheckJoystickInput
;-------------------------------------------------------------------------
MaybeCheckJoystickInput
        LDA gameTimer
        CMP #$02
        BEQ CheckJoystickInput
        RTS 

;-------------------------------------------------------------------------
; CheckJoystickInput   
;-------------------------------------------------------------------------
CheckJoystickInput   
        LDA joystickInput
        EOR #$FF
        STA lastJoystickInput
        AND #JOYSTICK_UP
        BEQ b1250
        DEC shipYPosition
        LDA shipYPosition
        CMP #$60
        BNE b1250
        LDA #$61
        STA shipYPosition
b1250   LDA lastJoystickInput
        AND #JOYSTICK_DOWN
        BEQ b1262
        INC shipYPosition
        LDA shipYPosition
        CMP #$E0
        BNE b1262
        LDA #$DF
        STA shipYPosition
b1262   RTS 

        NOP 
;-------------------------------------------------------------------------
; CheckJoystickLeftOrRight
;-------------------------------------------------------------------------
CheckJoystickLeftOrRight
        STA inputJoystickLR
        LDA shipDirection
        BEQ b126E
        LDA #JOYSTICK_RIGHT
        STA inputJoystickLR
b126E   LDA lastJoystickInput
        AND inputJoystickLR
        BNE b1291
        LDA lastJoystickInput
        AND #JOYSTICK_RIGHT | JOYSTICK_LEFT
        BNE b127D
        RTS 

        .BYTE $7A,$12
b127D   LDA #SHIP_STATE_TURN
        STA shipState
        LDA shipSpriteFrame
        CMP #SHIP_LEFT_FRAME
        BEQ b128C
        LDA #SHIP_LEFT_FRAME
        STA shipSpriteFrame
        RTS 

b128C   LDA #SHIP_RIGHT_FRAME
        STA shipSpriteFrame
        RTS 

b1291   INC shipXOffset
        LDA shipXOffset
        CMP #$48
        BNE UpdateShipSpeed
        LDA #$47
        STA shipXOffset

UpdateShipSpeed   
        LDA shipDirection
        BNE b12AA
        LDA #$A0
        SBC shipXOffset
        STA shipXPosition
        JMP SetShipSpeed

b12AA   LDA #$0A
        ADC shipXOffset
        STA shipXPosition

SetShipSpeed
        LDA shipXOffset
        LDY #$03
DivideXOffset   
        CLC 
        ROR 
        DEY 
        BNE DivideXOffset
        TAX 
        LDA shipSpeedsArray,X
        STA shipSpeed
        RTS 

;-------------------------------------------------------------------------
; UpdateGameTimer
;-------------------------------------------------------------------------
UpdateGameTimer
        DEC gameTimer
        BEQ b12C5
        RTS 

b12C5   LDA #$08
        STA gameTimer
        RTS 

;-------------------------------------------------------------------------
; MaybeCheckJoystickInputLeftOrRight
;-------------------------------------------------------------------------
MaybeCheckJoystickInputLeftOrRight
        LDA gameTimer
        CMP #$01
        BEQ b12D1
b12D0   RTS 

b12D1   DEC shipOffsetChangeCounter
        BNE b12D0
        LDA #$04
        STA shipOffsetChangeCounter
        LDA lastJoystickInput
        AND #JOYSTICK_RIGHT | JOYSTICK_LEFT
        BEQ DecreaseTurnOffset

        LDA #VOICE_OFF
        STA $D404    ;Voice 1: Control Register
        LDA #VOICE_ON_NOISE
        STA $D404    ;Voice 1: Control Register
        LDA #JOYSTICK_LEFT
        JMP CheckJoystickLeftOrRight

DecreaseTurnOffset   
        DEC shipXOffset
        BNE b12F6
        LDA #$01
        STA shipXOffset
b12F6   JMP UpdateShipSpeed

;-------------------------------------------------------------------------
; UpdateShipSpeedCounter
;-------------------------------------------------------------------------
UpdateShipSpeedCounter
        NOP 
        NOP 
        NOP 
        LDA shipSpeed
        CMP #$FF
        BNE b1307
        LDA #$10
        STA shipSpeedCounter
        RTS 

b1307   JMP DecreaseShipSpeed

;-------------------------------------------------------------------------
; ChangeShipDirection
;-------------------------------------------------------------------------
ChangeShipDirection
        LDA gameTimer
        CMP #$03
        BEQ b1311
        RTS 

b1311   LDA shipState
        BNE b1316
        RTS 

b1316   CMP #SHIP_STATE_TURNING
        BEQ b1329
        LDA shipDirection
        BEQ b1325
        LDA #SHIP_FACE_LEFT
        STA shipDirection
        JMP b1329

b1325   LDA #SHIP_FACE_RIGHT
        STA shipDirection
b1329   JMP UpdateShipOffset

;-------------------------------------------------------------------------
; TurnShip
;-------------------------------------------------------------------------
TurnShip
        BEQ b1338
        LDA #VOICE_OFF
        STA $D404    ;Voice 1: Control Register
        STA shipTurnSoundFlag
        JMP CheckTurnOffset

b1338   LDA #VOICE_ON_SAW
        STA $D404    ;Voice 1: Control Register
        STA shipTurnSoundFlag

CheckTurnOffset
        LDA shipXOffset
        CMP #$06
        BNE b1349
        LDA #SHIP_STATE_READY
        STA shipState
b1349   LDA gameTimer
        STA gameTimer
        LDA #$04
        STA shipOffsetChangeCounter
        JMP DecreaseTurnOffset

UpdateShipState   
        LDA #SHIP_STATE_TURNING
        STA shipState
        LDA shipTurnSoundFlag
        JMP TurnShip

;-------------------------------------------------------------------------
; UpdateShipOffset
;-------------------------------------------------------------------------
UpdateShipOffset
        LDA shipState
        CMP #SHIP_STATE_TURN
        BNE UpdateShipState
        LDA #$90
        SBC shipXOffset
        STA shipXOffset
        JMP UpdateShipState

PLAYAREA_WIDTH = $28
PLAYAREA_HEIGHT = $17
;-------------------------------------------------------------------------
; DisplayGround
;-------------------------------------------------------------------------
DisplayGround
        LDX #$0F
b136E   LDA screenLinesLoPtrArray,X
        STA screenLineLoPtr
        LDA screenLinesHiPtrArray,X
        STA screenLineHiPtr
        LDY #$00
b137A   LDA #CHAR_BLOCK
        STA (screenLineLoPtr),Y
        LDA screenLineHiPtr
        STA currentXPosition
        CLC 
        ADC #$D4
        STA screenLineHiPtr
        LDA #$0B
        STA (screenLineLoPtr),Y
        LDA currentXPosition
        STA screenLineHiPtr
        INY 
        CPY #PLAYAREA_WIDTH
        BNE b137A
        INX 
        CPX #PLAYAREA_HEIGHT
        BNE b136E
        RTS 

;-------------------------------------------------------------------------
; s139A
;-------------------------------------------------------------------------
s139A
        DEC unknownPurpose1
        BEQ UpdateCamelDirectionMarker
        RTS 

UpdateCamelDirectionMarker   
        LDA #$13
        STA unknownPurpose1
b13A4   =*+$01
        LDA shipDirection
        BEQ MoveCamelMarkerLeft
        JMP MoveCamelMarkerRight

        BEQ b13A4
        DEC $D00E    ;Sprite 7 X Pos
        RTS 

MoveCamelMarkerLeft   
        LDA #$13
        STA unknownPurpose1
        DEC camelMarkerX
        LDA camelMarkerX
        CMP #$00
        BNE SetMarkerSpriteX
        LDA #$9F
        STA camelMarkerX
SetMarkerSpriteX   
        LDA camelMarkerX
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
        LDX landscapePosition
        LDY #$28
        JMP b119A

;-------------------------------------------------------------------------
; MoveCamelMarkerRight
;-------------------------------------------------------------------------
MoveCamelMarkerRight
        INC camelMarkerX
        LDA camelMarkerX
        CMP #$A0
        BNE SetMarkerSpriteX
        LDA #$01
        STA camelMarkerX
        JMP SetMarkerSpriteX

        .FILL 13, $EA
;-------------------------------------------------------------------------
; InitializeSPrites
;-------------------------------------------------------------------------
InitializeSPrites
        LDA #SPR_SHIP_AND_RADAR_MASK_ON
        STA $D015    ;Sprite display Enable

        LDA #$01
        STA shipXOffset
        LDA #SHIP_LEFT_FRAME
        STA shipSpriteFrame
        LDA #$20
        STA shipSpeed
        STA shipSpeedCounter

        LDA #$A0
        STA shipXPosition
        LDA #$70
        STA shipYPosition
        LDA #$78
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)

        LDA camelSpeedCounter
        STA camelSpeedCounter

        LDA #$07
        STA $D025    ;Sprite Multi-Color Register 0
        LDA #$0E
        STA $D026    ;Sprite Multi-Color Register 1
        LDA #$01
        STA $D027    ;Sprite 0 Color
        LDA #>currentXPosition
        STA shipDirection
        LDA #<currentXPosition
        STA landscapePosition

        LDA #$00
        STA $D01B    ;Sprite to Background Display Priority
        LDA #$03
        STA $D01C    ;Sprites Multi-Color Mode Select

        JSR DrawLandscape

        LDA #$01
        STA gameTimer
        STA shipOffsetChangeCounter

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

        JSR DisplayGround

        LDA #$9F
        STA camelMarkerX

        LDA #$52
        STA $D00F    ;Sprite 7 Y Pos

        LDA #$D1
        STA Sprite7Ptr
        LDA #$01
        STA $D02E    ;Sprite 7 Color

        LDA #$0A
        STA unknownPurpose1
        LDA #$00
        STA shipState

        JSR UpdateCamelDirectionMarker

        LDA #$84
        STA $D007    ;Sprite 3 Y Pos
        STA $D009    ;Sprite 4 Y Pos

        LDA #$AE
        STA $D00B    ;Sprite 5 Y Pos
        STA $D00D    ;Sprite 6 Y Pos

        LDA #CAMEL_REAR_FRAME
        STA Sprite3Ptr
        LDA #CAMEL_HEAD_FRAME1
        STA Sprite4Ptr
        LDA #CAMEL_REAR_LEGS_FRAME1
        STA Sprite5Ptr
        LDA #CAMEL_FRONT_LEGS_FRAME1
        STA Sprite6Ptr

        LDA #$FF
        STA currentEnemyID
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA #$08
        STA camelMarkerUpdateCounter
        LDA #$0A
        STA neverUsed2
        LDA #$04
        STA camelAnimationFrame
        LDA #$01
        STA enemyMoveCounterMinor
        LDA #$02
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$40
        STA enemyMoveCounterMajor

        .FILL 21, $EA

        JMP InitializeGameVariables

        .FILL 13, $EA
;-------------------------------------------------------------------------
; MainGameLoop
;-------------------------------------------------------------------------
MainGameLoop
        JSR UpdateShipPosition
        JSR MaybeCheckJoystickInput
        JSR UpdateGameTimer
        JSR MaybeCheckJoystickInputLeftOrRight
        JSR ChangeShipDirection
        JSR AnimateCamels
        JSR MoveCamels
        JSR CheckFirePressed
        JSR AnimateSky
        JSR AnimateDyingCamel
        JSR AnimateCamelHeads
        JSR AnimateCamelSpitting
        JSR AnimateShipDamage
        JSR UpdateCollisionRegister
        JSR DetectShipAndCamelCollisions
        JSR CheckSectorDefences
        JSR CheckPausePressed

        .FILL 45, $EA

        JMP MainGameLoop

;-------------------------------------------------------------------------
; DisableExplosionSprites
;-------------------------------------------------------------------------
DisableExplosionSprites
        LDA #$80
        STA $D015    ;Sprite display Enable
        JMP ExplosionEnded

        .FILL 149, $EA
;-------------------------------------------------------------------------
; AnimateCamels
;-------------------------------------------------------------------------
AnimateCamels
        LDA gameTimer
        CMP #$01
        BEQ b1607
        RTS 

b1607   LDX currentEnemyID
        CPX #$FF
        BNE b1610
        RTS 

        LDY shipSpriteFrame
b1610   LDA camelCurrentColorArray,X

j1613
        STA $D02D    ;Sprite 6 Color
        STA $D02A    ;Sprite 3 Color
        STA $D02B    ;Sprite 4 Color
        STA $D02C    ;Sprite 5 Color

        LDA $D015    ;Sprite display Enable
        ORA #SPR_CAMEL_MASK_ON
        STA $D015    ;Sprite display Enable

        LDA @wa0042
        ASL 
        STA $D008    ;Sprite 4 X Pos
        STA $D00C    ;Sprite 6 X Pos

        BCS b163E

        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #SPR_CAMEL_FRONT_MASK_OFF
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP UpdateCamelRear

b163E   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #SPR_CAMEL_FRONT_MASK_ON
        STA $D010    ;Sprites 0-7 MSB of X coordinate

UpdateCamelRear
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

        LDA shipSpeedCounter
        CMP #$01
        BNE b169E
        LDA shipDirection
        BEQ b1695
        DEC f22CF,X
        JMP j173E

        CMP #$FF
        BNE b169E
        STA currentEnemyID
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
        STA currentXPosition
        LDA #$04
        STA currentYPosition
        STX tempXStorage
        JSR GetCharacterAtCurrentXYPos
        STA hyperdriveLanscapeMoveCOunter
        LDA #$A0
        STA hyperdriveLanscapeMoveRate
b16C2   LDA #CHAR_SPACE
        STA currentCharacter
        LDA #WHITE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC hyperdriveLanscapeMoveRate
        BNE b16C2
        LDA $D01F    ;Sprite to Background Collision Detect
        AND #$80
        BEQ b16E3
        LDA hyperdriveLanscapeMoveCOunter
        JSR s16FC
        LDX tempXStorage
;-------------------------------------------------------------------------
; j16DF
;-------------------------------------------------------------------------
j16DF
        DEX 
        BNE b16AE
        RTS 

b16E3   LDA hyperdriveLanscapeMoveCOunter
        JSR s16FC
        LDX tempXStorage
        STX currentEnemyID
        LDA shipDirection
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
        STA currentCharacter
        JMP WriteCurrentCharacterToCurrentXYPos

        DEC camelMarkerUpdateCounter
b1703   BEQ b1703
        RTS 

        LDA #$08
        STA camelMarkerUpdateCounter
        JMP MoveLandscape

        LDA shipSpeedCounter
        CMP #$01
        BEQ b1714
        RTS 

b1714   LDA shipSpeed
        CMP #$FF
        BNE b171B
        RTS 

b171B   JMP s139A

;-------------------------------------------------------------------------
; CamelUpdateMarker   
;-------------------------------------------------------------------------
CamelUpdateMarker   
        DEC camelMarkerUpdateCounter
        BNE b1729

        JSR MoveCamelMarker
        LDA #$08
        STA camelMarkerUpdateCounter
b1729   JMP UpdatePlayerLandPosition

        .BYTE $3C,$C9,$FF ;NOP ROM_CHKOUT,X
        BEQ b1735
b1731   RTS 

        DEC landPositionMajor
b1735   =*+$01
        LDA landPositionMajor
        CMP #$FF
        BNE b1731
        LDA #$09
        STA camelPositionMinor
;-------------------------------------------------------------------------
; j173E
;-------------------------------------------------------------------------
j173E
        RTS 

; Redundant/Orphaned Code
        .BYTE $CF,$22,$C9 ;DCP $C922
        CPX #$F0
        ORA (camelSpitShipDifference,X)
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA #$FF
        STA currentEnemyID
        JMP j168C

;-------------------------------------------------------------------------
; CamelCheckMarkerUpdate
;-------------------------------------------------------------------------
CamelCheckMarkerUpdate
        LDA shipState
        BEQ CamelUpdateMarker
        RTS 

; Redundant/Orphaned Code
        STA $1A,X
        LDA shipState
        BNE b175E
        JMP j16A4

b175E   RTS 

        LDA shipOffsetChangeCounter
        CMP #$01
        BEQ MoveCamelBackLegs
        RTS 

;-------------------------------------------------------------------------
; MoveCamelBackLegs   
;-------------------------------------------------------------------------
MoveCamelBackLegs   
        JSR FlashPlayerScore
        NOP 
        INC camelAnimationFrame
        LDA camelAnimationFrame
        CMP #$05
        BEQ b1781
        LDA #$C1
        CLC 
        ADC camelAnimationFrame
        STA Sprite5Ptr
        CLC 
        ADC #$04
        JMP GetCamelHeadFrame

        RTS 

b1781   LDA #$00
        JMP CheckCamelFrameSound

;-------------------------------------------------------------------------
; ResetCamelAnimationFrame
;-------------------------------------------------------------------------
ResetCamelAnimationFrame
        LDA #VOICE_ON_NOISE
        STA $D40B    ;Voice 2: Control Register

SetBackLegsFrame
        LDA #CAMEL_REAR_LEGS_FRAME1
        STA Sprite5Ptr
        LDA #CAMEL_FRONT_LEGS_FRAME1
        JSR SetCamelHeadFrame
        LDA #$01
        STA camelAnimationFrame
b1799   RTS 

;-------------------------------------------------------------------------
; MoveCamels
;-------------------------------------------------------------------------
MoveCamels
        DEC camelSpeedCounter
        BNE b1799
        JSR ResetCamelSpeedCounter
        BNE b17A7
        LDA #$03
        STA enemyMoveCounterMinor
b17A7   JSR MoveCamelMarker2
        LDX currentEnemyID
        INC camelPositionMinor
        BNE b17B3
        INC camelPositionMajor
        NOP 
b17B3   NOP 
        JMP CheckLandPosition

MoveCamelMarker2
        DEC enemyMoveCounterMajor
        BNE b17ED
        LDA #$40
        STA enemyMoveCounterMajor
        LDX #$06
b17C1   JSR FetchCamelMarkerPosition
        STA currentXPosition
        LDA #$04
        STA currentYPosition
        LDA #CHAR_SPACE
        STA currentCharacter
        LDA #WHITE
        STA colorForCurrentCharacter
        STX tempXStorage
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX tempXStorage
        INC camelMarkerScreenLoPtrArray,X
        NOP 
        NOP 
        NOP 
        INC currentXPosition
        LDA #$24
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX tempXStorage
SelectNextCamelToMove
        DEX 
        BNE b17C1
b17ED   RTS 

        ROR shipSpeedCounter
;-------------------------------------------------------------------------
; j17F0
;-------------------------------------------------------------------------
j17F0
        LDA shipXOffset
        CMP #$01
        BEQ b17FB
        LDA #$D5
        JMP j16F8

b17FB   JMP b16F6

        NOP 
        NOP 
;-------------------------------------------------------------------------
; CheckFirePressed
;-------------------------------------------------------------------------
CheckFirePressed
        LDA starTwinkleCounter
        CMP #$02
        BEQ b1807
        RTS 

b1807   LDA lastJoystickInput
        AND #$10
        BNE b1812
        LDA #$00
        STA enableBullets
        RTS 

b1812   LDA bulletDirection
        BEQ b1817
        RTS 

b1817   JMP UnusedBulletRoutine

;-------------------------------------------------------------------------
; SetBulletDirection
;-------------------------------------------------------------------------
SetBulletDirection
        NOP 
        JSR SetBulletY
        NOP 
        LDA #$A5
        STA bulletSoundFrequency
        LDA #$00
        STA enableBullets
        LDA #BULLET_DIR_LEFT
        STA bulletDirection

        LDA $D015    ;Sprite display Enable
        ORA #$02
        STA $D015    ;Sprite display Enable

        LDA shipDirection
        BEQ b183B
        LDA #BULLET_DIR_RIGHT
        STA bulletDirection
b183B   RTS 

;-------------------------------------------------------------------------
; MoveBullet
;-------------------------------------------------------------------------
MoveBullet
        LDA bulletDirection
        CMP #BULLET_NOT_ACTIVE
        NOP 
        NOP 
        BEQ b183B
        LDA bulletDirection
        CMP #BULLET_DIR_LEFT
        BEQ b1855
        INC bulletX
        LDA bulletX
        CMP #$A5
        BEQ b1894
        JMP SetBulletX

b1855   DEC bulletX
        LDA bulletX
        CMP #$F5
        BEQ b1894

;-------------------------------------------------------------------------
; SetBulletX
;-------------------------------------------------------------------------
SetBulletX
        LDA bulletX
        ASL 
        STA $D002    ;Sprite 1 X Pos
        BCS b1870
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #SPR_BULLET_MASK_OFF
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP NowSetBulletY

b1870   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$02
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; SetBulletY
;-------------------------------------------------------------------------
NowSetBulletY
        LDA bulletY
        STA $D003    ;Sprite 1 Y Pos
        JSR s24E6
        AND #SPRCOL_BULLET_CAMEL
        CMP #SPRCOL_BULLET_CAMELREAR
        BEQ BulletHitCamel
        CMP #SPRCOL_BULLET_CAMELHEAD
        BEQ BulletHitCamel
        JSR ChangeBulletSound
        RTS 

BulletHitCamel   
        JSR Add1PointToScore
        JSR BulletHitSound

b1894   LDA #$00
        STA $D003    ;Sprite 1 Y Pos
        LDA $D015    ;Sprite display Enable
        AND #SPR_BULLET_MASK_OFF
        STA $D015    ;Sprite display Enable
        LDA #BULLET_NOT_ACTIVE
        JMP BulletDisable

;-------------------------------------------------------------------------
; AnimateSky
;-------------------------------------------------------------------------
AnimateSky
        DEC starTwinkleCounter
        BEQ b18AB
        RTS 

b18AB   LDA #$04
        STA starTwinkleCounter
        JMP SelectStarToTwinkle

;-------------------------------------------------------------------------
; ChangeBulletSound
;-------------------------------------------------------------------------
ChangeBulletSound
        DEC bulletSoundFrequency
        LDA bulletSoundFrequency
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #VOICE_OFF
        STA $D404    ;Voice 1: Control Register
        LDA #VOICE_ON_NOISE
        STA $D404    ;Voice 1: Control Register
        RTS 

;-------------------------------------------------------------------------
; BulletHitSound
;-------------------------------------------------------------------------
BulletHitSound
        LDA #$06
        JSR s2E93
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        LDA #$81
        STA $D412    ;Voice 3: Control Register
        NOP 
;-------------------------------------------------------------------------
; SetBulletY
;-------------------------------------------------------------------------
SetBulletY
        LDA shipYPosition
        STA bulletY
        LDA #$40
        STA unknownPurpose1
        RTS 

;-------------------------------------------------------------------------
; BulletDisable
;-------------------------------------------------------------------------
BulletDisable
        STA bulletDirection
        LDA #$19
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA enableBullets
        STA enableBullets
b18E8   RTS 

;-------------------------------------------------------------------------
; SetBulletX2
;-------------------------------------------------------------------------
SetBulletX2
        LDA enableBullets
        BNE b18E8
        LDA shipXPosition
        STA bulletX
        JMP SetBulletDirection

;-------------------------------------------------------------------------
; DecreaseCamelHealth
;-------------------------------------------------------------------------
DecreaseCamelHealth
        LDX currentEnemyID
        DEC camelHealthMinorArray,X
        LDA camelHealthMinorArray,X
        BEQ b18FF
        RTS 

b18FF   LDA #$10
        STA camelHealthMinorArray,X
        DEC camelHealthArray,X
        LDA camelHealthArray,X
        BEQ b1914
        TAY 
        LDA camelColorsArray,Y
        STA camelCurrentColorArray,X
        RTS 

b1914   LDA currentEnemyID
        JSR AddBonusPoints
        LDA #CAMEL_HEAD_DYING_FRAME1
        STA camelHeadFrame
        LDA #CAMEL_STATE_DEAD
        STA camelState
        RTS 

;-------------------------------------------------------------------------
; AnimateDyingCamel
;-------------------------------------------------------------------------
AnimateDyingCamel
        LDA camelState
        BNE b1927
        RTS 

b1927   STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX camelKilledID
        STA camelCurrentColorArray,X
        CMP #CAMEL_STATE_DYING
        BNE b1937
        LDA #CAMEL_HEAD_DYING_FRAME2
        STA camelHeadFrame
b1937   LDA gameTimer
        CMP #$01
        BEQ CheckCamelDyingState
        LDA #VOICE_OFF
        STA $D404    ;Voice 1: Control Register
        LDA #VOICE_ON_TRIANGLE_RING
        STA $D404    ;Voice 1: Control Register
        LDA #CAMEL_STATE_DEAD
        SBC camelState
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
b194E   RTS 

CheckCamelDyingState   
        DEC camelState
        BNE b194E
        LDA #$40
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        NOP 
        NOP 
        LDA #YELLOW
        STA camelCurrentColorArray,X
        JSR SetCamelInactive
        STA currentXPosition
        LDA #4
        STA currentYPosition
        LDA #CHAR_SPACE
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$FF
        STA camelKilledID

        LDA $D015    ;Sprite display Enable
        AND #$87
        STA $D015    ;Sprite display Enable
        LDA $D01F    ;Sprite to Background Collision Detect
        JMP CheckRemainingCamels

        RTS 

;-------------------------------------------------------------------------
; s1982
;-------------------------------------------------------------------------
s1982
        LDA camelHealthArray,X
        BEQ b198B
        LDA camelMarkerScreenLoPtrArray,X
        RTS 

b198B   PLA 
        PLA 
        JMP j16DF

;-------------------------------------------------------------------------
; FetchCamelMarkerPosition
;-------------------------------------------------------------------------
FetchCamelMarkerPosition
        JSR CheckCamelActive
        BEQ b1999
        LDA camelMarkerScreenLoPtrArray,X
        RTS 

b1999   PLA 
        PLA 
        JMP SelectNextCamelToMove

;-------------------------------------------------------------------------
; AnimateCamelHeads
;-------------------------------------------------------------------------
AnimateCamelHeads
        LDA gameTimer
        CMP #$01
        BEQ b19A5
        RTS 

b19A5   LDA camelHeadFrame
        STA Sprite4Ptr
        RTS 

;-------------------------------------------------------------------------
; ResetCamelHeadSprite
;-------------------------------------------------------------------------
ResetCamelHeadSprite
        NOP 
        NOP 
        NOP 
        LDA #CAMEL_HEAD_FRAME1
        STA camelHeadFrame
        RTS 

;-------------------------------------------------------------------------
; UpdatePlayerLandPosition
;-------------------------------------------------------------------------
UpdatePlayerLandPosition
        LDA shipDirection
        CMP #$00
        BEQ b19CC
        INC landPositionMinor
        BNE b19C9
        INC landPositionMajor
        LDA landPositionMajor
        CMP #$0A
        BNE b19E0
        LDA #$00
        STA landPositionMajor
b19C9   JMP b19E0

b19CC   DEC landPositionMinor
        LDA landPositionMinor
        CMP #$FF
        BNE b19E0
        DEC landPositionMajor
        LDA landPositionMajor
        CMP #$FF
        BNE b19E0
        LDA #$09
        STA landPositionMajor
b19E0   JMP CheckLandPositionDelay

;-------------------------------------------------------------------------
; MoveCamelMarker
;-------------------------------------------------------------------------
MoveCamelMarker
        JSR MoveLandscape
        LDA #$05
        STA camelMarkerOffset
        LDX landPositionMajor
b19EC   CLC 
        LDA camelMarkerOffset
        ADC #$10
        STA camelMarkerOffset
        DEX 
        BNE b19EC
        LDA landPositionMinor
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
        ADC camelMarkerOffset
        CLC 
        ASL 
        STA $D00E    ;Sprite 7 X Pos
        BCC b1A17
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #SPR_RADAR_MASK_ON
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP ExitMoveMarker

b1A17   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #SPR_RADAR_MASK_OFF
        STA $D010    ;Sprites 0-7 MSB of X coordinate

ExitMoveMarker
        NOP 
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; CheckLandPosition
;-------------------------------------------------------------------------
CheckLandPosition
        LDY #$00
        LDA landPositionMajor
        STA camelMarkerOffset
        LDA landPositionMinor
        STA shipX
b1A2D   LDA shipX
        CMP camelPositionMinor
        BEQ CamelInRange
b1A33   INC shipX
        BNE b1A39
        INC camelMarkerOffset
b1A39   INY 
        CPY #$C0
        BNE b1A2D

NoCamelInRange
        LDA #$FF
        JMP TurnOffCamelSprites

        RTS 

CamelInRange   
        LDA camelMarkerOffset
        SEC 
        SBC camelPositionMajor
        STA currentEnemyID
        LDX currentEnemyID
        JSR CheckCamelID
        CMP #$FF
        BEQ b1A33
        STY camelX
        RTS 

;-------------------------------------------------------------------------
; CheckLandPositionDelay
;-------------------------------------------------------------------------
CheckLandPositionDelay
        DEC camelLandPositionCounter
        BEQ b1A5C
        RTS 

b1A5C   LDA #$03
        STA camelLandPositionCounter
        JMP CheckLandPosition

;-------------------------------------------------------------------------
; TurnOffCamelSprites
;-------------------------------------------------------------------------
TurnOffCamelSprites
        STA currentEnemyID
        LDA $D015    ;Sprite display Enable
        AND #$87
        STA $D015    ;Sprite display Enable
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; CheckCamelID
;-------------------------------------------------------------------------
CheckCamelID
        NOP 
        CPX #$07
        BPL b1A79
        JMP CheckCamelPositionMajor

        RTS 

b1A79   PLA 
        PLA 
        JMP NoCamelInRange

        LDA landPositionMajor
        STA camelMarkerOffset
        INC camelMarkerOffset
        NOP 
        NOP 
        NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; CHeckCurrentCamelHealth
;-------------------------------------------------------------------------
CHeckCurrentCamelHealth
        CPX #$00
        BEQ b1A79
        LDA camelHealthArray,X
        RTS 

        LDA landPositionMajor
        STA camelMarkerOffset
        LDX #$10
b1A97   LDY #$10
b1A99   LDA #$20
        STA explosionY1
b1A9D   DEC explosionY1
        BNE b1A9D
        DEY 
        BNE b1A99
        DEX 
        BNE b1A97
        RTS 

;-------------------------------------------------------------------------
; IRQInterruptHandler   
;-------------------------------------------------------------------------
IRQInterruptHandler   
        DEC camelFrameRate
        BEQ b1AAF
        JMP KERNEL_INTERRUPT

b1AAF   LDA #$10
        STA camelFrameRate
        JSR MoveCamelBackLegs
        JMP KERNEL_INTERRUPT

;-------------------------------------------------------------------------
; SetCamelInactive
;-------------------------------------------------------------------------
SetCamelInactive
        LDA #$FF
        STA camelHealthArray,X
        LDA camelMarkerScreenLoPtrArray,X
        RTS 

        NOP 
;-------------------------------------------------------------------------
; CheckCamelActive
;-------------------------------------------------------------------------
CheckCamelActive
        LDA camelHealthArray,X
        CMP #$FF
        RTS 

;-------------------------------------------------------------------------
; CheckCamelPositionMajor
;-------------------------------------------------------------------------
CheckCamelPositionMajor
        LDA landPositionMajor
        CMP camelPositionMajor
        BMI b1AD2
        JMP CHeckCurrentCamelHealth

b1AD2   JMP NoCamelInRange

;-------------------------------------------------------------------------
; DisplayStars
;-------------------------------------------------------------------------
DisplayStars
        LDA #CHAR_STAR
        STA currentCharacter
        LDA #WHITE
        STA colorForCurrentCharacter
        LDX #$10
b1ADF   LDA starXPositionArray,X
        STA currentXPosition
        LDA starYPositionArray,X
        STA currentYPosition
        STX camelMarkerOffset
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX camelMarkerOffset
        DEX 
        BNE b1ADF
        RTS 

;-------------------------------------------------------------------------
; TwinkleStars
;-------------------------------------------------------------------------
TwinkleStars
        LDA #CHAR_STAR
        STA currentCharacter
        LDA #WHITE
        STA colorForCurrentCharacter
        LDX currentStar
        LDA starXPositionArray+1,X
        STA currentXPosition
        LDA starYPositionArray+1,X
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentStar
        LDA currentStar
        AND #$0F
        STA currentStar
        TAX 
        LDA starXPositionArray+1,X
        STA currentXPosition
        LDA starYPositionArray+1,X
        STA currentYPosition
        LDA #RED
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP MoveBullet

;-------------------------------------------------------------------------
; SelectStarToTwinkle
;-------------------------------------------------------------------------
SelectStarToTwinkle
        JSR DecreaseTwinkleCounter
        DEC starTwinkleRate
        BEQ b1B32
        JMP MoveBullet

b1B32   LDA #$26
        STA starTwinkleRate
        JMP TwinkleStars

;-------------------------------------------------------------------------
; UnusedBulletRoutine
;-------------------------------------------------------------------------
UnusedBulletRoutine
        LDA #$00
        BEQ b1B3E
        RTS 

b1B3E   JMP SetBulletX2


starTwinkleCounter2 = unknownPurpose1
;-------------------------------------------------------------------------
; DecreaseTwinkleCounter
;-------------------------------------------------------------------------
DecreaseTwinkleCounter
        LDA starTwinkleCounter2
        BEQ b1B47
        DEC starTwinkleCounter2
b1B47   NOP 
        NOP 
        RTS 

;-------------------------------------------------------------------------
; GetCamelHeadFrame
;-------------------------------------------------------------------------
GetCamelHeadFrame
        STA Sprite6Ptr
        LDA camelState
        BEQ b1B52
        RTS 

b1B52   LDX camelAnimationFrame
        LDA camelHeadFrameArray,X
        STA @wcamelHeadFrame
        RTS 

;-------------------------------------------------------------------------
; SetCamelHeadFrame
;-------------------------------------------------------------------------
SetCamelHeadFrame
        STA Sprite6Ptr
        LDA camelState
        BEQ b1B63
        RTS 

b1B63   LDA #CAMEL_HEAD_FRAME1
        STA camelHeadFrame
        RTS 

;-------------------------------------------------------------------------
; AnimateCamelSpitting
;-------------------------------------------------------------------------
AnimateCamelSpitting
        DEC camelSpitSpeedCounter
        BEQ b1B6D
        RTS 

b1B6D   LDA camelSPitSpeed
        STA camelSpitSpeedCounter
        LDA camelSPitState
        BNE AnimateCamelSPit
        LDA #$88
        STA $D005    ;Sprite 2 Y Pos
        JMP SetSpitFrequency

        NOP 
        NOP 
;-------------------------------------------------------------------------
; SetSpitPosition
;-------------------------------------------------------------------------
SetSpitPosition
        ADC #$10
        JSR TestSpitCollisionXPos
        NOP 
        BPL b1B8E
        LDA #SPIT_DIRECTION_RIGHT
SetCamelSPitDirection
        STA camelSpitDirection
        JMP SetSPitActive

b1B8E   LDA #SPIT_DIRECTION_LEFT
        JMP SetCamelSPitDirection

SetSPitActive
        LDA #SPIT_STATE_ACTIVE
        STA camelSPitState
        LDA $D015    ;Sprite display Enable
        ORA #$04
        JMP EnableSpitSPrite

        RTS 

;-------------------------------------------------------------------------
; AnimateCamelSPit   
;-------------------------------------------------------------------------
AnimateCamelSPit   
        LDA camelSPitState
        CMP #SPIT_STATE_BOMB
        BEQ b1C21

MoveSPitForCamel
        LDA currentEnemyID
        JMP j1BAB

j1BAB
        LDA camelSpitDirection
        CMP #$01
        BNE b1BB5
        INC camelSpitX
        INC camelSpitX
b1BB5   DEC camelSpitX
        LDA camelSpitX
        CMP #$04
        BEQ b1BC4
        CMP #$B0
        BEQ b1BC4
        JMP UpdateSPitY

b1BC4   LDA #$00
        STA camelSPitState
        NOP 
        NOP 
        NOP 
        NOP 
        JMP DisableSpitSPrite

        RTS 

;-------------------------------------------------------------------------
; UpdateSPitY
;-------------------------------------------------------------------------
UpdateSPitY
        DEC camelSPitRateCounter
        BNE UpdateSPitX
        LDA camelSpitRate
        STA camelSPitRateCounter

        LDA $D005    ;Sprite 2 Y Pos
        CMP shipYPosition

        BPL b1BE5
        INC $D005    ;Sprite 2 Y Pos
        INC $D005    ;Sprite 2 Y Pos
b1BE5   DEC $D005    ;Sprite 2 Y Pos
UpdateSPitX   
        LDA camelSpitX
        CLC 
        ASL 
        STA $D004    ;Sprite 2 X Pos
        BCC b1BFC
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$04
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP UpdateCamelSpiteFrame

b1BFC   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FB
        STA $D010    ;Sprites 0-7 MSB of X coordinate

UpdateCamelSpiteFrame
        INC camelSpitFrame
        LDA camelSpitFrame
        CMP #$D1
        BNE CheckSpitNextFrame
        LDA #$D7
        STA camelSpitFrame
        JMP ExitAnimateSpit

CheckSpitNextFrame   
        CMP #CAMEL_SPIT_FRAME2 + 1
        BNE ExitAnimateSpit
        LDA #$D0
        STA camelSpitFrame

ExitAnimateSpit
        STA Sprite2Ptr
        JMP PlayCamelSpitSound

b1C21   
        JMP CamelSpitSound

EnableSpitIfSelected   
        LDA currentEnemyID
        CMP #$FF
        BNE CamelIsActive
        RTS 

CamelIsActive   
        LDA camelX
        JMP SetSpitPosition

;-------------------------------------------------------------------------
; DisableSpitSPrite
;-------------------------------------------------------------------------
DisableSpitSPrite
        LDA $D015    ;Sprite display Enable
        AND #$FB
        JMP DisableSpitNoise

        RTS 

;-------------------------------------------------------------------------
; RandomizeSPit
;-------------------------------------------------------------------------
RandomizeSPit
        LDA @wa00A2
        AND #$FF
        CMP #$02
        BMI EnableSpitIfSelected
        RTS 

;-------------------------------------------------------------------------
; TestForSPitBomb
;-------------------------------------------------------------------------
TestForSPitBomb
        DEC camelSpitBombRateCounter
        BEQ b1C48
        RTS 

b1C48   LDA #$FF
        STA camelSPitState
        LDA camelSpitBombRate
        STA camelSpitBombRateCounter
        LDA #$00
        STA a54Redundant
        STA a53Redundant
        RTS 

;*******************************************************************************
; Redundant/Orphaned Code
;*******************************************************************************
j1C57
        JMP CamelSpitSound

        NOP 
        BPL b1C61
        INC camelSpitX
        INC camelSpitX
b1C61   DEC camelSpitX
        LDA $D005    ;Sprite 2 Y Pos
        CMP shipYPosition
        BPL b1C70
        INC $D005    ;Sprite 2 Y Pos
        INC $D005    ;Sprite 2 Y Pos
b1C70   DEC $D005    ;Sprite 2 Y Pos
        INC a54Redundant
        LDA a54Redundant
        AND #$03
        STA a54Redundant
        TAX 
        LDA spitBombSpriteFrames,X
        STA Sprite2Ptr
        LDA camelSpitX
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
        JSR SpitHomeOnShip
        DEC a53Redundant
        BEQ b1CA6
        RTS 

b1CA6   LDA #$00
        STA camelSPitState
        JMP DisableSpitSPrite

spitBombSpriteFrames   
        .BYTE $CD,$CE,$CF,$CE,$EA,$EA
;-------------------------------------------------------------------------
; EnableSpitSPrite
;-------------------------------------------------------------------------
EnableSpitSPrite
        STA $D015    ;Sprite display Enable
        JMP TestForSPitBomb

;*******************************************************************************
; Redundant/Orphaned Code
;*******************************************************************************
        DEC a5ARedundant
        BEQ b1D1E
        LDA a5ARedundant
        STA a5ARedundant
        RTS 

;-------------------------------------------------------------------------
; CheckCamelFrameSound
;-------------------------------------------------------------------------
CheckCamelFrameSound
        LDA camelSPitState
        BNE b1CD2
        LDA a5CRedundant
        BNE b1CD2
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        JMP ResetCamelAnimationFrame

b1CD2   JMP SetBackLegsFrame

;-------------------------------------------------------------------------
; SetSpitFrequency
;-------------------------------------------------------------------------
SetSpitFrequency
        LDA #$90
        STA camelSpitSoundFrequency
        JMP RandomizeSPit

;-------------------------------------------------------------------------
; PlayCamelSpitSound
;-------------------------------------------------------------------------
PlayCamelSpitSound
        DEC camelSpitSoundFrequency
        NOP 
        NOP 
        NOP 
        NOP 
        LDA camelSpitSoundFrequency
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
        JMP SpitHomeOnShip

;-------------------------------------------------------------------------
; DisableSpitNoise
;-------------------------------------------------------------------------
DisableSpitNoise
        STA $D015    ;Sprite display Enable
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$02
        JMP DisableSpitNoiseB

;-------------------------------------------------------------------------
; CamelSpitSound
;-------------------------------------------------------------------------
CamelSpitSound
        LDA camelSpitSoundFrequency
        ADC #$57
        STA camelSpitSoundFrequency
        LDA #VOICE_OFF
        STA $D40B    ;Voice 2: Control Register
        LDA #VOICE_ON_SAW
        STA $D40B    ;Voice 2: Control Register
        LDA camelSpitSoundFrequency
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        NOP 
        LDA #$01
        STA camelSPitRateCounter
        JMP MoveSPitForCamel

;*******************************************************************************
; Redundant/Orphaned Code
;*******************************************************************************
b1D1E   LDA #$03
        STA a5ARedundant
        JMP j1C57

;-------------------------------------------------------------------------
; DisableSpitNoiseB
;-------------------------------------------------------------------------
DisableSpitNoiseB
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        RTS 

;-------------------------------------------------------------------------
; SpitHomeOnShip
;-------------------------------------------------------------------------
SpitHomeOnShip
        LDA camelState
        BEQ b1D33
        RTS 

        CMP #$05
        BEQ b1D33
        RTS 

b1D33   LDA shipXPosition
        CLC 
        SBC camelSpitX
        STA camelSpitShipDifference
        AND #$80
        BEQ b1D44
        LDA #$FF
        SBC camelSpitShipDifference
        STA camelSpitShipDifference
b1D44   LDA camelSpitShipDifference
        CMP #$09
        BMI b1D4B
        RTS 

b1D4B   LDA shipYPosition
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        CLC 
        SBC #$03
        STA camelSpitShipDifference
        LDX #$06
b1D5B   LDA $D005    ;Sprite 2 Y Pos
        CMP camelSpitShipDifference
        BEQ ContactWithShip
        INC camelSpitShipDifference
        DEX 
        BNE b1D5B
        RTS 

ContactWithShip   
        LDA #$02
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        LDA $D015    ;Sprite display Enable
        AND #$FB
        STA $D015    ;Sprite display Enable
        LDA camelSPitState
        CMP #$01
        BNE b1D8A
        NOP 
        DEC playerHealth
        BNE b1D8D
b1D8A   JMP PlayerSHipExplosion

b1D8D   LDA #$80
        JMP DisableSpit

;-------------------------------------------------------------------------
; AnimateShipDamage
;-------------------------------------------------------------------------
AnimateShipDamage
        LDA damageFlashFlag
        BNE b1D97
        RTS 

b1D97   DEC damageFlashFlag
        LDA damageFlashFlag
        AND #$01
        BEQ b1DA7
        LDA #$07
        STA $D021    ;Background Color 0
        JMP DamageNoise

b1DA7   LDA #$00
        STA $D021    ;Background Color 0

DamageNoise
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------------------------
; DisableSpit
;-------------------------------------------------------------------------
DisableSpit
        STA damageFlashFlag
        LDA #$00
        STA camelSPitState
        RTS 

;-------------------------------------------------------------------------
; PlayerSHipExplosion
;-------------------------------------------------------------------------
PlayerSHipExplosion
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$FF
        STA camelSPitState
        LDA #$01
        STA $D409    ;Voice 2: Pulse Waveform Width - Low-Byte
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        LDA #$01
        STA $D027    ;Sprite 0 Color
        LDA #$00
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA #$D2
        JSR UpdateShipFrame
        LDX #$00
b1DE8   STX $D020    ;Border Color
        LDY #$00
b1DED   DEY 
        BNE b1DED
        CPX #$A0
        BNE b1DF7
        INC Sprite0Ptr
b1DF7   CPX #$50
        BNE b1DFE
        INC Sprite0Ptr
b1DFE   DEX 
        BNE b1DE8
        JMP NextLine

;-------------------------------------------------------------------------
; NextLine
;-------------------------------------------------------------------------
NextLine
        STA Sprite0Ptr
        LDA #SPR_CAMEL_AND_SHIP_MASK_ON
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        LDA #BLACK
        STA $D020    ;Border Color
        LDA #SPR_SHIP_AND_RADAR_MASK_ON
        JSR EnableExplosionSprites
        LDA shipXPosition
        STA explosionX1
        STA explosionX2
        STA explosionX3
        STA explosionX4
        LDA shipYPosition
        STA explosionY1
        STA explosionY2
        STA explosionY3
        STA explosionY4
;-------------------------------------------------------------------------
; ExplosionX1Update
;-------------------------------------------------------------------------
ExplosionX1Update
        LDA explosionX1
        BEQ ExplosionX2Update
        INC explosionX1
ExplosionX2Update
        LDA explosionX2
        BEQ ExplosionX3Update
        INC explosionX2
ExplosionX3Update
        LDA explosionX3
        BEQ ExplosionX4Update
        DEC explosionX3
ExplosionX4Update
        LDA explosionX4
        BEQ ExplosionY1Update
        DEC explosionX4
ExplosionY1Update
        LDA explosionY1
        BEQ ExplosionY2Update
        INC explosionY1
ExplosionY2Update
        LDA explosionY2
        BEQ ExplosionY3Update
        DEC explosionY2
ExplosionY3Update
        LDA explosionY3
        BEQ ExplosionY4Update
        INC explosionY3
ExplosionY4Update
        LDA explosionY4
        BEQ EnableExplosionSprites2
        DEC explosionY4
EnableExplosionSprites2
        LDY #$00
b1E5F   DEY 
        BNE b1E5F
        LDA #EXPLOSION_FRAME1
        STA Sprite1Ptr
        STA Sprite2Ptr
        STA Sprite3Ptr

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
        JMP ExplosionEnded

b1E90   LDX #$04
b1E92   STX currentCharacter
        TXA 
        CLC 
        ASL 
        STA colorForCurrentCharacter
        LDA @wexplosionY1 - 1,X
        LDX colorForCurrentCharacter
        STA SpriteXPos-1,X
        LDX currentCharacter
        LDA #$01
b1EA5   ASL 
        DEX 
        BNE b1EA5
        ROR 
        STA tempVar
        LDX currentCharacter
        LDA @wexplosionX1-1,X
        CLC 
        ASL 
        LDX colorForCurrentCharacter
        STA SpriteXPos-2,X
        BCC b1EC5
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA tempVar
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j1ECF

b1EC5   LDA tempVar
        EOR #$FF
        AND $D010    ;Sprites 0-7 MSB of X coordinate
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; j1ECF
;-------------------------------------------------------------------------
j1ECF
        LDX currentCharacter
        DEX 
        CPX #$FF
        BNE b1E92
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
        JMP DecreaseExplosionCounter

;-------------------------------------------------------------------------
; UpdateShipFrame
;-------------------------------------------------------------------------
UpdateShipFrame
        STA Sprite0Ptr
        LDY #$00
b1EE8   DEY 
        BNE b1EE8
        RTS 

explosionCounter = camelMarkerX
;-------------------------------------------------------------------------
; EnableExplosionSprites
;-------------------------------------------------------------------------
EnableExplosionSprites
        STA $D015    ;Sprite display Enable
        LDA #$60
        STA explosionCounter
        RTS 

;-------------------------------------------------------------------------
; DecreaseExplosionCounter
;-------------------------------------------------------------------------
DecreaseExplosionCounter
        DEC explosionCounter
        BEQ b1EFB
        JMP ExplosionX1Update

b1EFB   JMP DisableExplosionSprites

; Redundant Code
        ORA $D0,X
;-------------------------------------------------------------------------
; InitializeGameVariables
;-------------------------------------------------------------------------
InitializeGameVariables
        LDA #$00
        STA enableBullets
        STA bulletDirection
        LDA #$CC
        STA Sprite1Ptr
        LDA #$0A
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$00
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        STA camelState
        LDA #$C1
        STA camelHeadFrame
        LDA #$FF
        STA landPositionMinor
        LDA #$09
        STA landPositionMajor
        LDA #$00
        STA aFFRedundant
        STA aFFRedundant
        LDA #$04
        STA camelLandPositionCounter
        LDA #$00
        STA aFFRedundant
        SEI 
        LDA #<IRQInterruptHandler
        STA IRQ_LO    ;IRQ
        LDA #>IRQInterruptHandler
        STA IRQ_HI    ;IRQ

        CLI 
        LDA #$10
        STA camelFrameRate
        JSR DisplayStars
        LDA #$00
        STA currentStar
        LDA #TWINKLE_RATE
        STA starTwinkleRate
        LDA #$00
        STA unknownPurpose1
        LDA #$10
        STA camelSpitSpeedCounter
        STA camelSPitSpeed
        LDA #$03
        STA camelSPitRateCounter
        STA camelSpitRate
        LDA #$07
        STA camelSpitBombRateCounter
        STA camelSpitBombRate
        LDA #$00
        STA camelSPitState
        LDA #$D0
        STA camelSpitFrame
        LDA #$01
        STA $D029    ;Sprite 2 Color
        STA a5ARedundant
        LDA #$00
        STA a5CRedundant
        STA damageFlashFlag
        LDA #$04
        STA playerHealth
        STA storeColourCounter
        STA scoreScreenHi
        LDA #$00
        STA $D021    ;Background Color 0
        NOP 
        LDA #$D8
        STA storeColorHi
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA #$01
        STA scoreBonus
        LDA camelsRemaining
        STA camelsRemaining
        LDA #ROCKET_MOVE_RATE
        STA rocketMoveRate
        LDA #CAMEL_SPEED
        STA camelSpeed
        LDA bottomRowFlag
        BEQ b1FA3
        JSR ClearBottomRows
b1FA3   LDA #BOTTOM_ROWS_DO_CLEAR
        STA bottomRowFlag
        JSR DisplayCamelBonus
        JSR SetLevelDifficulty
        LDA camelCollision
        STA camelCollision
        LDA #$19
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA collisionDetectedBits

        .FILL 54, $EA

        JMP MainGameLoop

        .FILL 13, $EA

.include "charset.asm"

landscapeRow0=*-$01
        .BYTE $20,$20,$20,$20,$20,$1B,$23
        .BYTE $23,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$1D,$1E,$20,$20,$20
landscapeRow1   
        .BYTE $20,$20,$20,$20,$20,$1B,$1D,$2B
        .BYTE $2B,$1E,$23,$1C,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$1B,$23,$1C,$1B,$1F
        .BYTE $1D,$23,$1D,$2B,$2B,$1E,$20,$20
landscapeRow2   
        .BYTE $20,$20,$20,$1B,$23,$1D,$2B,$2B
        .BYTE $2B,$2B,$2B,$2B,$1E,$20,$20,$20
        .BYTE $20,$20,$20,$1D,$1E,$20,$20,$20
        .BYTE $20,$20,$1B,$1D,$2B,$1E,$1D,$2B
        .BYTE $2B,$2B,$2B,$2B,$2B,$2B,$1E,$20
landscapeRow3   
        .BYTE $20,$1F,$1F,$1D,$2B,$2B,$2B,$2B
        .BYTE $2B,$2B,$2B,$2B,$2B,$1E,$23,$1F
        .BYTE $1F,$1F,$1D,$2B,$2B,$1E,$1F,$1F
        .BYTE $1F,$1F,$1D,$2B,$2B,$2B,$2B,$2B
        .BYTE $2B,$2B,$2B,$2B,$2B,$2B,$2B,$1E
        .BYTE $1F,$13,$19,$13,$33,$32,$37,$36
        .BYTE $38
shipSpeedsArray   
        .BYTE $FF,$0A,$08,$06,$04,$02,$01,$01
        .BYTE $01,$01,$01,$01,$01,$01,$01,$01
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20
camelCurrentColorArray   
        .BYTE $20,$07,$07,$07,$07,$07,$07,$07
f22CF   
        .BYTE $07,$00,$00,$00,$00,$00,$00,$00
camelMarkerScreenLoPtrArray   
        .BYTE $00,$07,$0B,$0F,$13,$17,$1B,$1B
camelHealthMinorArray   
        .BYTE $1C,$10,$10,$10,$10,$10,$10,$10
camelHealthArray   
        .BYTE $10,$06,$06,$06,$06,$06,$06,$06
        .BYTE $06,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$FF,$FF,$00,$00,$FF,$FF,$00
starXPositionArray   
        .BYTE $FF,$04,$07,$12,$09,$07,$15,$18
        .BYTE $0C,$23,$13,$19,$04,$20,$22,$01
starYPositionArray   
        .BYTE $25,$06,$06,$07,$08,$09,$0A,$07
        .BYTE $09,$09,$08,$08,$07,$09,$06,$09
camelHeadFrameArray   
        .BYTE $07,$02,$D9,$DA,$D9,$FF,$FF,$FF
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
; InitializeCamelStats
;-------------------------------------------------------------------------
InitializeCamelStats
        LDY #$08
b2402   LDA initialCamelMarkerScreenLoPtrArray,Y
        STA camelMarkerScreenLoPtrArray,Y
        LDA initialCamelHealthMinorArray,Y
        STA camelHealthMinorArray,Y
        LDA initialCamelHealthArray,Y
        STA camelHealthArray,Y
        JMP InitialiseCamelColor
        RTS 

initialCamelMarkerScreenLoPtrArray=*-$01
        .BYTE $03,$07,$0B,$0F,$13,$17,$1B
initialCamelHealthMinorArray   
        .BYTE $1C,$10,$10,$10,$10,$10,$10,$10
initialCamelHealthArray   
        .BYTE $10,$06,$06,$06,$06,$06,$06,$06
camelColorsArray   
        .BYTE $06,$FF,$0D,$02,$06,$0F,$09,$07
        .BYTE $07,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF
;-------------------------------------------------------------------------
; InitialiseCamelColor
;-------------------------------------------------------------------------
InitialiseCamelColor
        LDA #$07
        STA camelCurrentColorArray,Y
        DEY 
        BNE b2402
        RTS 

;-------------------------------------------------------------------------
; FlashPlayerScore
;-------------------------------------------------------------------------
FlashPlayerScore
        DEC storeColourCounter
        BNE b2451
        LDA #$04
        STA storeColourCounter
b2451   LDX storeColourCounter
        LDA scoreFlashColors,X
        LDY #$07
b2458   STA (scoreColorLo),Y
        DEY 
        BNE b2458
        RTS 

scoreFlashColors = *-$01
        .BYTE $0E,$07,$0A,$01,$EA
b2463   STY scoreScreenLoPtr
b2465   LDA (storeScreenLo),Y
        CLC 
        ADC #$01
        STA (storeScreenLo),Y
        CMP #$3A
        BNE b2477
        LDA #$30
        STA (storeScreenLo),Y
        DEY 
        BNE b2465
b2477   LDY scoreScreenLoPtr
        DEX 
        BNE b2463
        RTS 

;-------------------------------------------------------------------------
; Add1PointToScore
;-------------------------------------------------------------------------
Add1PointToScore
        JSR DecreaseCamelHealth
        LDY #$07
        LDX #$01
        JMP b2463

;-------------------------------------------------------------------------
; AddBonusPoints
;-------------------------------------------------------------------------
AddBonusPoints
        STA @wa0046
        TXA 
        PHA 
        LDA scoreBonus
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
        LDA scoreBonus
        CMP #$40
        BEQ b24A2
        ASL 
b24A2   STA scoreBonus
        JSR DisplayCamelBonus
        PLA 
        TAX 
        RTS 

;-------------------------------------------------------------------------
; DisplayCamelBonus
;-------------------------------------------------------------------------
DisplayCamelBonus
        LDA #$20
        STA SCREEN_RAM + $0063
        STA SCREEN_RAM + $0064
        LDA #$30
        STA SCREEN_RAM + $0065
        LDY scoreBonus
b24B9   LDX #$03
b24BB   INC SCREEN_RAM + $0062,X
        LDA SCREEN_RAM + $0062,X
        CMP #$3A
        BNE b24DC
        LDA #$30
        STA SCREEN_RAM + $0062,X
        DEX 
        BEQ b24DC
        LDA SCREEN_RAM + $0062,X
        CMP #$20
        BNE b24BB
        LDA #$30
        STA SCREEN_RAM + $0062,X
        JMP b24BB

b24DC   DEY 
        BNE b24B9
        RTS 

;-------------------------------------------------------------------------
; CheckRemainingCamels
;-------------------------------------------------------------------------
CheckRemainingCamels
        DEC camelsRemaining
        BEQ b24E7
;-------------------------------------------------------------------------
; s24E6
;-------------------------------------------------------------------------
s24E6 =*+$02
        JMP ResetCamelHeadSprite

b24E7   
        JMP MoveToNextSector

        NOP 
        LDA @wa0095
        STA collisionDetectedBits
        AND #$00
        BNE b24F6
        LDA collisionDetectedBits
b24F6   RTS 

;-------------------------------------------------------------------------
; UpdateShipSprite
;-------------------------------------------------------------------------
UpdateShipSprite
        LDA shipYPosition
        STA $D001    ;Sprite 0 Y Pos
        LDA shipXPosition
        ASL 
        STA SpriteXPos    ;Sprite 0 X Pos
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
; EngageHyperDrive
;-------------------------------------------------------------------------
EngageHyperDrive
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$80
        STA camelSPitState
        LDA #$A0
        STA shipXPosition
        LDA shipYPosition
        STA shipYPosition
        JSR ResetRocketSPrite
        NOP 
        JSR UpdateShipSprite
        LDX #$20
b2536   LDA hyperDriveEngagingText,X
        STA SCREEN_RAM + $03C2,X
        LDA #$01
        STA COLOR_RAM + $03C2,X
        DEX 
        BNE b2536
        LDX #$20
b2546   LDA #$00
        STA scoreScreenLoPtr
        STA screenLineLoPtr
b254C   LDA screenLineLoPtr
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA scoreScreenLoPtr
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        LDA screenLineLoPtr
        CLC 
        ADC #$30
        STA screenLineLoPtr
        LDA scoreScreenLoPtr
        ADC #$00
        STA scoreScreenLoPtr
        STA $D020    ;Border Color
        CMP #$FF
        BNE b254C
        DEX 
        BNE b2546
        JMP InitializeLevelAfterHyperDrive

hyperDriveEngagingText   =*-$01
.enc "petscii"
.TEXT 'TRANS SECTOR HYPERDRIVE ENGAGING'
.enc "none"
;-------------------------------------------------------------------------
; HyperDriveResetShipSrite
;-------------------------------------------------------------------------
HyperDriveResetShipSrite
        LDA #$07
        STA $D025    ;Sprite Multi-Color Register 0
        LDA #$05
        STA $D015    ;Sprite display Enable
        RTS 

;-------------------------------------------------------------------------
; InitializeLevelAfterHyperDrive
;-------------------------------------------------------------------------
InitializeLevelAfterHyperDrive
        LDA #$00
        STA $D020    ;Border Color
        STA $D404    ;Voice 1: Control Register
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA #$00
        STA shipDirection
        LDA #$80
        STA camelMarkerX
        STA unknownPurpose1
        LDA #$10
        STA currentEnemyID
        JSR InitializeRocket
        NOP 
        NOP 
;-------------------------------------------------------------------------
; MainHyperDriveLoop
;-------------------------------------------------------------------------
MainHyperDriveLoop
        JSR UpdatePlayerDuringHyperDrive
        JSR UpdateHyperdriveLandscape
        JSR HyperDriveMoveRocket
        LDA $D01E    ;Sprite to Sprite Collision Detect
        BEQ b25D4
        JMP PlayerSHipExplosion

b25D4   LDA shipXPosition
        CMP #$40
        BEQ b25DD
        JMP MainHyperDriveLoop

b25DD   JMP ClearRocketSPrite

;-------------------------------------------------------------------------
; UpdatePlayerDuringHyperDrive
;-------------------------------------------------------------------------
UpdatePlayerDuringHyperDrive
        DEC camelMarkerX
        BEQ b25E5
        RTS 

b25E5   LDA unknownPurpose1
        STA camelMarkerX
        LDA shipXPosition
        JSR UpdateShipSprite
        JSR CheckJoystickInput
        LDA #$A1
        SBC shipXPosition
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
; UpdateHyperdriveLandscape
;-------------------------------------------------------------------------
UpdateHyperdriveLandscape
        DEC hyperdriveShipMoveCounter
        BEQ b260C
        RTS 

b260C   LDA currentEnemyID
        STA hyperdriveShipMoveCounter
        DEC hyperdriveLanscapeMoveCOunter
        BEQ b2615
        RTS 

b2615   LDA hyperdriveLanscapeMoveRate
        STA hyperdriveLanscapeMoveCOunter
        JSR MoveLandscape
        DEC shipXPosition
        DEC hyperdriveLanscapeMoveRate
        JMP UpdateShipSprite

;-------------------------------------------------------------------------
; HyperDriveInitializeCOunters
;-------------------------------------------------------------------------
HyperDriveInitializeCOunters
        LDA #$60
        STA hyperdriveLanscapeMoveCOunter
        STA hyperdriveLanscapeMoveRate
        LDA #$10
        STA hyperdriveShipMoveCounter
        RTS 

;-------------------------------------------------------------------------
; AnimateShipDuringHyperDrive
;-------------------------------------------------------------------------
AnimateShipDuringHyperDrive
        LDA #$01
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA shipXPosition
        CMP #$E0
        BEQ b265D
        LDA #$01
        STA hyperdriveLanscapeMoveRate
        LDA shipXPosition
        STA $D025    ;Sprite Multi-Color Register 0
        ADC #$08
        STA $D026    ;Sprite Multi-Color Register 1
        LDA $D012    ;Raster Position
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
        JSR HyperDriveDecreaseShipX
        JMP ClearRocketSPrite

b265D   JMP j266E

;-------------------------------------------------------------------------
; HyperDriveDecreaseShipX
;-------------------------------------------------------------------------
HyperDriveDecreaseShipX
        LDA hyperdriveShipMoveCounter
        CMP #$01
        BNE b2668
        DEC shipXPosition
b2668   JSR MoveLandscape
        JMP UpdateHyperdriveLandscape

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
        JSR LandscapeUpdate
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
        JMP HyperDriveResetShipY

;-------------------------------------------------------------------------
; LandscapeUpdate
;-------------------------------------------------------------------------
LandscapeUpdate
        TXA 
        PHA 
        JSR MoveLandscape
        PLA 
        TAX 
        LDA $D012    ;Raster Position
        RTS 

hyperDriveUpdatePlayerCounter = camelMarkerX
;-------------------------------------------------------------------------
; HyperDriveFinishing
;-------------------------------------------------------------------------
HyperDriveFinishing
        LDA #$78
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDX #$20
        LDA #$20
b26BA   STA SCREEN_RAM + $03C2,X
        DEX 
        BNE b26BA
        LDA #$0E
        STA $D026    ;Sprite Multi-Color Register 1
        LDA #$00
        STA hyperDriveUpdatePlayerCounter
        STA unknownPurpose1
b26CB   LDA hyperDriveUpdatePlayerCounter
        STA shipXPosition
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        ADC #$80
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        JSR FlashShipSPriteColor
        INC hyperDriveUpdatePlayerCounter
        LDA hyperDriveUpdatePlayerCounter
        CMP #$A0
        BNE b26CB
        INC unknownPurpose1
        LDA unknownPurpose1
        CMP #$A0
        BEQ b2701
        LDA unknownPurpose1
        STA hyperDriveUpdatePlayerCounter
        JMP b26CB

b2701   JMP ExitHyperDriveFinishing

;-------------------------------------------------------------------------
; FlashShipSPriteColor
;-------------------------------------------------------------------------
FlashShipSPriteColor
        INC $D025    ;Sprite Multi-Color Register 0
        JMP UpdateShipSprite

ExitHyperDriveFinishing
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        JMP HyperDriveEnded

;-------------------------------------------------------------------------
; InitializeRocket
;-------------------------------------------------------------------------
InitializeRocket
        LDA #$F0
        STA camelMarkerOffset
        LDA #$04
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA rocketMoveRate
        STA enemyMoveCounterMajor
        LDA #$07
        STA enemyMoveCounterMinor
        LDA #$07
        STA landPositionMajor
        JMP HyperDriveInitializeCOunters

rocketX = camelMarkerOffset
;-------------------------------------------------------------------------
; HyperDriveMoveRocket
;-------------------------------------------------------------------------
HyperDriveMoveRocket
        DEC enemyMoveCounterMajor
        BEQ b2732
        RTS 

b2732   LDA rocketMoveRate
        STA enemyMoveCounterMajor
        LDA camelMarkerOffset
        CMP #$F0
        BNE b274F
        LDA shipYPosition
        SBC #$10
        STA $D005    ;Sprite 2 Y Pos
        LDA $D012    ;Raster Position
        AND #$1F
        CLC 
        ADC $D005    ;Sprite 2 Y Pos
        STA $D005    ;Sprite 2 Y Pos
b274F   INC camelMarkerOffset
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        LDA camelMarkerOffset
        ASL 
        STA $D004    ;Sprite 2 X Pos
        BCC b276C
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$04
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP SetRocketSpriteFrame

b276C   LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FB
        STA $D010    ;Sprites 0-7 MSB of X coordinate
;-------------------------------------------------------------------------
; SetRocketSpriteFrame
;-------------------------------------------------------------------------
SetRocketSpriteFrame
        LDX enemyMoveCounterMinor
        LDA rocketSpritesArray,X
        STA Sprite2Ptr
        DEC landPositionMajor
        BEQ SetRocketHoming
b2780   RTS 

;-------------------------------------------------------------------------
; HyperdriveDecreaseCounter
;-------------------------------------------------------------------------
HyperdriveDecreaseCounter
        LDA #$07
        STA landPositionMajor
        DEC enemyMoveCounterMinor
        BNE b2780
        LDA #$07
        STA enemyMoveCounterMinor
        RTS 

rocketSpritesArray=*-$01
        .BYTE $DB,$DC,$DD,$DE,$DD,$DC,$DB

SetRocketHoming   
        LDA $D005    ;Sprite 2 Y Pos
        CMP shipYPosition
        BPL b27A2
        INC $D005    ;Sprite 2 Y Pos
        INC $D005    ;Sprite 2 Y Pos
b27A2   DEC $D005    ;Sprite 2 Y Pos
        JMP HyperdriveDecreaseCounter

;-------------------------------------------------------------------------
; ClearRocketSPrite
;-------------------------------------------------------------------------
ClearRocketSPrite
        LDA #$01
        STA $D015    ;Sprite display Enable
        JMP AnimateShipDuringHyperDrive

;-------------------------------------------------------------------------
; ResetRocketSPrite
;-------------------------------------------------------------------------
ResetRocketSPrite
        STA $D015    ;Sprite display Enable
        LDA #$CA
        STA shipSpriteFrame
        STA Sprite0Ptr
        JMP HyperDriveResetShipSrite

; Redundant/Orphaned Code
        DEC a6BRedundant
        BEQ ResetCamelSpeedCounter
        RTS 

;-------------------------------------------------------------------------
; ResetCamelSpeedCounter
;-------------------------------------------------------------------------
ResetCamelSpeedCounter
        LDA camelSpeed
        STA camelSpeedCounter
        DEC enemyMoveCounterMinor
        RTS 

;-------------------------------------------------------------------------
; TestSpitCollisionXPos
;-------------------------------------------------------------------------
TestSpitCollisionXPos
        STA camelSpitX
        LDA shipXPosition
        CLC 
        ROR 
        STA scoreScreenLoPtr
        LDA camelSpitX
        CLC 
        ROR 
        CMP scoreScreenLoPtr
        RTS 

player1Statistics = $38C0
;-------------------------------------------------------------------------
; InitializePlayerStats
;-------------------------------------------------------------------------
InitializePlayerStats
        LDA player2Lives
        CLC 
        ADC #$00
        STA player2Lives
        NOP 
        LDA playerTUrn
        STA playerTUrn
        LDA playerSector
        STA playerSector
        STA camelHeadFrameF3
        LDA #$00
        STA camelHeadFrameF1
        STA camelHeadFrameF2
        JSR InitializePlayerStatsCont
        LDX #$30
b27F8   LDA camelCurrentColorArray,X
        STA player1Statistics,X
        DEX 
        BNE b27F8
        NOP 
        NOP 
        NOP 
        JMP InitializeSPrites

;-------------------------------------------------------------------------
; PlayerLoseLife
;-------------------------------------------------------------------------
PlayerLoseLife
        LDA playerTUrn
        CMP #$02
        BEQ b281A
        LDA player1Lives
        BEQ b281A
        DEC player1Lives
        LDA #$02
        STA playerTUrn
        JMP Player2Selected

b281A   DEC player2Lives
        JMP InitializeGameVariables2

; Redundant/Orphaned Code
        JMP (SCREEN_RAM + $01D0)

j2822
        JMP j2822

        DEC player2Lives
;-------------------------------------------------------------------------
; InitializeGameVariables2
;-------------------------------------------------------------------------
InitializeGameVariables2
        LDA #$01
        STA playerTUrn
;-------------------------------------------------------------------------
; Player2Selected
;-------------------------------------------------------------------------
Player2Selected
        LDA #>player1Statistics
        STA screenLineLoPtr
        LDA #<player1Statistics
        STA scoreScreenLoPtr
        LDA playerTUrn
        CMP #$01
        BNE b283B
        INC screenLineLoPtr
b283B   LDY #$30
b283D   LDA camelCurrentColorArray,Y
        STA (scoreScreenLoPtr),Y
        DEY 
        BNE b283D
        LDY #$31
        LDA camelPositionMinor
        STA (scoreScreenLoPtr),Y
        INY 
        LDA camelPositionMajor
        STA (scoreScreenLoPtr),Y
        INY 
        LDA playerSector
        STA (scoreScreenLoPtr),Y
        JSR StoreRemainingCamels
        LDA playerTUrn
        CMP #$02
        BEQ b286B
        LDA #$38
        STA screenLineLoPtr
        LDA #$4F
        STA storeScreenLo
        STA scoreColorLo
        JMP j2875

b286B   LDA #$39
        STA screenLineLoPtr
        LDA #$70
        STA storeScreenLo
        STA scoreColorLo

j2875
        LDY #$30
b2877   LDA (scoreScreenLoPtr),Y
        STA camelCurrentColorArray,Y
        DEY 
        BNE b2877
        LDY #$31
        LDA (scoreScreenLoPtr),Y
        STA camelPositionMinor
        INY 
        LDA (scoreScreenLoPtr),Y
        STA camelPositionMajor
        INY 
        LDA (scoreScreenLoPtr),Y
        STA playerSector
        JSR ReadCamelsRemaining

PrepareToStart
        JSR InitPrepareToStart
        RTS 

;-------------------------------------------------------------------------
; InitializePlayerStats3
;-------------------------------------------------------------------------
InitializePlayerStats3
        LDA #$06
        STA camelsRemaining
        STA camelHeadFrameF4
        JMP InitializeCamelStats

;-------------------------------------------------------------------------
; StoreRemainingCamels
;-------------------------------------------------------------------------
StoreRemainingCamels
        INY 
        LDA camelsRemaining
        STA (scoreScreenLoPtr),Y
        RTS 

;-------------------------------------------------------------------------
; ReadCamelsRemaining
;-------------------------------------------------------------------------
ReadCamelsRemaining
        INY 
        LDA (scoreScreenLoPtr),Y
        STA camelsRemaining
        RTS 

;-------------------------------------------------------------------------
; ExplosionEnded
;-------------------------------------------------------------------------
ExplosionEnded
        LDX #$F6
        TXS 
        NOP 
        NOP 
        NOP 
        NOP 
        JMP InitializeSPrites

;-------------------------------------------------------------------------
; InitPrepareToStart
;-------------------------------------------------------------------------
InitPrepareToStart
        LDX #$07
        LDA #$01
b28BA   STA COLOR_RAM + $004F,X
        STA COLOR_RAM + $0070,X
        DEX 
        BNE b28BA
        LDX #$28
        LDA #$20
b28C7   STA SCREEN_RAM + $009F,X
        DEX 
        BNE b28C7
        LDX #$0B
b28CF   LDA txt_PlayPlayer,X
        STA SCREEN_RAM + $00AB,X
        LDA #$0E
        STA COLOR_RAM + $00AB,X
        DEX 
        BNE b28CF
        LDX #$0D
        LDA playerTUrn
        CMP #$02
        BNE b28E7
        LDX #$10
b28E7   LDY #$03
b28E9   LDA txt_PlayPlayer,X
        STA SCREEN_RAM + $00B8,Y
        LDA #$07
        STA COLOR_RAM + $00B8,Y
        INX 
        DEY 
        BNE b28E9
        LDA #$F0
        STA scoreScreenLoPtr
b28FC   LDX scoreScreenLoPtr
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
        DEC scoreScreenLoPtr
        BNE b28FC
        LDX #$28
        LDA #$20
b291C   STA SCREEN_RAM + $009F,X
        DEX 
        BNE b291C
        LDX #$06
        JMP DisplayCamelMarker

.enc "petscii"
txt_PlayPlayer=*-$01
        .TEXT 'PLAY PLAYER ENOOWT'
.enc "none"
;-------------------------------------------------------------------------
; InitializePlayerStatsCont
;-------------------------------------------------------------------------
InitializePlayerStatsCont
        STA camelPositionMinor
        STA camelPositionMajor
        JMP j2E84

;-------------------------------------------------------------------------
; DisplayCamelMarker
;-------------------------------------------------------------------------
DisplayCamelMarker
        LDX #$06
b2942   LDA camelHealthArray,X
        CMP #$FF
        BEQ b295E
        JSR SetCamelMarkerScreenLoPtr
        NOP 
        STA currentYPosition
        LDA #CHAR_CAMEL
        STA currentCharacter
        LDA #WHITE
        STA colorForCurrentCharacter
        STX tempXStorage
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX tempXStorage
b295E   DEX 
        BNE b2942
        RTS 

SetCamelMarkerScreenLoPtr
        LDA camelMarkerScreenLoPtrArray,X
        STA currentXPosition
        LDA #$04
        RTS 

;-------------------------------------------------------------------------
; ClearBottomRowFlagPlayerStats
;-------------------------------------------------------------------------
ClearBottomRowFlagPlayerStats
        LDA #$DD
        STA bottomRowFlag
        JMP InitializePlayerStats3

;-------------------------------------------------------------------------
; ClearBottomRows
;-------------------------------------------------------------------------
ClearBottomRows
        LDA #$20
        LDX #$50
b2975   STA SCREEN_RAM + $0397,X
        DEX 
        BNE b2975
        JMP j2AF0

;-------------------------------------------------------------------------
; MoveToNextSector
;-------------------------------------------------------------------------
MoveToNextSector
        INC playerSector
        LDA playerSector
        CMP #$20
        BNE b2988
        DEC playerSector
b2988   JMP ResetCamelPosition

;-------------------------------------------------------------------------
; HyperDriveEnded
;-------------------------------------------------------------------------
HyperDriveEnded
        LDX #$F6
        TXS 
        LDA #$00
        STA bottomRowFlag
        JMP PrepareFOrNextSector

;-------------------------------------------------------------------------
; ResetCamelPosition
;-------------------------------------------------------------------------
ResetCamelPosition
        JSR InitializeCamelStats
        LDA #$00
        STA camelPositionMinor
        STA camelPositionMajor
        JSR DisplayCamelMarker
        JMP ResetCamelsRemaining

;-------------------------------------------------------------------------
; PrepareFOrNextSector
;-------------------------------------------------------------------------
PrepareFOrNextSector
        LDA #$00
        STA camelPositionMinor
        STA camelPositionMajor
        NOP 
        NOP 
        NOP 
        LDA #$00
        STA bottomRowFlag
        JMP InitializeSPrites

;-------------------------------------------------------------------------
; ResetCamelsRemaining
;-------------------------------------------------------------------------
ResetCamelsRemaining
        LDA #$06
        STA camelsRemaining
        JMP EngageHyperDrive

;-------------------------------------------------------------------------
; SetLevelDifficulty
;-------------------------------------------------------------------------
SetLevelDifficulty
        LDX playerSector
        LDA camelSpeedsForLevels,X
        STA camelSpeed
        LDA camelSpitSpeedsForLevels,X
        STA camelSpitSpeedCounter
        STA camelSPitSpeed
        LDA camelSpitRatesForLevels,X
        STA camelSPitRateCounter
        STA camelSpitRate
        LDA rocketMoveRatesForLevels,X
        STA rocketMoveRate
        LDA spitBombRatesForLevels,X
        STA camelSpitBombRateCounter
        STA camelSpitBombRate
        LDX #$28
b29DE   LDA playerStats,X
        STA SCREEN_RAM + $0397,X
        LDA #$07
        STA COLOR_RAM + $0397,X
        DEX 
        BNE b29DE
        JMP Screen_UpdatePlayerStats

playerStats   =*-$01
.enc "petscii"
.TEXT 'JETS            SECTOR 00         JETS  '
.enc "none"

SCN_PL1LIVES                    = $079D
SCN_PL2LIVES                    = $07BF
COL_PL1LIVES    = $DB9D
COL_PL2LIVES    = $DBBF
COL_SECTOR      = $DBAF
SCN_SECTOR                      = $07AF
;-------------------------------------------------------------------------------
; Screen_UpdatePlayerStats
; Refresh lives and current sector on the screen
; Called by: InitLevel_SetDifficulty (JMP)
;-------------------------------------------------------------------------------
Screen_UpdatePlayerStats
        LDA player1Lives
        CLC
        ADC #CHAR_0
        STA SCN_PL1LIVES
        LDA player2Lives
        CLC
        ADC #CHAR_0
        STA SCN_PL2LIVES
        LDA #PURPLE
        STA COL_PL1LIVES
        STA COL_PL2LIVES
        LDX playerSector
DisplaySectorLoop
        INC SCN_SECTOR+1
        LDA SCN_SECTOR+1
        CMP #CHAR_9+1
        BNE SkipSectorHighDigit
        LDA #CHAR_0
        STA SCN_SECTOR+1
        INC SCN_SECTOR
SkipSectorHighDigit
        DEX
        BNE DisplaySectorLoop
        LDA #CYAN
        STA COL_SECTOR+1
        STA COL_SECTOR
        RTS
        NOP

camelSpeedsForLevels   
        .BYTE $80,$80,$70,$60,$50,$80,$70,$60
        .BYTE $50,$70,$70,$70,$70,$60,$60,$60
        .BYTE $60,$60,$5A,$58,$58,$58,$58,$58
        .BYTE $58,$56,$54,$52,$50,$4E,$4C,$4A
camelSpitSpeedsForLevels   
        .BYTE $10,$10,$0E,$0C,$0A,$10,$0E,$0C
        .BYTE $0A,$0E,$0E,$0E,$0E,$0C,$0C,$0C
        .BYTE $0C,$0A,$0A,$0A,$0A,$09,$09,$09
        .BYTE $09,$08,$08,$08,$08,$08,$08,$08
camelSpitRatesForLevels   
        .BYTE $03,$03,$03,$03,$03,$02,$02,$02
        .BYTE $02,$01,$01,$01,$01,$03,$03,$03
        .BYTE $03,$02,$02,$02,$02,$01,$01,$01
        .BYTE $01,$01,$01,$01,$01,$01,$01,$01
rocketMoveRatesForLevels   
        .BYTE $40,$40,$3E,$38,$36,$34,$32,$30
        .BYTE $2E,$2D,$2C,$2B,$2A,$29,$28,$27
        .BYTE $26,$26,$25,$25,$24,$24,$23,$23
        .BYTE $22,$22,$21,$21,$20,$20,$20,$20
spitBombRatesForLevels   
        .BYTE $07,$07,$07,$07,$07,$07,$07,$07
        .BYTE $07,$06,$06,$06,$05,$04,$03,$03
        .BYTE $03,$03,$03,$03,$02,$02,$01,$03
        .BYTE $03,$02,$02,$01,$01,$01,$01,$01
;-------------------------------------------------------------------------
; j2AF0
;-------------------------------------------------------------------------
j2AF0
        LDA player1Lives
        BEQ b2AFB
        LDA player2Lives
        BEQ b2AFB
        JMP PlayerLoseLife

b2AFB   LDA player1Lives
        CMP player2Lives
        BNE b2B04
b2B01   JMP j2DF8

b2B04   LDA playerTUrn
        CMP #$02
        BEQ b2B0E
        DEC player1Lives
        INC player2Lives
b2B0E   DEC player2Lives
        LDA player1Lives
        CMP player2Lives
        BEQ b2B01
        JMP PrepareToStart

;-------------------------------------------------------------------------
; DetectShipAndCamelCollisions
;-------------------------------------------------------------------------
DetectShipAndCamelCollisions
        LDA @wa0095
        STA collisionDetectedBits
        LDA camelState
        BEQ b2B23
b2B22   RTS 

b2B23   LDA @wa0095
        AND #$02
        BNE b2B22
        LDA collisionDetectedBits
        AND #$04
        BNE b2B22
        LDA camelCollision
        BEQ b2B22
        LDA collisionDetectedBits
        AND #$01
        BEQ b2B22
        JMP PlayerSHipExplosion

;-------------------------------------------------------------------------
; s2B3D
;-------------------------------------------------------------------------
s2B3D
        LDX #$00
b2B3F   LDA #$20
        STA SCREEN_RAM + $00F0,X
        STA SCREEN_RAM + $0100,X
        STA SCREEN_RAM + $0200,X
        STA SCREEN_RAM + $0300,X
        LDA #$01
        STA COLOR_RAM + $0000,X
        STA COLOR_RAM + $0100,X
        STA COLOR_RAM + $0200,X
        STA COLOR_RAM + $0300,X
        DEX 
        BNE b2B3F
        RTS 

;-------------------------------------------------------------------------
; DisplayMenu
;-------------------------------------------------------------------------
DisplayMenu
        JSR s2B3D
        LDX #$14
b2B64   LDA f2B6F,X
        STA SCREEN_RAM + $0149,X
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
        STA camelSPitState
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
        STA SpriteXPos    ;Sprite 0 X Pos
        STA $D004    ;Sprite 2 X Pos
        LDA #$C0
        STA $D002    ;Sprite 1 X Pos
        STA $D006    ;Sprite 3 X Pos
        LDA #AMC_LOGO_SPRITE1
        STA Sprite0Ptr
        LDA #AMC_LOGO_SPRITE2
        STA Sprite1Ptr
        LDA #AMC_LOGO_SPRITE3
        STA Sprite2Ptr
        LDA #AMC_LOGO_SPRITE4
        STA Sprite3Ptr
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
        STA SCREEN_RAM + $025C,X
        LDA f2C8F,X
        STA SCREEN_RAM + $02AC,X
        LDA f2C2F,X
        STA SCREEN_RAM + $02FC,X
        LDA f2C6F,X
        STA SCREEN_RAM + $034C,X
        LDA f2CAF,X
        STA SCREEN_RAM + $039C,X
        DEX 
        BNE b2C02
        LDA #$01
        STA scoreScreenLoPtr
        LDA #$00
        STA camelCollision
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
        LDA lastKeyPressed
        CMP #$04
        BNE b2CE1
        JMP j2D00

b2CE1   CMP #$05
        BNE b2CE8
        JMP j2D18

b2CE8   CMP #$06
        BNE b2CEF
        JMP j2D4B

b2CEF   LDA joystickInput
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
        INC SCREEN_RAM + $0306
        LDA SCREEN_RAM + $0306
        CMP #$33
        BNE b2D0C
        LDA #$31
b2D0C   STA SCREEN_RAM + $0306
b2D0F   LDA lastKeyPressed
        CMP #$40
        BNE b2D0F
        JMP b2CEF

;-------------------------------------------------------------------------
; j2D18
;-------------------------------------------------------------------------
j2D18
        INC scoreScreenLoPtr
        LDA scoreScreenLoPtr
        CMP #$20
        BEQ b2D44
        NOP 
        NOP 
;-------------------------------------------------------------------------
; j2D22
;-------------------------------------------------------------------------
j2D22
        LDA #$30
        STA SCREEN_RAM + $031B
        STA SCREEN_RAM + $031C
        LDX scoreScreenLoPtr
b2D2C   INC SCREEN_RAM + $031C
        LDA SCREEN_RAM + $031C
        CMP #$3A
        BNE b2D3E
        LDA #$30
        STA SCREEN_RAM + $031C
        INC SCREEN_RAM + $031B
b2D3E   DEX 
        BNE b2D2C
        JMP b2D0F

b2D44   LDA #$01
        STA scoreScreenLoPtr
        JMP j2D22

;-------------------------------------------------------------------------
; j2D4B
;-------------------------------------------------------------------------
j2D4B
        LDA SCREEN_RAM + $0367
        CMP #$20
        BEQ b2D64
        LDA #CHAR_SPACE
        STA SCREEN_RAM + $0367
        LDA #$0E
        STA SCREEN_RAM + $0368
        LDA #$0F
        STA SCREEN_RAM + $0369
        JMP b2D0F

b2D64   LDA #<SCREEN_RAM + $0119
        STA SCREEN_RAM + $0367
        LDA #>SCREEN_RAM + $0119
        STA SCREEN_RAM + $0368
        LDA #$13
        STA SCREEN_RAM + $0369
        JMP b2D0F

;-------------------------------------------------------------------------
; j2D76
;-------------------------------------------------------------------------
j2D76
        LDA #$05
        STA player1Lives
        STA player2Lives
        JSR s2DA1
        JMP j2D87

        .BYTE $04,$A9,$00,$85,$6D
;-------------------------------------------------------------------------
; j2D87
;-------------------------------------------------------------------------
j2D87
        LDA scoreScreenLoPtr
        STA playerSector
        LDA #$00
        STA camelCollision
        LDA SCREEN_RAM + $0367
        CMP #$20
        BEQ b2D9A
        LDA #$FF
        STA camelCollision
b2D9A   JSR s2B3D
        JSR InitializeScreenPointerArray
        RTS 

;-------------------------------------------------------------------------
; s2DA1
;-------------------------------------------------------------------------
s2DA1
        LDA #6
        STA player2Lives
        LDA #2
        STA playerTUrn
        LDA SCREEN_RAM + $0306
        CMP #$31
        BEQ b2DB1
        RTS 

b2DB1   LDA #$01
        STA player2Lives
        RTS 

;-------------------------------------------------------------------------
; j2DB6
;-------------------------------------------------------------------------
j2DB6
        LDX #$10
b2DB8   LDA #$00
        STA SpriteXPos-1,X
        DEX 
        BNE b2DB8
        LDA #$00
        STA $D015    ;Sprite display Enable
        JMP j2D76

;-------------------------------------------------------------------------
; UpdateCollisionRegister
;-------------------------------------------------------------------------
UpdateCollisionRegister
        DEC CollisionDetectionRate
        BEQ b2DCD
        RTS 

b2DCD   LDA #$20
        STA CollisionDetectionRate
        LDA $D01E    ;Sprite to Sprite Collision Detect
        STA collisionDetectedBits
        RTS 

;-------------------------------------------------------------------------
; s2DD7
;-------------------------------------------------------------------------
s2DD7
        LDY #$01
b2DD9   LDA (colorForCurrentCharacter),Y
        CMP gameHiScore,Y
        BEQ b2DE4
        BPL b2DEA
        BNE b2DE9
b2DE4   INY 
        CPY #$08
        BNE b2DD9
b2DE9   RTS 

b2DEA   LDY #$01
b2DEC   LDA (colorForCurrentCharacter),Y
        STA gameHiScore,Y
        STA SCREEN_RAM + $0012,Y
        JMP j2E0D

        RTS 

;-------------------------------------------------------------------------
; j2DF8
;-------------------------------------------------------------------------
j2DF8
        LDA #>SCREEN_RAM + $004F
        STA tempVar
        LDA #<SCREEN_RAM + $004F
        STA colorForCurrentCharacter
        JSR s2DD7
        LDA #$70
        STA colorForCurrentCharacter
        JSR s2DD7
        JMP RestartGame

;-------------------------------------------------------------------------
; j2E0D
;-------------------------------------------------------------------------
j2E0D
        INY 
        CPY #$08
        BNE b2DEC
        RTS 

;-------------------------------------------------------------------------
; CheckSectorDefences
;-------------------------------------------------------------------------
CheckSectorDefences
        LDA SCREEN_RAM + $00C6
        CMP #$24
        BEQ b2E1B
        RTS 

b2E1B   LDA playerTUrn
        CMP #$02
        BEQ b2E28
        LDA #$01
        STA player1Lives
        JMP j2E2C

b2E28   LDA #$01
        STA player2Lives
;-------------------------------------------------------------------------
; j2E2C
;-------------------------------------------------------------------------
j2E2C
        LDX #$1A
b2E2E   LDA f2E5E,X
        STA SCREEN_RAM + $03C5,X
        LDA #$03
        STA COLOR_RAM + $03C5,X
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
        JMP PlayerSHipExplosion

;-------------------------------------------------------------------------
; j2E84
;-------------------------------------------------------------------------
j2E84
        LDA #$8A
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JMP ClearBottomRowFlagPlayerStats

;-------------------------------------------------------------------------
; HyperDriveResetShipY
;-------------------------------------------------------------------------
HyperDriveResetShipY
        LDA #$70
        STA shipYPosition
        JMP HyperDriveFinishing

;-------------------------------------------------------------------------
; s2E93
;-------------------------------------------------------------------------
s2E93
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$00
        STA collisionDetectedBits
b2E9A   RTS 

b2E9B   LDA lastKeyPressed
        CMP #$04
        BNE b2E9A
        LDA #$01
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
b2EA9   LDA lastKeyPressed
        CMP #$40
        BNE b2EA9
b2EAF   LDA lastKeyPressed
        CMP #$04
        BNE b2EAF
        LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
b2EBD   LDA lastKeyPressed
        CMP #$40
        BNE b2EBD
        RTS 

;-------------------------------------------------------------------------
; CheckPausePressed
;-------------------------------------------------------------------------
CheckPausePressed
        LDA a028D
        CMP #$02
        BEQ b2E9B
        RTS 

        .FILL 308, $EA
.include "sprites.asm"
