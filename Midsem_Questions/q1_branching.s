        AREA RESET, CODE, READONLY
        THUMB
IN      DCD     0x20000100, Reset_Handler
        ENTRY

Reset_Handler

        MOV     r0,  #0
        MOV     r1,  #1
        MOV     r2,  #2
        MOV     r3,  #3
        MOV     r5,  #5
        MOV     r6,  #6
        MOV     r7,  #7
        MOV     r8,  #8
        MOV     r9,  #9
        MOV     r10, #10
        MOV     r11, #11
        MOV     r12, #12

        LDR     r4, =d1
        LDR     r4, [r4]
        CMP     r4, #0
        BEQ     is_zero
        BGT     is_pos

is_neg
        PUSH    {r9-r12}        
        B       done

is_pos
        PUSH    {r5-r8}         
        B       done

is_zero
        PUSH    {r0-r3}         

done
hang    B       hang


        AREA    DATA, DATA, READWRITE
d1      DCD     37              

        END

