#pragma once

#include <riscv_vector.h>

#include <stdio.h>

#define GEN_CSRR_FUNC_U32(X)                                     \
    static inline uint32_t csrr_##X() {                          \
        uint32_t __val = 0;                                      \
        asm volatile("csrr %0, " #X : "=r"(__val) : : "memory"); \
        return __val;                                            \
    }

#define GEN_CSR_PRINT_U32(X)             \
    static inline void csr_print_##X() { \
        uint32_t X = csrr_##X();         \
        printf(#X ": 0x%08x\n", X);      \
    }

#define GEN_CSR_FUNCS_U32(X) GEN_CSRR_FUNC_U32(X) GEN_CSR_PRINT_U32(X)

GEN_CSR_FUNCS_U32(vlenb)

GEN_CSR_FUNCS_U32(vstart)

GEN_CSR_FUNCS_U32(vxsat)

GEN_CSR_FUNCS_U32(vxrm)

GEN_CSR_FUNCS_U32(vl)

GEN_CSR_FUNCS_U32(vtype)
