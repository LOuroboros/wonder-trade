.gba
.thumb

.open "test.gba", 0x08000000

.org free_space
.importobj "build/src/relocatable.o"

.loadtable "character-encoding.tbl"
.include "pokescript.s"

wonder_trade_script:
.area reservation
    .include "script.asm"
.endarea

// // Player house PC script tile (for debugging)
// .org 0x083B977C
// .word wonder_trade_script

.close

.include "functions.s"

.arm
.include "constants.s"