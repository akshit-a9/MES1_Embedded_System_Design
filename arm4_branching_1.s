        AREA RESET, CODE, READONLY
        ENTRY

START   
        ADR     r4, a              ; load address of data array into r4
        LDR     r0, [r4], #4       ; load first element, post-increment
        LDR     r1, [r4], #4       ; load second element
        CMP     r0, r1             ; compare r0 and r1
        BGE     aft                ; if r0 >= r1, jump to aft

        ; otherwise, perform addition
        LDR     r0, [r4], #4
        LDR     r1, [r4], #4
        ADD     r2, r0, r1
        STR     r2, [r4], #4
        B       aft

tbl
        ; subtraction block
        LDR     r0, [r4], #4
        LDR     r1, [r4], #4
        SUB     r2, r0, r1
        STR     r2, [r4]

aft     B       aft                ; infinite loop
STOP    

a       DCD     20, 10, 30, 40, 0, 0, 0, 0
        AREA    Data, DATA, READWRITE
