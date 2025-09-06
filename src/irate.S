.text

#define vl      t0
#define avl     t1
#define n_ops   t2
#define iter    a0
#define arr1    a1
#define arr2    a2

.global noptest
.global addtest
.global multest
.global mixedaddnoptest
.global faddtest
.global fmultest
.global mixedaddfaddtest
.global vaddtest
.global vmultest
.global mixedmulvmultest
.global mixedfmulvmultest
.global hpvfaddtest
.global spvfaddtest
.global dpvfaddtest
.global hpvfmultest
.global spvfmultest
.global dpvfmultest
.global hpvfmaddtest
.global hpvfmacctest
.global spvfmaddtest
.global spvfmacctest
.global vfmaddtest
.global vfmacctest
.global loadtest
.global storetest
.global mixloadstoretest
.global vectorloadtest128m1
.global vectorloadtest256mf2
.global vectorloadtest256m1
.global vectorloadtest256m2
.global vectorloadtest256m4
.global vectorloadtest256m8
.global mixvectorloadstoretest128m1
.global mixvectorloadstoretest256m1

.global clktest

clktest:
	mv   x5, x0
	mv   x6, x0
	mv   t2, x0
	addi x5, x5, 1
	addi x6, x6, 2
	addi t2, t2, 20

clktest_loop:
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	add x5, x5, x6
	sub a0, a0, t2
	bgt a0, x0, clktest_loop
	ret

addtest:
	mv   x5, x0
	mv   x6, x0
	mv   t2, x0
	mv   x28, x0
	mv   x29, x0
	mv   x30, x0
	mv   x31, x0
	addi x5, x5, 1
	addi x6, x6, 2
	addi t2, t2, 20

addtest_loop:
	add x5, x5, x6
	add x28, x28, x6
	add x29, x29, x6
	add x30, x30, x6
	add x31, x31, x6
	add x5, x5, x6
	add x28, x28, x6
	add x29, x29, x6
	add x30, x30, x6
	add x31, x31, x6
	add x5, x5, x6
	add x28, x28, x6
	add x29, x29, x6
	add x30, x30, x6
	add x31, x31, x6
	add x5, x5, x6
	add x28, x28, x6
	add x29, x29, x6
	add x30, x30, x6
	add x31, x31, x6
	sub a0, a0, t2
	bgt a0, x0, addtest_loop
	ret

multest:
	mv   x5, x0
	mv   x6, x0
	mv   t2, x0
	mv   x28, x0
	mv   x29, x0
	mv   x30, x0
	mv   x31, x0
	addi x5, x5, 1
	addi x6, x6, 2
	addi t2, t2, 20

multest_loop:
	mul x5, x5, x6
	mul x28, x28, x6
	mul x29, x29, x6
	mul x30, x30, x6
	mul x31, x31, x6
	mul x5, x5, x6
	mul x28, x28, x6
	mul x29, x29, x6
	mul x30, x30, x6
	mul x31, x31, x6
	mul x5, x5, x6
	mul x28, x28, x6
	mul x29, x29, x6
	mul x30, x30, x6
	mul x31, x31, x6
	mul x5, x5, x6
	mul x28, x28, x6
	mul x29, x29, x6
	mul x30, x30, x6
	mul x31, x31, x6
	sub a0, a0, t2
	bgt a0, x0, multest_loop
	ret

noptest:
	mv   x5, x0
	mv   x6, x0
	mv   t2, x0
	mv   x28, x0
	mv   x29, x0
	mv   x30, x0
	mv   x31, x0
	addi x5, x5, 1
	addi x6, x6, 2
	addi t2, t2, 20

noptest_loop:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	sub a0, a0, t2
	bgt a0, x0, noptest_loop
	ret

mixedaddnoptest:
	mv   x5, x0
	mv   x6, x0
	mv   t2, x0
	mv   x28, x0
	mv   x29, x0
	mv   x30, x0
	mv   x31, x0
	addi x5, x5, 1
	addi x6, x6, 2
	addi t2, t2, 20

mixedaddnoptest_loop:
	add x5, x5, x6
	nop
	add x28, x28, x6
	nop
	add x29, x29, x6
	nop
	add x30, x30, x6
	nop
	add x31, x31, x6
	nop
	add x5, x5, x6
	nop
	add x28, x28, x6
	nop
	add x29, x29, x6
	nop
	add x30, x30, x6
	nop
	add x31, x31, x6
	nop
	sub a0, a0, t2
	bgt a0, x0, mixedaddnoptest_loop
	ret

faddtest:
	fmv.d.x f1, x0
	fmv.d.x f2, x0
	fmv.d.x f3, x0
	fmv.d.x f4, x0
	fmv.d.x f5, x0
	fmv.d.x f6, x0
	addi    x5, x5, 1
	fmv.d.x f5, x5
	addi    x6, x6, 2
	fmv.d.x f6, x6
	mv      t2, x0
	addi    t2, t2, 20

faddtest_loop:
	fadd.d f5, f5, f6
	fadd.d f1, f1, f6
	fadd.d f2, f2, f6
	fadd.d f3, f3, f6
	fadd.d f4, f4, f6
	fadd.d f5, f5, f6
	fadd.d f1, f1, f6
	fadd.d f2, f2, f6
	fadd.d f3, f3, f6
	fadd.d f4, f4, f6
	fadd.d f5, f5, f6
	fadd.d f1, f1, f6
	fadd.d f2, f2, f6
	fadd.d f3, f3, f6
	fadd.d f4, f4, f6
	fadd.d f5, f5, f6
	fadd.d f1, f1, f6
	fadd.d f2, f2, f6
	fadd.d f3, f3, f6
	fadd.d f4, f4, f6
	sub    a0, a0, t2
	bgt    a0, x0, faddtest_loop
	ret

fmultest:
	fmv.d.x f1, x0
	fmv.d.x f2, x0
	fmv.d.x f3, x0
	fmv.d.x f4, x0
	fmv.d.x f5, x0
	fmv.d.x f6, x0
	addi    x5, x5, 1
	fmv.d.x f5, x5
	addi    x6, x6, 2
	fmv.d.x f6, x6
	mv      t2, x0
	addi    t2, t2, 20

fmultest_loop:
	fmul.d f5, f5, f6
	fmul.d f1, f1, f6
	fmul.d f2, f2, f6
	fmul.d f3, f3, f6
	fmul.d f4, f4, f6
	fmul.d f5, f5, f6
	fmul.d f1, f1, f6
	fmul.d f2, f2, f6
	fmul.d f3, f3, f6
	fmul.d f4, f4, f6
	fmul.d f5, f5, f6
	fmul.d f1, f1, f6
	fmul.d f2, f2, f6
	fmul.d f3, f3, f6
	fmul.d f4, f4, f6
	fmul.d f5, f5, f6
	fmul.d f1, f1, f6
	fmul.d f2, f2, f6
	fmul.d f3, f3, f6
	fmul.d f4, f4, f6
	sub    a0, a0, t2
	bgt    a0, x0, fmultest_loop
	ret

mixedaddfaddtest:
	mv      x5, x0
	mv      x6, x0
	mv      t2, x0
	mv      x28, x0
	mv      x29, x0
	mv      x30, x0
	mv      x31, x0
	fmv.d.x f1, x0
	fmv.d.x f2, x0
	fmv.d.x f3, x0
	fmv.d.x f4, x0
	fmv.d.x f5, x0
	fmv.d.x f6, x0
	addi    x5, x5, 1
	fmv.d.x f5, x5
	addi    x6, x6, 2
	fmv.d.x f6, x6
	mv      t2, x0
	addi    t2, t2, 20

mixedaddfaddtest_loop:
	fadd.d f5, f5, f6
	add    x5, x5, x6
	fadd.d f1, f1, f6
	add    x28, x28, x6
	fadd.d f2, f2, f6
	add    x29, x29, x6
	fadd.d f3, f3, f6
	add    x30, x30, x6
	fadd.d f4, f4, f6
	add    x31, x31, x6
	fadd.d f5, f5, f6
	add    x5, x5, x6
	fadd.d f1, f1, f6
	add    x28, x28, x6
	fadd.d f2, f2, f6
	add    x29, x29, x6
	fadd.d f3, f3, f6
	add    x30, x30, x6
	fadd.d f4, f4, f6
	add    x31, x31, x6
	sub    a0, a0, t2
	bgt    a0, x0, mixedaddfaddtest_loop
	ret

vaddtest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

vaddtest_loop:
	vadd.vv v5, v5, v6
	vadd.vv v1, v1, v6
	vadd.vv v2, v2, v6
	vadd.vv v3, v3, v6
	vadd.vv v4, v4, v6
	vadd.vv v5, v5, v6
	vadd.vv v1, v1, v6
	vadd.vv v2, v2, v6
	vadd.vv v3, v3, v6
	vadd.vv v4, v4, v6
	vadd.vv v5, v5, v6
	vadd.vv v1, v1, v6
	vadd.vv v2, v2, v6
	vadd.vv v3, v3, v6
	vadd.vv v4, v4, v6
	vadd.vv v5, v5, v6
	vadd.vv v1, v1, v6
	vadd.vv v2, v2, v6
	vadd.vv v3, v3, v6
	vadd.vv v4, v4, v6
	sub     a0, a0, t2
	bgt     a0, x0, vaddtest_loop
	ret

vmultest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

vmultest_loop:
	vmul.vv v5, v5, v6
	vmul.vv v1, v1, v6
	vmul.vv v2, v2, v6
	vmul.vv v3, v3, v6
	vmul.vv v4, v4, v6
	vmul.vv v5, v5, v6
	vmul.vv v1, v1, v6
	vmul.vv v2, v2, v6
	vmul.vv v3, v3, v6
	vmul.vv v4, v4, v6
	vmul.vv v5, v5, v6
	vmul.vv v1, v1, v6
	vmul.vv v2, v2, v6
	vmul.vv v3, v3, v6
	vmul.vv v4, v4, v6
	vmul.vv v5, v5, v6
	vmul.vv v1, v1, v6
	vmul.vv v2, v2, v6
	vmul.vv v3, v3, v6
	vmul.vv v4, v4, v6
	sub     a0, a0, t2
	bgt     a0, x0, vmultest_loop
	ret

mixedmulvmultest:
	vsetvli  t0, a0, e64, m1, ta, ma
	mv       x28, x0
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	mv       x29, x0
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	mv       x30, x0
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	mv       x31, x0
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	mv       x5, x0
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	mv       x6, x0
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

mixedmulvmultest_loop:
	vmul.vv v5, v5, v6
	mul     x5, x5, x6
	vmul.vv v1, v1, v6
	mul     x28, x28, x6
	vmul.vv v2, v2, v6
	mul     x29, x29, x6
	vmul.vv v3, v3, v6
	mul     x30, x30, x6
	vmul.vv v4, v4, v6
	mul     x31, x31, x6
	vmul.vv v5, v5, v6
	mul     x5, x5, x6
	vmul.vv v1, v1, v6
	mul     x28, x28, x6
	vmul.vv v2, v2, v6
	mul     x29, x29, x6
	vmul.vv v3, v3, v6
	mul     x30, x30, x6
	vmul.vv v4, v4, v6
	mul     x31, x31, x6
	sub     a0, a0, t2
	bgt     a0, x0, mixedmulvmultest_loop
	ret

mixedfmulvmultest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

mixedfmulvmultest_loop:
	vmul.vv v5, v5, v6
	fmul.d  f5, f5, f6
	vmul.vv v1, v1, v6
	fmul.d  f1, f1, f6
	vmul.vv v2, v2, v6
	fmul.d  f2, f2, f6
	vmul.vv v3, v3, v6
	fmul.d  f3, f3, f6
	vmul.vv v4, v4, v6
	fmul.d  f4, f4, f6
	vmul.vv v5, v5, v6
	fmul.d  f5, f5, f6
	vmul.vv v1, v1, v6
	fmul.d  f1, f1, f6
	vmul.vv v2, v2, v6
	fmul.d  f2, f2, f6
	vmul.vv v3, v3, v6
	fmul.d  f3, f3, f6
	vmul.vv v4, v4, v6
	fmul.d  f4, f4, f6
	sub     a0, a0, t2
	bgt     a0, x0, mixedfmulvmultest_loop
	ret

hpvfaddtest:
	vsetvli  t0, a0, e16, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

hpvfaddtest_loop:
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	sub      a0, a0, t2
	bgt      a0, x0, hpvfaddtest_loop
	ret

spvfaddtest:
	vsetvli  t0, a0, e32, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

spvfaddtest_loop:
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	sub      a0, a0, t2
	bgt      a0, x0, spvfaddtest_loop
	ret

dpvfaddtest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

dpvfaddtest_loop:
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	vfadd.vv v5, v5, v6
	vfadd.vv v1, v1, v6
	vfadd.vv v2, v2, v6
	vfadd.vv v3, v3, v6
	vfadd.vv v4, v4, v6
	sub      a0, a0, t2
	bgt      a0, x0, dpvfaddtest_loop
	ret

hpvfmultest:
	vsetvli  t0, a0, e16, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

hpvfmultest_loop:
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	sub      a0, a0, t2
	bgt      a0, x0, hpvfmultest_loop
	ret

spvfmultest:
	vsetvli  t0, a0, e32, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

spvfmultest_loop:
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	sub      a0, a0, t2
	bgt      a0, x0, spvfmultest_loop
	ret

dpvfmultest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

dpvfmultest_loop:
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	vfmul.vv v5, v5, v6
	vfmul.vv v1, v1, v6
	vfmul.vv v2, v2, v6
	vfmul.vv v3, v3, v6
	vfmul.vv v4, v4, v6
	sub      a0, a0, t2
	bgt      a0, x0, dpvfmultest_loop
	ret

hpvfmaddtest:
	vsetvli  t0, a0, e16, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

hpvfmaddtest_loop:
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	sub       a0, a0, t2
	bgt       a0, x0, hpvfmaddtest_loop
	ret

hpvfmacctest:
	vsetvli  t0, a0, e16, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

hpvfmacctest_loop:
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	sub       a0, a0, t2
	bgt       a0, x0, hpvfmacctest_loop
	ret

spvfmaddtest:
	vsetvli  t0, a0, e32, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

spvfmaddtest_loop:
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	sub       a0, a0, t2
	bgt       a0, x0, spvfmaddtest_loop
	ret

spvfmacctest:
	vsetvli  t0, a0, e32, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

spvfmacctest_loop:
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	sub       a0, a0, t2
	bgt       a0, x0, spvfmacctest_loop
	ret

vfmaddtest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

vfmaddtest_loop:
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	vfmadd.vv v5, v5, v6
	vfmadd.vv v1, v1, v6
	vfmadd.vv v2, v2, v6
	vfmadd.vv v3, v3, v6
	vfmadd.vv v4, v4, v6
	sub       a0, a0, t2
	bgt       a0, x0, vfmaddtest_loop
	ret

vfmacctest:
	vsetvli  t0, a0, e64, m1, ta, ma
	fmv.d.x  f1, x0
	vfmv.v.f v1, f1
	fmv.d.x  f2, x0
	vfmv.v.f v2, f2
	fmv.d.x  f3, x0
	vfmv.v.f v3, f3
	fmv.d.x  f4, x0
	vfmv.v.f v4, f4
	fmv.d.x  f5, x0
	vfmv.v.f v5, f5
	fmv.d.x  f6, x0
	vfmv.v.f v6, f6
	addi     x5, x5, 1
	fmv.d.x  f5, x5
	vfmv.v.f v5, f5
	addi     x6, x6, 2
	fmv.d.x  f6, x6
	vfmv.v.f v6, f6
	mv       t2, x0
	addi     t2, t2, 20

vfmacctest_loop:
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	vfmacc.vv v5, v5, v6
	vfmacc.vv v1, v1, v6
	vfmacc.vv v2, v2, v6
	vfmacc.vv v3, v3, v6
	vfmacc.vv v4, v4, v6
	sub       a0, a0, t2
	bgt       a0, x0, vfmacctest_loop
	ret

// a1 = load arr
loadtest:
	mv   t2, x0
	addi t2, t2, 10

loadtest_loop:
	ld  x5, (a1)
	ld  x6, 8(a1)
	ld  x5, (a1)
	ld  x6, 8(a1)
	ld  x5, (a1)
	ld  x6, 8(a1)
	ld  x5, (a1)
	ld  x6, 8(a1)
	ld  x5, (a1)
	ld  x6, 8(a1)
	sub a0, a0, t2
	bgt a0, x0, loadtest_loop
	ret

// a1 = sink arr
storetest:
	mv   t2, x0
	mv   x5, x0
	mv   x6, x0
	addi t2, t2, 10

storetest_loop:
	sd  x5, (a1)
	sd  x6, 8(a1)
	sd  x5, (a1)
	sd  x6, 8(a1)
	sd  x5, (a1)
	sd  x6, 8(a1)
	sd  x5, (a1)
	sd  x6, 8(a1)
	sd  x5, (a1)
	sd  x6, 8(a1)
	sub a0, a0, t2
	bgt a0, x0, storetest_loop
	ret

// a1 = big arr
mixloadstoretest:
	mv   t2, x0
	mv   x5, x0
	mv   x6, x0
	mv   x28, x0
	addi t2, t2, 10
	add  x28, x28, t2

mixloadstoretest_loop:
	ld  x5, (a1)
	sd  x28, 128(a1)
	ld  x5, (a1)
	sd  x28, 128(a1)
	ld  x5, (a1)
	sd  x28, 128(a1)
	ld  x5, (a1)
	sd  x28, 128(a1)
	ld  x5, (a1)
	sd  x28, 128(a1)
	sub a0, a0, t2
	bgt a0, x0, mixloadstoretest_loop
	ret

vectorloadtest128m1:
	li      avl, 2
	vsetvli vl, avl, e64, m1, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, t2

vectorloadtest128m1_loop:
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, vectorloadtest128m1_loop
	ret

vectorloadtest256mf2:
	li      avl, 32
	vsetvli vl, avl, e64, mf2, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

vectorloadtest256mf2_loop:
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	vle64.v v0, (arr1)
	vle64.v v1, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, vectorloadtest256mf2_loop
	ret

vectorloadtest256m1:
	li      avl, 32
	vsetvli vl, avl, e64, m1, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

vectorloadtest256m1_loop:
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, vectorloadtest256m1_loop
	ret

vectorloadtest256m2:
	li      avl, 32
	vsetvli vl, avl, e64, m2, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

vectorloadtest256m2_loop:
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, vectorloadtest256m2_loop
	ret

vectorloadtest256m4:
	li      avl, 32
	vsetvli vl, avl, e64, m4, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

vectorloadtest256m4_loop:
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, vectorloadtest256m4_loop
	ret

vectorloadtest256m8:
	li      avl, 32
	vsetvli vl, avl, e64, m8, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

vectorloadtest256m8_loop:
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	vle64.v v0, (arr1)
	vle64.v v16, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, vectorloadtest256m8_loop
	ret

mixvectorloadstoretest128m1:
	li      avl, 2
	vsetvli vl, avl, e64, m1, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

mixvectorloadstoretest128m1_loop:
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, mixvectorloadstoretest128m1_loop
	ret

mixvectorloadstoretest256m1:
	li      avl, 4
	vsetvli vl, avl, e64, m1, ta, ma
	addi    arr2, arr1, 128
	li      n_ops, 10
	add     t3, t3, n_ops

mixvectorloadstoretest256m1_loop:
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	vle64.v v0, (arr1)
	vse64.v v15, (arr2)
	sub     iter, iter, n_ops
	bgt     iter, zero, mixvectorloadstoretest256m1_loop
	ret
