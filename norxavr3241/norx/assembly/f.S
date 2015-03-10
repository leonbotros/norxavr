.global F
.type F, @function

; Author: Leon Botros.
; NORX32 permutation F^R(S).

F:
  ; R25:R24 address of norx state containing 16 (s0, ..., s15) 32-bit words.
  ; R23:R22 number of rounds
  ; s_n at Z + (4n + 0) .. Z + (4n + 3)
  
  push	r2
  push 	r3
  push 	r4
  push 	r5
  push 	r6
  push 	r7
  push 	r8
  push 	r9
  push	r10
  push	r11
  push	r12
  push 	r13
  push	r14
  push	r15
  push	r16
  push	r17
  push 	r28
  push	r29
  
  movw	r30, r24	; save address to begin of NORX state in Z
  mov 	r13, r22
  
  ldd	r2, Z + 0
  ldd	r3, Z + 1
  ldd	r4, Z + 2
  ldd 	r5, Z + 3
  
  ldd	r6, Z + 4
  ldd	r7, Z + 5
  ldd	r8, Z + 6
  ldd 	r9, Z + 7
  
  ldd	r10, Z + 8
  ldd	r11, Z + 9
  ldd	r12, Z + 10
  
round:
  
  ldd	r18, Z + 16 + 0
  ldd	r19, Z + 16 + 1
  ldd	r20, Z + 16 + 2
  ldd	r21, Z + 16 + 3
  
  ldd	r22, Z + 32 + 0
  ldd	r23, Z + 32 + 1
  ldd	r24, Z + 32 + 2
  ldd	r25, Z + 32 + 3
  
  ldd	r26, Z + 48 + 0
  ldd	r27, Z + 48 + 1
  ldd	r28, Z + 48 + 2
  ldd	r29, Z + 48 + 3
  
  ;; STEP 1
  
  movw 	r0, r2
  eor	r2, r18
  and	r0, r18
  lsl	r0
  eor	r2, r0
  eor	r26, r2
  
  eor	r3, r19
  and	r1, r19
  rol	r1
  eor	r3, r1
  eor	r27, r3
  
  movw 	r0, r4
  eor	r4, r20
  and	r0, r20
  rol	r0
  eor	r4, r0
  eor	r28, r4
  
  eor	r5, r21
  and	r1, r21
  rol	r1
  eor	r5, r1
  eor	r29, r5
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r2
  eor	r2, r19
  and	r0, r19
  lsl	r0
  eor	r2, r0
  eor	r27, r2
  
  eor	r3, r20
  and	r1, r20
  rol	r1
  eor	r3, r1
  eor	r28, r3
  
  movw 	r0, r4
  eor	r4, r21
  and	r0, r21
  rol	r0
  eor	r4, r0
  eor	r29, r4

  eor	r5, r18
  and	r1, r18
  rol	r1
  eor	r5, r1
  eor	r26, r5
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 16 + 0, r19
  std	Z + 16 + 1, r20
  std	Z + 16 + 2, r21
  std	Z + 16 + 3, r18
  
  std	Z + 32 + 0, r22
  std	Z + 32 + 1, r23
  std	Z + 32 + 2, r24
  std	Z + 32 + 3, r25
  
  std	Z + 48 + 0, r29
  std	Z + 48 + 1, r26
  std	Z + 48 + 2, r27
  std	Z + 48 + 3, r28
  
  ldd	r18, Z + 20 + 0
  ldd	r19, Z + 20 + 1
  ldd	r20, Z + 20 + 2
  ldd	r21, Z + 20 + 3
  
  ldd	r22, Z + 36 + 0
  ldd	r23, Z + 36 + 1
  ldd	r24, Z + 36 + 2
  ldd	r25, Z + 36 + 3
  
  ldd	r26, Z + 52 + 0
  ldd	r27, Z + 52 + 1
  ldd	r28, Z + 52 + 2
  ldd	r29, Z + 52 + 3
  
  ;; STEP 1
  
  movw 	r0, r6
  eor	r6, r18
  and	r0, r18
  lsl	r0
  eor	r6, r0
  eor	r26, r6
  
  eor	r7, r19
  and	r1, r19
  rol	r1
  eor	r7, r1
  eor	r27, r7
  
  movw 	r0, r8
  eor	r8, r20
  and	r0, r20
  rol	r0
  eor	r8, r0
  eor	r28, r8
  
  eor	r9, r21
  and	r1, r21
  rol	r1
  eor	r9, r1
  eor	r29, r9
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r6
  eor	r6, r19
  and	r0, r19
  lsl	r0
  eor	r6, r0
  eor	r27, r6
  
  eor	r7, r20
  and	r1, r20
  rol	r1
  eor	r7, r1
  eor	r28, r7
  
  movw 	r0, r8
  eor	r8, r21
  and	r0, r21
  rol	r0
  eor	r8, r0
  eor	r29, r8

  eor	r9, r18
  and	r1, r18
  rol	r1
  eor	r9, r1
  eor	r26, r9
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 20 + 0, r19
  std	Z + 20 + 1, r20
  std	Z + 20 + 2, r21
  std	Z + 20 + 3, r18
  
  std	Z + 36 + 0, r22
  std	Z + 36 + 1, r23
  std	Z + 36 + 2, r24
  std	Z + 36 + 3, r25
  
  std	Z + 52 + 0, r29
  std	Z + 52 + 1, r26
  std	Z + 52 + 2, r27
  std	Z + 52 + 3, r28
  
  ldd	r17, Z + 8 + 3
  
  ldd	r18, Z + 24 + 0
  ldd	r19, Z + 24 + 1
  ldd	r20, Z + 24 + 2
  ldd	r21, Z + 24 + 3
  
  ldd	r22, Z + 40 + 0
  ldd	r23, Z + 40 + 1
  ldd	r24, Z + 40 + 2
  ldd	r25, Z + 40 + 3
  
  ldd	r26, Z + 56 + 0
  ldd	r27, Z + 56 + 1
  ldd	r28, Z + 56 + 2
  ldd	r29, Z + 56 + 3
  
  ;; STEP 1
  
  movw 	r0, r10
  eor	r10, r18
  and	r0, r18
  lsl	r0
  eor	r10, r0
  eor	r26, r10
  
  eor	r11, r19
  and	r1, r19
  rol	r1
  eor	r11, r1
  eor	r27, r11
  
  mov 	r0, r12
  eor	r12, r20
  and	r0, r20
  rol	r0
  eor	r12, r0
  eor	r28, r12
  
  mov 	r1, r17
  eor	r17, r21
  and	r1, r21
  rol	r1
  eor	r17, r1
  eor	r29, r17
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r10
  eor	r10, r19
  and	r0, r19
  lsl	r0
  eor	r10, r0
  eor	r27, r10
  
  eor	r11, r20
  and	r1, r20
  rol	r1
  eor	r11, r1
  eor	r28, r11
  
  mov 	r0, r12
  eor	r12, r21
  and	r0, r21
  rol	r0
  eor	r12, r0
  eor	r29, r12

  mov 	r1, r17
  eor	r17, r18
  and	r1, r18
  rol	r1
  eor	r17, r1
  eor	r26, r17
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 8 + 3, r17
  
  std	Z + 24 + 0, r19
  std	Z + 24 + 1, r20
  std	Z + 24 + 2, r21
  std	Z + 24 + 3, r18
  
  std	Z + 40 + 0, r22
  std	Z + 40 + 1, r23
  std	Z + 40 + 2, r24
  std	Z + 40 + 3, r25
  
  std	Z + 56 + 0, r29
  std	Z + 56 + 1, r26
  std	Z + 56 + 2, r27
  std	Z + 56 + 3, r28
  
  ldd	r14, Z + 12 + 0
  ldd	r15, Z + 12 + 1  
  ldd	r16, Z + 12 + 2
  ldd	r17, Z + 12 + 3
  
  ldd	r18, Z + 28 + 0
  ldd	r19, Z + 28 + 1
  ldd	r20, Z + 28 + 2
  ldd	r21, Z + 28 + 3
  
  ldd	r22, Z + 44 + 0
  ldd	r23, Z + 44 + 1
  ldd	r24, Z + 44 + 2
  ldd	r25, Z + 44 + 3
  
  ldd	r26, Z + 60 + 0
  ldd	r27, Z + 60 + 1
  ldd	r28, Z + 60 + 2
  ldd	r29, Z + 60 + 3
  
  ;; STEP 1
  
  movw 	r0, r14
  eor	r14, r18
  and	r0, r18
  lsl	r0
  eor	r14, r0
  eor	r26, r14
  
  eor	r15, r19
  and	r1, r19
  rol	r1
  eor	r15, r1
  eor	r27, r15
  
  movw 	r0, r16
  eor	r16, r20
  and	r0, r20
  rol	r0
  eor	r16, r0
  eor	r28, r16
  
  eor	r17, r21
  and	r1, r21
  rol	r1
  eor	r17, r1
  eor	r29, r17
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r14
  eor	r14, r19
  and	r0, r19
  lsl	r0
  eor	r14, r0
  eor	r27, r14
  
  eor	r15, r20
  and	r1, r20
  rol	r1
  eor	r15, r1
  eor	r28, r15
  
  movw 	r0, r16
  eor	r16, r21
  and	r0, r21
  rol	r0
  eor	r16, r0
  eor	r29, r16

  eor	r17, r18
  and	r1, r18
  rol	r1
  eor	r17, r1
  eor	r26, r17
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 12 + 0, r14
  std	Z + 12 + 1, r15
  std	Z + 12 + 2, r16
  std	Z + 12 + 3, r17
  
  std	Z + 28 + 0, r19
  std	Z + 28 + 1, r20
  std	Z + 28 + 2, r21
  std	Z + 28 + 3, r18
  
  std	Z + 44 + 0, r22
  std	Z + 44 + 1, r23
  std	Z + 44 + 2, r24
  std	Z + 44 + 3, r25
  
  ldd	r18, Z + 20 + 0
  ldd	r19, Z + 20 + 1
  ldd	r20, Z + 20 + 2
  ldd	r21, Z + 20 + 3
  
  ldd	r22, Z + 40 + 0
  ldd	r23, Z + 40 + 1
  ldd	r24, Z + 40 + 2
  ldd	r25, Z + 40 + 3
  
  ;; STEP 1
  
  movw 	r0, r2
  eor	r2, r18
  and	r0, r18
  lsl	r0
  eor	r2, r0
  eor	r29, r2
  
  eor	r3, r19
  and	r1, r19
  rol	r1
  eor	r3, r1
  eor	r26, r3
  
  movw 	r0, r4
  eor	r4, r20
  and	r0, r20
  rol	r0
  eor	r4, r0
  eor	r27, r4
  
  eor	r5, r21
  and	r1, r21
  rol	r1
  eor	r5, r1
  eor	r28, r5
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r26
  and	r0, r26
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r27
  and	r1, r27
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r28
  and	r0, r28
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r29
  and	r1, r29
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r2
  eor	r2, r19
  and	r0, r19
  lsl	r0
  eor	r2, r0
  eor	r26, r2
  
  eor	r3, r20
  and	r1, r20
  rol	r1
  eor	r3, r1
  eor	r27, r3
  
  movw 	r0, r4
  eor	r4, r21
  and	r0, r21
  rol	r0
  eor	r4, r0
  eor	r28, r4

  eor	r5, r18
  and	r1, r18
  rol	r1
  eor	r5, r1
  eor	r29, r5
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r28
  and	r0, r28
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r29
  and	r1, r29
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r26
  and	r0, r26
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r27
  and	r1, r27
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 20 + 0, r19
  std	Z + 20 + 1, r20
  std	Z + 20 + 2, r21
  std	Z + 20 + 3, r18
  
  std	Z + 40 + 0, r22
  std	Z + 40 + 1, r23
  std	Z + 40 + 2, r24
  std	Z + 40 + 3, r25
  
  std	Z + 60 + 0, r28
  std	Z + 60 + 1, r29
  std	Z + 60 + 2, r26
  std	Z + 60 + 3, r27
  
  ldd	r18, Z + 24 + 0
  ldd	r19, Z + 24 + 1
  ldd	r20, Z + 24 + 2
  ldd	r21, Z + 24 + 3
  
  ldd	r22, Z + 44 + 0
  ldd	r23, Z + 44 + 1
  ldd	r24, Z + 44 + 2
  ldd	r25, Z + 44 + 3
  
  ldd	r26, Z + 48 + 0
  ldd	r27, Z + 48 + 1
  ldd	r28, Z + 48 + 2
  ldd	r29, Z + 48 + 3
  
  ;; STEP 1
  
  movw 	r0, r6
  eor	r6, r18
  and	r0, r18
  lsl	r0
  eor	r6, r0
  eor	r26, r6
  
  eor	r7, r19
  and	r1, r19
  rol	r1
  eor	r7, r1
  eor	r27, r7
  
  movw 	r0, r8
  eor	r8, r20
  and	r0, r20
  rol	r0
  eor	r8, r0
  eor	r28, r8
  
  eor	r9, r21
  and	r1, r21
  rol	r1
  eor	r9, r1
  eor	r29, r9
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r6
  eor	r6, r19
  and	r0, r19
  lsl	r0
  eor	r6, r0
  eor	r27, r6
  
  eor	r7, r20
  and	r1, r20
  rol	r1
  eor	r7, r1
  eor	r28, r7
  
  movw 	r0, r8
  eor	r8, r21
  and	r0, r21
  rol	r0
  eor	r8, r0
  eor	r29, r8

  eor	r9, r18
  and	r1, r18
  rol	r1
  eor	r9, r1
  eor	r26, r9
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 24 + 0, r19
  std	Z + 24 + 1, r20
  std	Z + 24 + 2, r21
  std	Z + 24 + 3, r18
  
  std	Z + 44 + 0, r22
  std	Z + 44 + 1, r23
  std	Z + 44 + 2, r24
  std	Z + 44 + 3, r25
  
  std	Z + 48 + 0, r29
  std	Z + 48 + 1, r26
  std	Z + 48 + 2, r27
  std	Z + 48 + 3, r28
  
  ldd	r17, Z + 8 + 3
  
  ldd	r18, Z + 28 + 0
  ldd	r19, Z + 28 + 1
  ldd	r20, Z + 28 + 2
  ldd	r21, Z + 28 + 3
  
  ldd	r22, Z + 32 + 0
  ldd	r23, Z + 32 + 1
  ldd	r24, Z + 32 + 2
  ldd	r25, Z + 32 + 3
  
  ldd	r26, Z + 52 + 0
  ldd	r27, Z + 52 + 1
  ldd	r28, Z + 52 + 2
  ldd	r29, Z + 52 + 3
  
  ;; STEP 1
  
  movw 	r0, r10
  eor	r10, r18
  and	r0, r18
  lsl	r0
  eor	r10, r0
  eor	r26, r10
  
  eor	r11, r19
  and	r1, r19
  rol	r1
  eor	r11, r1
  eor	r27, r11
  
  mov 	r0, r12
  eor	r12, r20
  and	r0, r20
  rol	r0
  eor	r12, r0
  eor	r28, r12
  
  mov 	r1, r17
  eor	r17, r21
  and	r1, r21
  rol	r1
  eor	r17, r1
  eor	r29, r17
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r10
  eor	r10, r19
  and	r0, r19
  lsl	r0
  eor	r10, r0
  eor	r27, r10
  
  eor	r11, r20
  and	r1, r20
  rol	r1
  eor	r11, r1
  eor	r28, r11
  
  mov 	r0, r12
  eor	r12, r21
  and	r0, r21
  rol	r0
  eor	r12, r0
  eor	r29, r12

  mov 	r1, r17
  eor	r17, r18
  and	r1, r18
  rol	r1
  eor	r17, r1
  eor	r26, r17
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 8 + 3, r17
  
  std	Z + 28 + 0, r19
  std	Z + 28 + 1, r20
  std	Z + 28 + 2, r21
  std	Z + 28 + 3, r18
  
  std	Z + 32 + 0, r22
  std	Z + 32 + 1, r23
  std	Z + 32 + 2, r24
  std	Z + 32 + 3, r25
  
  std	Z + 52 + 0, r29
  std	Z + 52 + 1, r26
  std	Z + 52 + 2, r27
  std	Z + 52 + 3, r28
  
  ldd	r14, Z + 12 + 0
  ldd	r15, Z + 12 + 1
  ldd	r16, Z + 12 + 2
  ldd	r17, Z + 12 + 3
  
  ldd	r18, Z + 16 + 0
  ldd	r19, Z + 16 + 1
  ldd	r20, Z + 16 + 2
  ldd	r21, Z + 16 + 3
  
  ldd	r22, Z + 36 + 0
  ldd	r23, Z + 36 + 1
  ldd	r24, Z + 36 + 2
  ldd	r25, Z + 36 + 3
  
  ldd	r26, Z + 56 + 0
  ldd	r27, Z + 56 + 1
  ldd	r28, Z + 56 + 2
  ldd	r29, Z + 56 + 3
  
  ;; STEP 1
  
  movw 	r0, r14
  eor	r14, r18
  and	r0, r18
  lsl	r0
  eor	r14, r0
  eor	r26, r14
  
  eor	r15, r19
  and	r1, r19
  rol	r1
  eor	r15, r1
  eor	r27, r15
  
  movw 	r0, r16
  eor	r16, r20
  and	r0, r20
  rol	r0
  eor	r16, r0
  eor	r28, r16
  
  eor	r17, r21
  and	r1, r21
  rol	r1
  eor	r17, r1
  eor	r29, r17
  
  ;; STEP 2
  
  movw 	r0, r22
  eor	r22, r27
  and	r0, r27
  lsl	r0
  eor	r22, r0
  eor	r18, r22
  
  eor	r23, r28
  and	r1, r28
  rol	r1
  eor	r23, r1
  eor	r19, r23
  
  movw 	r0, r24
  eor	r24, r29
  and	r0, r29
  rol	r0
  eor	r24, r0
  eor	r20, r24
  
  eor	r25, r26
  and	r1, r26
  rol	r1
  eor	r25, r1
  eor	r21, r25
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  mov 	r0, r18
  lsr	r0
  
  ror	r21
  ror	r20
  ror	r19
  ror	r18
  
  ;; STEP 3
  
  movw 	r0, r14
  eor	r14, r19
  and	r0, r19
  lsl	r0
  eor	r14, r0
  eor	r27, r14
  
  eor	r15, r20
  and	r1, r20
  rol	r1
  eor	r15, r1
  eor	r28, r15
  
  movw 	r0, r16
  eor	r16, r21
  and	r0, r21
  rol	r0
  eor	r16, r0
  eor	r29, r16

  eor	r17, r18
  and	r1, r18
  rol	r1
  eor	r17, r1
  eor	r26, r17
  
  ;; STEP 4
  
  movw 	r0, r22
  eor	r22, r29
  and	r0, r29
  lsl	r0
  eor	r22, r0
  eor	r19, r22
  
  eor	r23, r26
  and	r1, r26
  rol	r1
  eor	r23, r1
  eor	r20, r23
  
  movw 	r0, r24
  eor	r24, r27
  and	r0, r27
  rol	r0
  eor	r24, r0
  eor	r21, r24
  
  eor	r25, r28
  and	r1, r28
  rol	r1
  eor	r25, r1
  eor	r18, r25
  
  mov 	r0, r18
  rol	r0
  
  rol	r19
  rol	r20
  rol	r21
  rol	r18  
  
  std	Z + 12 + 0, r14
  std	Z + 12 + 1, r15
  std	Z + 12 + 2, r16
  std	Z + 12 + 3, r17
  
  std	Z + 16 + 0, r19
  std	Z + 16 + 1, r20
  std	Z + 16 + 2, r21
  std	Z + 16 + 3, r18
  
  std	Z + 36 + 0, r22
  std	Z + 36 + 1, r23
  std	Z + 36 + 2, r24
  std	Z + 36 + 3, r25
  
  std	Z + 56 + 0, r29
  std	Z + 56 + 1, r26
  std	Z + 56 + 2, r27
  std	Z + 56 + 3, r28
  
  dec 	r13
  breq	end
  rjmp	round

end:

  std	Z + 0, r2
  std	Z + 1, r3
  std	Z + 2, r4
  std	Z + 3, r5
  
  std	Z + 4, r6
  std	Z + 5, r7
  std	Z + 6, r8
  std	Z + 7, r9
  
  std	Z + 8, r10
  std	Z + 9, r11
  std	Z + 10, r12

  clr	r1
  
  pop	r29
  pop	r28
  pop	r17
  pop	r16
  pop	r15
  pop	r14
  pop	r13
  pop 	r12
  pop	r11
  pop	r10
  pop	r9
  pop	r8
  pop	r7
  pop	r6 
  pop	r5
  pop	r4
  pop	r3
  pop	r2

  ret
  