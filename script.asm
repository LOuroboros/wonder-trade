.include "pokescript.s"
.loadtable "character-encoding.tbl"

@@main:
    lock
    faceplayer
    checkflag 0x200
    gotoif 0x1, @@tothepoint
    msgbox @@introduction, 0x5
    compare LASTRESULT, 0x1
    callif 0x1, @@explaining
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

@@tothepoint:
    msgbox @@wanttostart, 0x5
    compare LASTRESULT, 0x1
    gotoif 0x0, @@earlyend
    msgbox @@choosepokemon, 0x6
    special 0x9F
    waitstate
    compare 0x8004, 0x6
    gotoif 0x4, @@earlyend
    special2 LASTRESULT, 0x147
    compare LASTRESULT, 0x19C
    gotoif 0x1, @@choseegg
    msgbox @@partnersearch, 0x6
    callasm (gen_random_pokemon |1)
    copyvar 0x8005, 0x8004
    special 0xFE
    waitstate

@@earlyend:
    msgbox @@comebacksoon, 0x6
    release
    end

@@choseegg:
    msgbox @@noeggsallowed, 0x6
    goto @@earlyend

@@explaining:
    msgbox @@explanation, 0x6
    setflag 0x200
    return

@@introduction:
    .string "Hello, [player]!\nI am the Wonder Bush!\lI can allow you to WONDER TRADE\lwith my wonderfully magic powers!\p... What? You don't know about the\nmagnificent process known\las WONDER TRADE? Oh dear...\pDo you want to read an explanation\nabout WONDER TRADE?"

@@explanation:
    .string "It is pretty simple.\nWONDER TRADE is a process where you\lcan offer any pokémon in order to\lreceive an entirely different one!\l... or the exact same one."

    @@wanttostart:
    .string "Would you like to start a\nWONDER TRADE?"

@@comebacksoon:
    .string "Please come back anytime."

@@choosepokemon:
    .string "Please select the POKéMON you\nwant to trade."

@@noeggsallowed:
    .string "I'm sorry, but EGGs cannot be\ntraded."

@@partnersearch:
    .string "Searching for a trade partner...\nPlease wait.\pA trade partner has been found!\nThe trade will now commence."