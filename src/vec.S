#define iter    a0
#define arr     a1
#define vl      a2
#define tgt     t1
#define src     t2
#define count   t3

.global stlf_test_128

# Calculate Application Vector Length (store_size / element_bits)
#define storesz 128
#define ebits   32
#define app_vl  (storesz / ebits)

stlf_test_128:
    li      vl, app_vl
    vsetvli vl, vl, e32, m1, ta, ma
    lw      tgt, (arr)
    lw      src, 4(arr)
    add     tgt, tgt, arr
    add     src, src, arr
    mv      count, x0
stlf_test_128_loop:
    vse32.v v0, 0(tgt)
    fld     f0, 0(src)
    vse32.v v0, 0(tgt)
    fld     f0, 0(src)
    vse32.v v0, 0(tgt)
    fld     f0, 0(src)
    vse32.v v0, 0(tgt)
    fld     f0, 0(src)
    vse32.v v0, 0(tgt)
    fld     f0, 0(src)
    addi    count, count, 5
    blt     count, iter, stlf_test_128_loop
    ret
