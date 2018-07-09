#pragma once
#include "types.h"

#define PARTY_SIZE 6

struct pokemon {
    u8 _[100];
};

extern struct pokemon party_opponent[PARTY_SIZE];

// -----------------------------------------------------------------------------

#define NUM_TRAINERS 743

struct trainer {
    u8 custom_moveset_flag : 1;
    u8 held_item_flag : 1;
    u8 flags : 6;
    u8 tclass;
    u8 music : 7;
    u8 gender : 1;
    u8 sprite;
    u8 name[12];
    u8 data[8];
    u8 double_flag;
    u8 data2[7];
    u32 party_size;
    void* party_data;
};

extern struct trainer trainers[NUM_TRAINERS];