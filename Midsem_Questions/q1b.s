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
        ; r4 used for loading data
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
        LDR     r4, =d1
        LDR     r4, [r4]
        CMP     r4, #0
        BEQ     is_zero
        BGT     is_pos

is_neg
        PUSH    {r9-r12}        ; if negative
        B       done

is_pos
        PUSH    {r5-r8}         ; if positive
        B       done

is_zero
        PUSH    {r0-r3}         ; if zero

done
hang    B       hang

        ; -------------------------
        ; Data section
        ; -------------------------
        AREA    DATA, DATA, READWRITE
d1      DCD     0               ; change value for testing

        END

