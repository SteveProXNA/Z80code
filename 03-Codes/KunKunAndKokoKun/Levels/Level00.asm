;----------------------------------------------------------------------

Level00_Data:
    .db     LEVEL_TYPE_GAME
    .dw     DataLevelsTilemap+(0*(2*32*24)) ; Tilemap
    .dw     Level00_LogicMap                ; Logic map
    .db     8, 160                          ; KunKun X/Y start
    .db     0, 200                          ; KokoKun X/Y
    .db     0/8+1, 200/8,                   ; KokoKun X/Y Tile Win Trigger
    .dw     Level00_Cannons
    .dw     Level00_Doors
    .dw     Level00_Switches
    .dw     Level00_HandlerReset
    .dw     Level00_HandlerUpdate
    .dw     Level01_Data
    
Level00_Cannons:
    .db     0   ; Count

Level00_Doors:
    .db     0   ; Count
    
Level00_Switches:
    .db     0   ; Count
    
Level00_LogicMap:
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $44,$01,$00,$01,$01,$01,$01,$01, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$44, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$44,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$044$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$44,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$44,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 

    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$44,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$44,$00,$00,$00,$00,$82,$01, $08,$01,$08,$01,$08,$01,$01,$01, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $44,$00,$00,$00,$00,$00,$82,$01, $01,$01,$01,$01,$01,$01,$01,$01, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$82,$01, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$82,$00, $00,$00,$00,$00,$00,$00,$00,$00, 

    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$01,$01,$01, $82,$01,$01,$01,$01,$01,$01,$01, $01,$01,$01,$01,$08,$01,$01,$01, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $82,$01,$01,$01,$01,$01,$01,$01, $01,$01,$01,$01,$01,$01,$01,$01, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $82,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $82,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $82,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$01, 
    .db     $01,$01,$84,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $82,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $00,$01,$00,$84,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $82,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, 
    .db     $01,$01,$01,$01,$01,$01,$01,$01, $01,$01,$01,$01,$01,$01,$01,$01, $01,$01,$01,$01,$01,$01,$01,$01, $01,$01,$01,$01,$01,$01,$01,$01, 

;----------------------------------------------------------------------

Level00_HandlerReset:

    ; Reset score
    ld hl, 0
    ld (VarScore), hl

    ret

Level00_HandlerUpdate:

    push af
    push hl
    
    ld a, (VarKunKunX)
    cp 255
    jr nz, ++

    ; Level: Easy
    ld a, (VarKunKunY)
    cp 176
    jr nz, +
    ld hl, Level01_Data
    jp MainLoadLevel
    +:

    ; Level: Normal
    cp 120
    jr nz, +
    ld hl, Level02_Data
    jp MainLoadLevel
    +:

    ; Level: Hard
    cp 64
    jr nz, +
    ld hl, Level03_Data
    jp MainLoadLevel
    +:

    ; Level: Hidden
    cp 8
    jr nz, +
    ld hl, LevelEnding_Data
    jp MainLoadLevel
    +:

    ++:
    
    pop hl
    pop af
    ret

;----------------------------------------------------------------------
