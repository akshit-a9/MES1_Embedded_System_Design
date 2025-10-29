        AREA RESET, CODE, READONLY
        THUMB
IN      DCD     0x20000100, Reset_Handler
        ENTRY

Reset_Handler
        ; -------------------------
        ; Initialize registers (except R4)
        ; -------------------------
        MOV     r0,  #0
        MOV     r1,  #1
        MOV     r2,  #2
        MOV     r3,  #3
        ; r4 reserved for memory access
        MOV     r5,  #5
        MOV     r6,  #6
        MOV     r7,  #7
        MOV     r8,  #8
        MOV     r9,  #9
        MOV     r10, #10
        MOV     r11, #11
        MOV     r12, #12

        ; -------------------------
        ; Load and compare using R4
        ; -------------------------
        LDR     r4, =d1         ; r4 = address of d1
        LDR     r4, [r4]        ; r4 = value at d1
        CMP     r4, #0          ; compare with zero

        ; If zero -> store R0–R3
        IT      EQ
        PUSHEQ  {r0-r3}

        ; If positive -> store R5–R8
        IT      GT
        PUSHGT  {r5-r8}

        ; If negative -> store R9–R12
        IT      LT
        PUSHLT  {r9-r12}

hang    B       hang

        ; -------------------------
        ; Data section
        ; -------------------------
        AREA    DATA, DATA, READWRITE
d1      DCD     0               ; change to +ve / -ve / 0

        END

