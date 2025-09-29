        AREA RESET, CODE, READONLY
        ENTRY

START
        ; define code area
        adr     r6, a
        ldr     r5, =dst         ; address of data a is transferred to R4
        add     r13, r13, #0x10
        ldr     r1, [r6], #4
        ldr     r2, [r6], #4
        ldr     r3, [r6], #4
        add     r4, r1, r2
        sub     r4, r4, r3
        str     r4, [r5]

fl      b       fl

STOP
a       DCD     0x40, 0x30, 0x20

        AREA RES, DATA, READWRITE
dst     DCD     0x0
        END

