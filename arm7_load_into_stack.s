AREA    ARM7_STACK, CODE, READONLY
ENTRY

; Initialize stack pointer (Assume stack at 0x20001000)
LDR     SP, =0x20001000

; Initialize registers with sample values
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

; Initialize d1 memory location
LDR     R4, =d1
LDR     R4, [R4]

; Conditional store using ITTTT format
CMP     R4, #0
ITTTT   GT
STMFDGT SP!, {R5-R8}      ; If d1 > 0, store R5-R8
ITTTT   LT
STMFDLT SP!, {R9-R12}     ; If d1 < 0, store R9-R12
ITTTT   EQ
STMFD   SP!, {R0-R3}      ; If d1 == 0, store R0-R3

B       .

; Data section
AREA    ARM7_STACK_DATA, DATA, READWRITE
d1  DCD     1      ; Change this value to test different conditions

END