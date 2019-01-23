.include "pokescript.s"
.loadtable "character-encoding.tbl"

@@main:
    lock
    faceplayer
    msgbox @@wanttostart, 0x5

    // if they don't want to WT, bail
    compare LASTRESULT, 0x1
    gotoif 0x0, @@earlyend

    msgbox @@choosepokemon, 0x6

    // opens party menu for selecting
    special 0x9F
    waitstate

    // if they pressed B to cancel, bail
    compare 0x8004, 0x6
    gotoif 0x4, @@earlyend

    // if the chosen Pokémon is an egg, bail
    special2 LASTRESULT, 0x147
    compare LASTRESULT, 0x19C
    gotoif 0x1, @@choseegg

    msgbox @@partnersearch, 0x6

    // load the Pokemon to be traded to the player
    callasm (gen_random_pokemon |1)
    // special 0xFE needs the player's Pokemon to be on 0x8005
    copyvar 0x8005, 0x8004
    // actually do the trade animation
    special 0xFE
    waitstate

@@earlyend:
    msgbox @@comebacksoon, 0x6
    release
    end

@@choseegg:
    msgbox @@noeggsallowed, 0x6
    goto @@earlyend

@@wanttostart:
    .string "Would you like to start a\nWONDER TRADE?"

@@comebacksoon:
    .string "Please come back whenever you\nwant to make a WONDER TRADE."

@@choosepokemon:
    .string "Please choose the POKéMON you\nwish to trade."

@@noeggsallowed:
    .string "I'm sorry, but EGGs cannot be\ntraded."

@@partnersearch:
    .string "Searching for a trade partner...\nPlease wait.\pA trade partner has been found!\nThe trade will now start."