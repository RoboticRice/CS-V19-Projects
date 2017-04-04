/* This is a comment */
.data

.balign 4
a: .skip 16

.text

.global main
main:
    ldr r1, addr_of_a		/* r1 <- &a */
    mov r2, #0			/* r2 <- 0 */
/* position 0 :: 15 */
    add r3, r1, r2, LSL #2	/* r3 <- r1 + (r2*4) */
    mov r4, #15
    str r4, [r3]		/* *r3 <- r2 */
/* position 1 :: 12 */
    add r2, r2, #1		/* r2 <- r2 + 1 */
    add r3, r1, r2, LSL #2	/* r3 <- r1 + (r2*4) */
    mov r4, #12
    str r4, [r3]		/* *r3 <- r2 */
/* position 2 :: 7 */
    add r2, r2, #1		/* r2 <- r2 + 1 */
    add r3, r1, r2, LSL #2	/* r3 <- r1 + (r2*4) */
    mov r4, #7
    str r4, [r3]		/* *r3 <- r2 */
/* position 3 :: 70 */
    add r2, r2, #1		/* r2 <- r2 + 1 */
    add r3, r1, r2, LSL #2	/* r3 <- r1 + (r2*4) */
    mov r4, #70
    str r4, [r3]		/* *r3 <- r2 */

    mov r2, #0			/* r2 <- 0 */
    add r3, r1, r2, LSL #2	/* go to position r2 in array */
    ldr r0, [r3]		/* load value from position r2 in array into r0 */
    ldr r4, [r3]		/* also load into r4 (second lowest) */
    add r2, r2, #1		/* increment counter r2 */
    add r3, r1, r2, LSL #2	/* go to position r2 in array */
    ldr r5, [r3]
    cmp r5, r0			/* compare current min with current array position value */
    ble less			/* if current array value <= current min, skip to less */
    ldrle r0, [r3]		/*    if current array value is > lowest, load into 2nd lowest */
    b greater			/* skip rest*/
less:
    ldr r4, [r3]		/* only do this if current array value is less than current min */
greater:
    add r2, r2, #1		/* increment counter r2 */
loop:
    cmp r2, #4			/*if r2 == 4, end loop*/
    beq end
    add r3, r1, r2, LSL #2	/* go to position r2 in array */
    ldr r5, [r3]
    cmp r5, r0			/* compare current min with current array position value */
    ble lesser			/* if current array value <= current min, skip to less */
    cmp r5, r4			/* else, compare current array value with 2nd lowest */
    ldrle r4, [r3]		/*    if current array value is <= second lowest, load into 2nd lowest */
    b greaterer			/* skip rest of comparisions */
lesser:
    ldr r0, [r3]		/* only do this if current array value is less than current min */
greaterer:
    add r2, r2, #1		/* increment counter r2 */
    b loop			/* return to top of loop */
end:
    mov r0, r4			/* move the value from r4 (2nd min) into r0 */
    bx lr
addr_of_a: .word a