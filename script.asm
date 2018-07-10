@@main:
    s_lock
    s_faceplayer
    s_msgbox @@wanttostart, 0x5

    // if they don't want to WT, bail
    s_compare LASTRESULT, 0x1
    s_gotoif 0x0, @@earlyend

    s_msgbox @@choosepokemon, 0x6

    // opens party menu for selecting
    s_special 0x9F
    s_waitstate

    // if they pressed B to cancel, bail
    s_compare 0x8004, 0x6
    s_gotoif 0x4, @@earlyend

    // if the chosen Pokémon is an egg, bail
    s_special2 LASTRESULT, 0x147
    s_compare LASTRESULT, 0x19C
    s_gotoif 0x1, @@choseegg

    s_msgbox @@partnersearch, 0x6

    // load the Pokemon to be traded to the player
    s_callasm (gen_random_pokemon |1)
    // special 0xFE needs the player's Pokemon to be on 0x8005
    s_copyvar 0x8005, 0x8004
    // actually do the trade animation
    s_special 0xFE
    s_waitstate

@@earlyend:
    s_msgbox @@comebacksoon, 0x6
    s_release
    s_end

@@choseegg:
    s_msgbox @@noeggsallowed, 0x6
    s_goto @@earlyend

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