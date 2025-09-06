#include "common.h"
#include "riscv_csr.h"
#include <sys/time.h>

#include <stdint.h>
#include <stdio.h>
#include <time.h>

// RISC-V CSR macros
#define CSR_TIME   0xC01
#define CSR_UCYCLE 0xC00

// Select which CSR to read time from
#define TIME_CSR   CSR_TIME

extern uint64_t clktest(uint64_t iterations, void *data);
extern uint64_t noptest(uint64_t iterations, void *data);
extern uint64_t addtest(uint64_t iterations, void *data);
extern uint64_t multest(uint64_t iterations, void *data);
extern uint64_t mixedaddnoptest(uint64_t iterations, void *data);
extern uint64_t faddtest(uint64_t iterations, void *data);
extern uint64_t fmultest(uint64_t iterations, void *data);
extern uint64_t mixedaddfaddtest(uint64_t iterations, void *data);
extern uint64_t vaddtest(uint64_t iterations, void *data);
extern uint64_t vmultest(uint64_t iterations, void *data);
extern uint64_t mixedmulvmultest(uint64_t iterations, void *data);
extern uint64_t mixedfmulvmultest(uint64_t iterations, void *data);
extern uint64_t hpvfaddtest(uint64_t iterations, void *data);
extern uint64_t spvfaddtest(uint64_t iterations, void *data);
extern uint64_t dpvfaddtest(uint64_t iterations, void *data);
extern uint64_t hpvfmultest(uint64_t iterations, void *data);
extern uint64_t spvfmultest(uint64_t iterations, void *data);
extern uint64_t dpvfmultest(uint64_t iterations, void *data);
extern uint64_t hpvfmaddtest(uint64_t iterations, void *data);
extern uint64_t hpvfmacctest(uint64_t iterations, void *data);
extern uint64_t spvfmaddtest(uint64_t iterations, void *data);
extern uint64_t spvfmacctest(uint64_t iterations, void *data);
extern uint64_t vfmaddtest(uint64_t iterations, void *data);
extern uint64_t vfmacctest(uint64_t iterations, void *data);
extern uint64_t loadtest(uint64_t iterations, void *data);
extern uint64_t storetest(uint64_t iterations, void *data);
extern uint64_t mixloadstoretest(uint64_t iterations, void *data);
extern uint64_t vectorloadtest128m1(uint64_t iterations, void *data);
extern uint64_t vectorloadtest256mf2(uint64_t iterations, void *data);
extern uint64_t vectorloadtest256m1(uint64_t iterations, void *data);
extern uint64_t vectorloadtest256m2(uint64_t iterations, void *data);
extern uint64_t vectorloadtest256m4(uint64_t iterations, void *data);
extern uint64_t vectorloadtest256m8(uint64_t iterations, void *data);
extern uint64_t mixvectorloadstoretest128m1(uint64_t iterations, void *data);
extern uint64_t mixvectorloadstoretest256m1(uint64_t iterations, void *data);

float    *fpTestArr = NULL;
uint32_t *sinkArr = NULL, *intTestArr = NULL;

float measureFunction(
    uint64_t iterations, float clockSpeedGhz, void *data, uint64_t (*testfunc)(uint64_t, void *)
);

int main(int argc, char *argv[]) {
    const uint64_t iterations     = 1500000000;
    const uint64_t iterationsHigh = iterations * 5;

    uint64_t time_diff_ms;
    double   latency;
    float    opsPerNs, clockSpeedGhz;

    struct timespec start_ts, end_ts = {};

    // just allocate a page each whatever
    fpTestArr  = (float *)aligned_alloc(4096, 4096);
    intTestArr = (uint32_t *)aligned_alloc(4096, 4096);
    sinkArr    = (uint32_t *)aligned_alloc(4096, 4096);


    // fill the u64 and float arrays
    for (size_t i = 0; i < 128; i++) {
        fpTestArr[i]  = i * 3.14;
        intTestArr[i] = (uint64_t)i;
        sinkArr[i]    = (uint64_t)(i + 1);
    }


    // figure out clock speed
    clock_gettime(CLOCK_MONOTONIC_RAW, &start_ts);
    clktest(iterations, NULL);
    clock_gettime(CLOCK_MONOTONIC_RAW, &end_ts);
    time_diff_ms =
        ((end_ts.tv_sec - start_ts.tv_sec) * 1000) + ((end_ts.tv_nsec - start_ts.tv_nsec) / 1000000.0F);
    latency       = 1e6 * (double)time_diff_ms / (double)iterations;
    // clk speed should be 1/latency, assuming we got one add per clk, roughly
    clockSpeedGhz = (float)(1 / latency);

    uint32_t vl = csrr_vl();

    csr_print_vstart();

    csr_print_vxsat();

    csr_print_vxrm();

    csr_print_vl();
    asm volatile("vsetvli a3, a0, e32, m8");
    vl = csrr_vl();
    printf("New Vl value: 0x%08x\n", vl);

    csr_print_vtype();

    printf("Estimated clock speed: %.2f GHz\n", clockSpeedGhz);

    /*
    printf("Nops per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, noptest));
    printf("Adds per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, addtest));
    printf("Muls per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, multest));
    printf(
        "Mixed adds and nops per clk: %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, NULL, mixedaddnoptest)
    );
    printf("Fadds per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, faddtest));
    printf("Fmuls per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, fmultest));
    printf(
        "Mixed adds and fadds per clk: %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, NULL, mixedaddfaddtest)
    );
    printf("DP Vector adds per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, vaddtest));
    printf("DP Vector muls per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, vmultest));
    printf(
        "Mixed DP Vector muls and int muls per clk: %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, NULL, mixedmulvmultest)
    );
    printf(
        "Mixed DP Vector muls and fmuls per clk: %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, NULL, mixedfmulvmultest)
    );
    printf(
        "HP Vector FADD per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, hpvfaddtest)
    );
    printf(
        "SP Vector FADD per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, spvfaddtest)
    );
    printf(
        "DP Vector FADD per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, dpvfaddtest)
    );
    printf(
        "HP Vector FMUL per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, hpvfmultest)
    );
    printf(
        "SP Vector FMUL per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, spvfmultest)
    );
    printf(
        "DP Vector FMUL per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, dpvfmultest)
    );
    printf(
        "HP Vector FMADD per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, hpvfmaddtest)
    );
    printf(
        "HP Vector FMACC per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, hpvfmacctest)
    );
    printf(
        "SP Vector FMADD per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, spvfmaddtest)
    );
    printf(
        "SP Vector FMACC per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, spvfmacctest)
    );
    printf(
        "DP Vector FMADD per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, vfmaddtest)
    );
    printf(
        "DP Vector FMACC per clk: %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, NULL, vfmacctest)
    );
    printf(
        "64-bit loads per clk %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, loadtest)
    );
    printf(
        "64-bit stores per clk %.2f\n", measureFunction(iterationsHigh, clockSpeedGhz, sinkArr, storetest)
    );
    printf(
        "Mixed 64-bit loads and stores per clk %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, mixloadstoretest)
    );
    */
    printf(
        "[vlen=2, e64, lmul=1] 128-bit loads per clk %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, vectorloadtest128m1)
    );

    /* // seems most chips don't actually have frac lmul
    printf(
        "[vlen=4, e64, lmul=0.5] 128-bit loads per clk %.2f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, vectorloadtest256mf2)
    );
    */

    printf(
        "[vlen=4, e64, lmul=1] 256-bit loads per clk %.3f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, vectorloadtest256m1)
    );
    printf(
        "[vlen=4, e64, lmul=2] 512-bit loads per clk %.3f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, vectorloadtest256m2)
    );
    printf(
        "[vlen=4, e64, lmul=4] 1024-bit loads per clk %.3f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, vectorloadtest256m4)
    );
    printf(
        "[vlen=4, e64, lmul=8] 2048-bit loads per clk %.3f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, vectorloadtest256m8)
    );

    printf(
        "[vlen=4, e64, lmul=1] alternating 256-bit loads and stores per clk %.3f\n",
        measureFunction(iterationsHigh, clockSpeedGhz, intTestArr, mixvectorloadstoretest128m1)
    );
    return 0;
}

float measureFunction(
    uint64_t iterations, float clockSpeedGhz, void *arr, uint64_t (*testfunc)(uint64_t, void *)
) {
    struct timespec start_ts, end_ts = {};
    uint64_t        time_diff_ms;
    double          latency;
    float           opsPerNs;

    clock_gettime(CLOCK_MONOTONIC_RAW, &start_ts);
    testfunc(iterations, arr);
    clock_gettime(CLOCK_MONOTONIC_RAW, &end_ts);
    time_diff_ms =
        ((end_ts.tv_sec - start_ts.tv_sec) * 1000) + ((end_ts.tv_nsec - start_ts.tv_nsec) / 1000000.0F);
    latency  = 1e6 * (double)time_diff_ms / (double)iterations;
    opsPerNs = (float)(1 / latency);
    // printf("%f adds/ns, %f adds/clk?\n", opsPerNs, opsPerNs / clockSpeedGhz);
    return (float)(opsPerNs / clockSpeedGhz);
}
