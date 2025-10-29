        AREA RESET, CODE, READONLY
        THUMB
IN      dcd 0X20000100, 0X80000009
;SP calue stored in 0x00000000 and address where PC should ebe intilaized
        ENTRY
        MOV R1, #0x11
		MOV R2, #0x22
		MOV R3, #0x33
		MOV R4, #0x44
		
		PUSH {R1}
		PUSH {R2}
		PUSH {R3}
		PUSH {R4}
		
		POP {R5}
		POP {R6}
		POP {R7}
		POP {R8}
		
Ll      B       Ll
SRC     DCD 0X30303030,0X20202020,0X40404040

        AREA RES1, DATA, READWRITE
DST     DCD 0X00
        END


ARM7 ALP Code for STM32. Stores value of R5-R8 into stack if memory location labelled d1 is positive. negative-r9 to r12. 0- r0-r3. using branching. initialize vectors properly