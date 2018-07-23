.gba
.thumb

.open "test.gba", 0x08000000

.loadtable "character-encoding.tbl"
.include "pokescript.s"

.org allocation

.area allocation_size
    .importobj "build/src/relocatable.o"

    wonder_trade_script:
    .include "script.asm"
.endarea

// // Player house PC script tile (for debugging)
// .org 0x083B977C
// .word wonder_trade_script

.close

.include "functions.s"

.arm
.include "constants.s"
