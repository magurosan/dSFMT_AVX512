# @file  Makefile
# @brief Makefile
#
# @author Mutsuo Saito (Hiroshima University)
# @author Makoto Matsumoto (Hiroshima University)
# @author Masaki Ota
#
# Copyright (C) 2007, 2008, 2013 Mutsuo Saito, Makoto Matsumoto and
# Hiroshima University. All rights reserved.
# Copyright (C) 2018 Masaki Ota. Rights reserved.
#
# The new BSD License is applied to this software.
# see LICENSE.txt
#
# @note
# We could comple test-sse2-Mxxx using gcc 3.4.4 of cygwin.
# We could comple test-sse2-Mxxx using gcc 4.0.1 of Linux.
# We coundn't comple test-sse2-Mxxx using gcc 3.3.2 of Linux.
# We could comple test-alti-Mxxx using gcc 3.3 of osx.
# We could comple test-alti-Mxxx using gcc 4.0 of osx.
# We could comiple test-neon-Mxxx using gcc 5.0 of Linux/aarch64.

WARN = -Wmissing-prototypes -Wall -Winline -Wstrict-aliasing
#WARN = -Wmissing-prototypes -Wall -W
#WARN = /Wall
#OPTI = -O3 -finline-functions -fomit-frame-pointer -DNDEBUG \
#-fno-strict-aliasing --param max-inline-insns-single=1800
#--param inline-unit-growth=500 --param large-function-growth=900 #for gcc 4
#OPTI = /Ot /Ob2 /Oy /Ox /Oi /GL /G6
OPTI = -O3 -fno-strict-aliasing
#STD =
#STD = -std=c89 -pedantic
#STD = -std=c99 -pedantic
STD = -std=c99
CCFLAGS = $(OPTI) $(WARN) $(STD)
ALTIFLAGS = -mabi=altivec -maltivec -DHAVE_ALTIVEC
OSXALTIFLAGS = -faltivec -maltivec -DHAVE_ALTIVEC
SSE2FLAGS = -msse2 -DHAVE_SSE2
AVX2FLAGS = -mavx2 -DHAVE_SSE2 -DHAVE_AVX2
AVX512FLAGS = -march=skylake-avx512 -DHAVE_SSE2 -DHAVE_AVX2 -DHAVE_AVX512 
ARM64SHA3FLAGS  = -march=armv8.5-a+sha3
NEONFLAGS = -march=armv8+nosha3
#SSE2FLAGS = /arch:SSE2 /DHAVE_SSE2
STD_TARGET = test-std-M19937
ALL_STD_TARGET = test-std-M521 test-std-M1279 test-std-M2203 test-std-M4253 \
test-std-M11213 test-std-M19937 test-std-M44497 test-std-M86243 \
test-std-M132049 test-std-M216091
ALTI_TARGET = $(STD_TARGET) test-alti-M19937
ALL_ALTI_TARGET = test-alti-M521 test-alti-M1279 test-alti-M2203 \
test-alti-M4253 test-alti-M11213 test-alti-M19937 test-alti-M44497 \
test-alti-M86243 test-alti-M132049 test-alti-M216091
SSE2_TARGET = $(STD_TARGET) test-sse2-M19937
AVX2_TARGET = $(SSE2_TARGET) test-avx2-M19937
AVX512_TARGET = $(AVX2_TARGET) test-avx512-M19937
ALL_SSE2_TARGET = test-sse2-M521 test-sse2-M1279 test-sse2-M2203 \
test-sse2-M4253 test-sse2-M11213 test-sse2-M19937 test-sse2-M44497 \
test-sse2-M86243 test-sse2-M132049 test-sse2-M216091
ALL_AVX2_TARGET = test-avx2-M521 test-avx2-M1279 test-avx2-M2203 \
test-avx2-M4253 test-avx2-M11213 test-avx2-M19937 test-avx2-M44497 \
test-avx2-M86243 test-avx2-M132049 test-avx2-M216091
ALL_AVX512_TARGET = test-avx512-M521 test-avx512-M1279 test-avx512-M2203 \
test-avx512-M4253 test-avx512-M11213 test-avx512-M19937 test-avx512-M44497 \
test-avx512-M86243 test-avx512-M132049 test-avx512-M216091
NEON_TARGET = test-neon-M19937
ALL_NEON_TARGET = test-neon-M521 test-neon-M1279 test-neon-M2203 \
test-neon-M4253 test-neon-M11213 test-neon-M19937 test-neon-M44497 \
test-neon-M86243 test-neon-M132049 test-neon-M216091
NEON_SHA3_TARGET = test-neon-sha3-M19937
ALL_NEON_SHA3_TARGET = test-neon-sha3-M521 test-neon-sha3-M1279 test-neon-sha3-M2203 \
test-neon-sha3-M4253 test-neon-sha3-M11213 test-neon-sha3-M19937 test-neon-sha3-M44497 \
test-neon-sha3-M86243 test-neon-sha3-M132049 test-neon-sha3-M216091

# ==========================================================
# comment out or EDIT following lines to get max performance
# ==========================================================
# --------------------
# for gcc 4
# --------------------
#CCFLAGS += --param inline-unit-growth=500 \
#--param large-function-growth=900
# --------------------
# for icl
# --------------------
#CC = icl /Wcheck /O3 /QxB /Qprefetch
# --------------------
# for icc
# --------------------
#CC = icc
#OPTI = -O3 -finline-functions -fomit-frame-pointer -DNDEBUG \
#-fno-strict-aliasing
#CCFLAGS = $(OPTI) $(WARN) $(STD)
# -----------------
# for PowerPC
# -----------------
#CCFLAGS += -arch ppc
# -----------------
# for Pentium M
# -----------------
#CCFLAGS += -march=prescott
# -----------------
# for Athlon 64
# -----------------
#CCFLAGS += -march=athlon64

.PHONY: std-check sse2-check avx2-check alti-check neon-check neon-sha3-check

std: $(STD_TARGET)

sse2: $(SSE2_TARGET)

avx2: $(AVX2_TARGET)

neon: $(NEON_TARGET)

neon-sha3: $(NEON_SHA3_TARGET)

avx512: $(AVX512_TARGET)

alti: $(ALTI_TARGET)

neon: $(NEON_TARGET)

osx-alti:
	$(MAKE) "ALTIFLAGS=$(OSXALTIFLAGS)" alti

std-check: $(ALL_STD_TARGET)
	./check.sh test-std

sse2-check: $(ALL_SSE2_TARGET)
	./check.sh test-sse2

avx2-check: $(ALL_AVX2_TARGET)
	./check.sh test-avx2

avx512-check: $(ALL_AVX512_TARGET)
	./check.sh test-avx512

neon-check: $(ALL_NEON_TARGET) $(ARM64_NO_SHA3_FLAGS)
	./check.sh test-neon

neon-sha3-check: $(ALL_NEON_SHA3_TARGET)
	./check.sh test-neon-sha3

alti-check: $(ALL_ALTI_TARGET)
	./check.sh test-alti

osx-alti-check:
	make "ALTIFLAGS=$(OSXALTIFLAGS)" alti-check

test-std-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-alti-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-sse2-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-avx2-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-avx512-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-neon-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-neon-sha3-M521: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=521 -o $@ dSFMT.c test.c

test-std-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-alti-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-sse2-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-avx2-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-avx512-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-neon-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-neon-sha3-M1279: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=1279 -o $@ dSFMT.c test.c

test-std-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-alti-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-sse2-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h 
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-avx2-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-avx512-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-neon-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-neon-sha3-M2203: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=2203 -o $@ dSFMT.c test.c

test-std-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-alti-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-sse2-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-avx2-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-avx512-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-neon-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-neon-sha3-M4253: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=4253 -o $@ dSFMT.c test.c

test-std-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-alti-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-sse2-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-avx2-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-avx512-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-neon-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-neon-sha3-M11213: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=11213 -o $@ dSFMT.c test.c

test-std-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-alti-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-sse2-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-avx2-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-avx512-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-neon-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-neon-sha3-M19937: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=19937 -o $@ dSFMT.c test.c

test-std-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-alti-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-sse2-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-avx2-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-avx512-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-neon-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-neon-sha3-M44497: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=44497 -o $@ dSFMT.c test.c

test-std-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-alti-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-sse2-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-avx2-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-avx512-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-neon-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-neon-sha3-M86243: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=86243 -o $@ dSFMT.c test.c

test-std-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c

test-alti-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c

test-sse2-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c

test-avx2-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c	

test-avx512-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c

test-neon-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c

test-neon-sha3-M132049: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=132049 -o $@ dSFMT.c test.c

test-std-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

test-alti-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ALTIFLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

test-sse2-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(SSE2FLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

test-avx2-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h dSFMT-avx2.h
	$(CC) $(CCFLAGS) $(AVX2FLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

test-avx512-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(AVX512FLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

test-neon-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(NEONFLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

test-neon-sha3-M216091: test.c dSFMT.c dSFMT.h dSFMT-common.h
	$(CC) $(CCFLAGS) $(ARM64SHA3FLAGS) -DDSFMT_MEXP=216091 -o $@ dSFMT.c test.c

.c.o:
	$(CC) $(CCFLAGS) -c $<

clean:
	rm -f *.o *~ test-*-M*
