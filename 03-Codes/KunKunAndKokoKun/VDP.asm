
;----------------------------------------------------------------------
; VDP_Write(source=HL, size=BC)
; Write 'size' bytes from 'source' to VDP
; User is in charge of setting current VDP writing address.
;----------------------------------------------------------------------
; Parameters:
;   HL: src
;   BC: count
;----------------------------------------------------------------------
VDP_Copy:
    push af
        -:
        ld a, (hl)
        inc hl
        out ($BE), a
        dec bc
        ld a,c
        or b
        jr nz,-
    pop af
    ret

;==============================================================
; Set up VDP registers (default values)
;==============================================================
; Call DefaultInitialiseVDP to set up VDP to default values.
; Also defines NameTableAddress, SpriteTableAddress and SpriteSet
; which can be used elsewhere.
; To change the values used, copy and paste the modified data
; and code into the main source. Data is commented to help.
;==============================================================
VDP_Initialize:
    push hl
    push bc
        ld hl,_Data
        ld b,_End-_Data
        ld c,$bf
        otir
    pop bc
    pop hl
    ret

.define SpriteSet           0       ; 0 for sprites to use tiles 0-255, 1 for 256+
.define NameTableAddress    $3800   ; must be a multiple of $800; usually $3800; fills $700 bytes (unstretched)
.define SpriteTableAddress  $3f00   ; must be a multiple of $100; usually $3f00; fills $100 bytes

_Data:
    .db %00000100,$80
    ;    |||||||`- Disable synch
    ;    ||||||`-- Enable extra height modes
    ;    |||||`--- SMS mode instead of SG
    ;    ||||`---- Shift sprites left 8 pixels
    ;    |||`----- Enable line interrupts
    ;    ||`------ Blank leftmost column for scrolling
    ;    |`------- Fix top 2 rows during horizontal scrolling
    ;    `-------- Fix right 8 columns during vertical scrolling
    .db %10000100,$81
    ;     |||| |`- Zoomed sprites -> 16x16 pixels
    ;     |||| `-- Doubled sprites -> 2 tiles per sprite, 8x16
    ;     |||`---- 30 row/240 line mode
    ;     ||`----- 28 row/224 line mode
    ;     |`------ Enable VBlank interrupts
    ;     `------- Enable display
    .db (NameTableAddress>>10) |%11110001,$82
    .db %11111111, $83
    .db %11111111, $84
    .db (SpriteTableAddress>>7)|%10000001,$85
    .db (SpriteSet<<2)         |%11111011,$86
    .db $0|$f0,$87
    ;    `-------- Border palette colour (sprite palette)
    .db $00,$88
    ;    ``------- Horizontal scroll
    .db $00,$89
    ;    ``------- Vertical scroll
    .db $ff,$8a
    ;    ``------- Line interrupt spacing ($ff to disable)
_End:

;==============================================================
; Clear VRAM
;==============================================================
; Sets all of VRAM to zero
;==============================================================
VDP_ClearVRAM:
    push af
    push hl
        ld hl,$4000
        rst $08
        ; Output 16KB of zeroes
        ld hl, $4000
        ld a,$00
      -:
        out (IO_VDP_DATA), a 
        dec l
        jp nz,-
        dec h
        jp nz,-
        
    pop hl
    pop af
    ret


;==============================================================
; Load palette
;==============================================================
; Parameters:
; hl = location
; b  = number of values to write
; c  = palette index to start at (<32)
;==============================================================
LoadPalette:
	push af
	push bc
	push hl
	    ld a,c
	    out (IO_VDP_ADDR),a     ; Palette index
	    ld a,$c0
	    out (IO_VDP_ADDR),a     ; Palette write identifier
	    ld c,$be
	    otir                    ; Output b bytes starting at hl to port c
	pop hl
	pop bc
	pop af
    ret

;==============================================================
; Tile loader
;==============================================================
; Parameters:
; hl = tile number to start at
; ix = location of tile data
; bc = No. of tiles to load
; d  = bits per pixel
;==============================================================
LoadTiles:
    push af
    push bc
    push de
    push hl
    push ix
        ; Tell VDP where I want to write (hl<<5)
        sla l
        rl h
        sla l
        rl h
        sla l
        rl h
        sla l
        rl h
        sla l
        rl h
        ld a,l
        out ($bf),a
        ld a,h
        or $40
        out ($bf),a

        ; I need to output bc*8 bytes so I need to modify bc (<<3)
        sla c
        rl b
        sla c
        rl b
        sla c
        rl b

        ; Write data
        _Loop:
            ; Restore counter
            ld e,d

            _DataLoop:
                ; Write byte
                ld a,(ix+0)
                out ($be),a
                dec e
                inc ix
                jp nz,_DataLoop

            ; Restore counter
            ld e,d
            _BlankLoop:
                ; Write blank data to fill up the rest of the tile definition
                inc e
                ld a,e
                cp 5
                jp z,_NoMoreBlanks

                ld a,0
                out ($be),a
                jp _BlankLoop

            _NoMoreBlanks:

            dec bc
            ld a,b
            or c
            jp nz,_Loop

    pop ix
    pop hl
    pop de
    pop bc
    pop af
    ret

;----------------------------------------------------------------------
