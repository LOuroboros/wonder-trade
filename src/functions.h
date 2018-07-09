#pragma once
#include "types.h"

u8 b_trainer_build_party(struct pokemon* party, u16 tid);
u32 strnlen(u8*, u32);
u16 rand();
u32 umod(u32, u32);
void memcpy(void *dst, void *src, u32 size);
void pokemon_setattr(struct pokemon*, u8, void*);