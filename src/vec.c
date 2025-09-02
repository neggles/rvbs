#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// hardcoded config for minimum effort purposes, set this yourself
#define CLOCK_MHZ     1600
#define CLOCK_HZ      (CLOCK_MHZ * 1000 * 1000)

// assume this many clocks for one iteration
#define ITER_CLOCKS   4

// func args, cbf to parse options today
#define PAGE_END      4096
#define LOAD_DISTANCE 0

extern void stlf_test_128(uint64_t iterations, char *arr);
void        (*stlfFunc)(uint64_t, char *) = stlf_test_128;

void run_stlf(uint64_t iterations, int mode, int page_end, int load_distance) {
    float           stlf_results[64][64] = {};
    uint64_t        time_diff_ms         = 0;
    double          latency_ms           = 0.0F;
    char           *arr                  = NULL;
    char           *alloc_arr            = NULL;
    struct timespec start_ts, end_ts = {};

    // defaults: grab a couple of cachelines
    int test_align = 64, test_alloc = 128, test_offs = 0;

    if (page_end != 0) {
        test_align = page_end;
        test_alloc = page_end * 2;
        test_offs  = page_end - 64;
    } else if (load_distance != 0) {
        test_align = 4096;
        // leaving room for 512-bit vector tests
        test_alloc = load_distance + 128;
    }

    alloc_arr = aligned_alloc(test_align, test_alloc);
    // apply offset for this worker
    arr       = alloc_arr + test_offs;

    fprintf(stderr, "Store offset,Load offset,ms\n");
    for (size_t s_offset = 0; s_offset < 64; s_offset++)
        for (size_t l_offset = 0; l_offset < 64; l_offset++) {
            ((uint32_t *)(arr))[0] = s_offset;
            ((uint32_t *)(arr))[1] = l_offset + load_distance;
            clock_gettime(CLOCK_MONOTONIC_RAW, &start_ts);
            stlfFunc(iterations, arr);
            clock_gettime(CLOCK_MONOTONIC_RAW, &end_ts);
            time_diff_ms = ((end_ts.tv_sec - start_ts.tv_sec) * 1000) +
                           ((end_ts.tv_nsec - start_ts.tv_nsec) / 1000000.0F);

            latency_ms                       = 1e6 * (float)time_diff_ms / (float)iterations;
            stlf_results[s_offset][l_offset] = latency_ms;
            fprintf(stderr, "%02ld,%02ld,%f\n", s_offset, l_offset, latency_ms);
        }

    // output as CSV
    for (int l_offset = 0; l_offset < 64; l_offset++) printf(",%d", l_offset);
    printf("\n");
    for (int s_offset = 0; s_offset < 64; s_offset++) {
        printf("%d", s_offset);
        for (int l_offset = 0; l_offset < 64; l_offset++) {
            printf(",%f", stlf_results[s_offset][l_offset]);
        }
        printf("\n");
    }

    free(alloc_arr);
}

int main() {
    const uint64_t n_iter = CLOCK_HZ / ITER_CLOCKS;

    run_stlf(n_iter, 0, PAGE_END, LOAD_DISTANCE);

    return 0;
}
