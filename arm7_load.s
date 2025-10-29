AREA    ARM7_LOAD, CODE, READONLY
ENTRY

; Initialize values
MOV     R5, #5
MOV     R6, #6
MOV     R7, #7
MOV     R8, #8
MOV     R9, #-9
MOV     R10, #-10
MOV     R11, #-11
MOV     R12, #-12
MOV     R0, #0
MOV     R1, #1
MOV     R2, #2
MOV     R3, #3

; Initialize stack pointer
LDR     SP, =STACK_TOP

; Initialize d1 memory location
LDR     R4, =d1
LDR     R14, [R4]         ; Load value at d1 into R14

; Branching based on value at d1
CMP     R14, #0
BEQ     STORE_ZERO
BGT     STORE_POSITIVE
BLT     STORE_NEGATIVE

STORE_POSITIVE
STMFD   SP!, {R5-R8}      ; Store R5-R8 if d1 > 0
B       END

STORE_NEGATIVE
STMFD   SP!, {R9-R12}     ; Store R9-R12 if d1 < 0
B       END

STORE_ZERO
STMFD   SP!, {R0-R3}      ; Store R0-R3 if d1 == 0
B       END

END
B       END               ; Infinite loop

; Data section
AREA    ARM7_LOAD_DATA, DATA, READWRITE
d1      DCD     1             ; Change this value to test (positive, negative, zero)
STACK   SPACE   0x100
STACK_TOP
EQU     STACK+0x100

END