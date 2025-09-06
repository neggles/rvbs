#include "common.h"

#include <sched.h>
#include <time.h>

int main(int argc, char *argv[]) {
    csr_print_vlenb();

    printf("Probing VLMAX for each element type:\n");
    for (rvv_etype_t i = 0; i < RVV_ETYPE_MAX; i++) {
        size_t vlmax = rvv_get_vlmax(i);
        printf("%12s VLMAX = %ld\n", rvv_etype_strs[i], vlmax);
    }
    printf("\n");
    return EXIT_SUCCESS;
}
