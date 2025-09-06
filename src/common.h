#pragma once

#include "riscv_csr.h"
#include <riscv_vector.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* rvv etype stuff */
#define GEN_ENUM(VAL)      VAL,
#define GEN_STRING(STRING) #STRING,

#define GEN_CASE(ENUM, FN) \
    case ENUM:             \
        return FN();

#define FOREACH_ETYPE(RVV_ETYPE) \
    RVV_ETYPE(RVV_E8MF8)         \
    RVV_ETYPE(RVV_E8MF4)         \
    RVV_ETYPE(RVV_E8MF2)         \
    RVV_ETYPE(RVV_E8M1)          \
    RVV_ETYPE(RVV_E8M2)          \
    RVV_ETYPE(RVV_E8M4)          \
    RVV_ETYPE(RVV_E8M8)          \
    RVV_ETYPE(RVV_E16MF4)        \
    RVV_ETYPE(RVV_E16MF2)        \
    RVV_ETYPE(RVV_E16M1)         \
    RVV_ETYPE(RVV_E16M2)         \
    RVV_ETYPE(RVV_E16M4)         \
    RVV_ETYPE(RVV_E16M8)         \
    RVV_ETYPE(RVV_E32MF2)        \
    RVV_ETYPE(RVV_E32M1)         \
    RVV_ETYPE(RVV_E32M2)         \
    RVV_ETYPE(RVV_E32M4)         \
    RVV_ETYPE(RVV_E32M8)         \
    RVV_ETYPE(RVV_E64M1)         \
    RVV_ETYPE(RVV_E64M2)         \
    RVV_ETYPE(RVV_E64M4)         \
    RVV_ETYPE(RVV_E64M8)         \
    RVV_ETYPE(RVV_ETYPE_MAX)

typedef enum { FOREACH_ETYPE(GEN_ENUM) } rvv_etype_t;

const char *rvv_etype_strs[] = {FOREACH_ETYPE(GEN_STRING)};

static inline size_t rvv_get_vlmax(rvv_etype_t etype) {
    switch (etype) {
        case RVV_E8MF8:
            return __riscv_vsetvlmax_e8mf8();
        case RVV_E8MF4:
            return __riscv_vsetvlmax_e8mf4();
        case RVV_E8MF2:
            return __riscv_vsetvlmax_e8mf2();
        case RVV_E8M1:
            return __riscv_vsetvlmax_e8m1();
        case RVV_E8M2:
            return __riscv_vsetvlmax_e8m2();
        case RVV_E8M4:
            return __riscv_vsetvlmax_e8m4();
        case RVV_E8M8:
            return __riscv_vsetvlmax_e8m8();
        case RVV_E16MF4:
            return __riscv_vsetvlmax_e16mf4();
        case RVV_E16MF2:
            return __riscv_vsetvlmax_e16mf2();
        case RVV_E16M1:
            return __riscv_vsetvlmax_e16m1();
        case RVV_E16M2:
            return __riscv_vsetvlmax_e16m2();
        case RVV_E16M4:
            return __riscv_vsetvlmax_e16m4();
        case RVV_E16M8:
            return __riscv_vsetvlmax_e16m8();
        case RVV_E32MF2:
            return __riscv_vsetvlmax_e32mf2();
        case RVV_E32M1:
            return __riscv_vsetvlmax_e32m1();
        case RVV_E32M2:
            return __riscv_vsetvlmax_e32m2();
        case RVV_E32M4:
            return __riscv_vsetvlmax_e32m4();
        case RVV_E32M8:
            return __riscv_vsetvlmax_e32m8();
        case RVV_E64M1:
            return __riscv_vsetvlmax_e64m1();
        case RVV_E64M2:
            return __riscv_vsetvlmax_e64m2();
        case RVV_E64M4:
            return __riscv_vsetvlmax_e64m4();
        case RVV_E64M8:
            return __riscv_vsetvlmax_e64m8();
        case RVV_ETYPE_MAX:
            return -1;
    }
    return -1;
}

static inline size_t rvv_get_vl(rvv_etype_t etype, size_t avl) {
    switch (etype) {
        case RVV_E8MF8:
            return __riscv_vsetvl_e8mf8(avl);
        case RVV_E8MF4:
            return __riscv_vsetvl_e8mf4(avl);
        case RVV_E8MF2:
            return __riscv_vsetvl_e8mf2(avl);
        case RVV_E8M1:
            return __riscv_vsetvl_e8m1(avl);
        case RVV_E8M2:
            return __riscv_vsetvl_e8m2(avl);
        case RVV_E8M4:
            return __riscv_vsetvl_e8m4(avl);
        case RVV_E8M8:
            return __riscv_vsetvl_e8m8(avl);
        case RVV_E16MF4:
            return __riscv_vsetvl_e16mf4(avl);
        case RVV_E16MF2:
            return __riscv_vsetvl_e16mf2(avl);
        case RVV_E16M1:
            return __riscv_vsetvl_e16m1(avl);
        case RVV_E16M2:
            return __riscv_vsetvl_e16m2(avl);
        case RVV_E16M4:
            return __riscv_vsetvl_e16m4(avl);
        case RVV_E16M8:
            return __riscv_vsetvl_e16m8(avl);
        case RVV_E32MF2:
            return __riscv_vsetvl_e32mf2(avl);
        case RVV_E32M1:
            return __riscv_vsetvl_e32m1(avl);
        case RVV_E32M2:
            return __riscv_vsetvl_e32m2(avl);
        case RVV_E32M4:
            return __riscv_vsetvl_e32m4(avl);
        case RVV_E32M8:
            return __riscv_vsetvl_e32m8(avl);
        case RVV_E64M1:
            return __riscv_vsetvl_e64m1(avl);
        case RVV_E64M2:
            return __riscv_vsetvl_e64m2(avl);
        case RVV_E64M4:
            return __riscv_vsetvl_e64m4(avl);
        case RVV_E64M8:
            return __riscv_vsetvl_e64m8(avl);
        case RVV_ETYPE_MAX:
            return -1;
    }
    return -1;
}

/* random generation stuff */
#define IMAX_BITS(m)   ((m) / ((m) % 255 + 1) / 255 % 255 * 8 + 7 - 86 / ((m) % 255 + 12))
#define RAND_MAX_WIDTH IMAX_BITS(RAND_MAX)
_Static_assert((RAND_MAX & (RAND_MAX + 1u)) == 0, "RAND_MAX not a Mersenne number");

uint64_t rand_u64(void) {
    uint64_t r = 0;
    for (size_t i = 0; i < 64; i += RAND_MAX_WIDTH) {
        r <<= RAND_MAX_WIDTH;
        r  ^= (unsigned)rand();
    }
    return r;
}

void gen_rand_1d(uint64_t *a, int n) {
    for (size_t i = 0; i < n; ++i) a[i] = rand_u64();
}

void init_zero_1d(uint64_t *a, int n) {
    for (size_t i = 0; i < n; ++i) a[i] = (uint64_t)0;
}

void print_array_1d(uint64_t *a, int n, const char *type, const char *name) {
    printf("%s %s[%d] = {", type, name, n);
    for (size_t i = 0; i < n; ++i) {
        printf(" 0x%016lx%s", a[i], i != n - 1 ? "," : " };");
        if (i % 10 == 9) puts("");
    }
    puts("");
}
