#include "global.h"

void gen_random_pokemon() {
    u16 tid;
    u32 len;

    do {
        tid = umod(rand(), NUM_TRAINERS);
        len = strnlen(trainers[tid].name, sizeof(trainers[tid].name));
    } while(len == 0 || trainers[tid].party_size == 0 || 7 < len);

    battle_type_flags = 8;
    b_trainer_build_party(party_trader, tid);

    u8 slot = umod(rand(), trainers[tid].party_size);

    if (slot != 0)
        memcpy(&party_trader[slot], &party_trader[0], sizeof(struct pokemon));

    pokemon_setattr(&party_trader[0], REQ_OTNAME, trainers[tid].name);

    u8 location = 0xFE;
    pokemon_setattr(&party_trader[0], REQ_METLOC, &location);
}

u32 strnlen(const char* str, u32 max) {
    u32 len = 0;
    while(*str != 0xFF && len < max) {
        ++len;
        ++str;
    }
    return len;
}