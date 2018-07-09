@@main:
    s_lock
    s_faceplayer
    s_msgbox @@pickone, 0x6
    s_special 0x9F
    s_waitstate
    s_copyvar 0x8005, 0x8004
    s_callasm (gen_random_pokemon |1)
    s_special 0xFE
    s_release
    s_end

@@pickone:
    .string "Select a Pokémon to trade."