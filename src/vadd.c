#include "common.h"

void vec_add_1d(uint64_t *a, uint64_t *b, uint64_t *result, int n) {
    // set up vector stuff
    size_t vlen = __riscv_vsetvl_e64m1(n);
    if (vlen != n) {
        printf("VLEN != N and this is a very stupid function");
        return;
    }
    vuint64m1_t vec_s = __riscv_vmv_v_x_u64m1(0, vlen);
    vuint64m1_t vec_a = __riscv_vle64_v_u64m1(a, vlen);
    vuint64m1_t vec_b = __riscv_vle64_v_u64m1(b, vlen);

    vec_s = __riscv_vadd_vv_u64m1(vec_a, vec_b, vlen);

    __riscv_vse64(result, vec_s, vlen);
}

int main(int argc, char *argv[]) {
    const int    N           = 2;
    const size_t expect_vlen = 2;
    size_t       vlen        = 0;
    uint64_t     A[N], B[N], C[N];
    uint32_t     seed = 0xdeadbeef;

    // seed the random number generator
    srand(seed);

    csr_print_vlenb();

    printf("Configuring vlen register: ");
    vlen = __riscv_vsetvl_e64m1(N);
    if (vlen != expect_vlen) {
        printf("expected vlen=%ld but got %ld, giving up\n", expect_vlen, vlen);
        return EXIT_FAILURE;
    } else {
        printf("vlen=%ld\n", vlen);
    }

    printf("setting up vector op:\n");
    gen_rand_1d(A, N);
    gen_rand_1d(B, N);
    init_zero_1d(C, N);

    print_array_1d(A, N, "uint64_t", "A");
    print_array_1d(B, N, "uint64_t", "A");
    printf("\n");

    printf("executing vector add and printing result:\n");
    vec_add_1d(A, B, C, N);
    print_array_1d(C, N, "uint64_t", "C");

    printf("checking results:");
    int err_count = 0;
    for (size_t i = 0; i < N; i++) {
        if (A[i] + B[i] != C[i]) {
            err_count++;
            printf(" !%ld", i);
        } else {
            printf(" %ld", i);
        }
    }

    if (err_count) {
        printf("ERR: %d elements did not match!\n", err_count);
        for (size_t i = 0; i < N; i++) {
            printf("C[%ld] = 0x%016lx, A[%ld]+B[%ld] = 0x%016lx\n", i, C[i], i, i, (A[i] + B[i]));
        }
    } else {
        printf(" OK!\n");
    }


    return EXIT_SUCCESS;
}
