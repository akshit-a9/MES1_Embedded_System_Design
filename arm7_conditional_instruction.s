; if(a<b){
; x=5;
; y = c + d;
; }
; else
; y = c - d;

	
	AREA RESET, CODE, READONLY
	THUMB
IN	dcd 0x20000100, 0x08000009
	ENTRY
		LDR	r4, =a        ; address of a
		LDR r0, [r4], #4  ; r0 = a
		LDR r1, [r4], #4  ; r1 = b
		CMP r0, r1        ; compare a, b
		
		LDR r0, [r4], #4  ; r0 = c
		LDR r1, [r4], #4  ; r1 = d
		LDR r4, =DST      ; address of y
		
		ITTTT LT          ; if a < b
		ADDLT r0, r1, r0  ; r0 = c + d
		MOVLT r2, #5      ; r2 = 5
		STRLT r0, [r4], #4; y = r0 (=c+d)
		STRLT r2,[r4]     ; x = r2 (=5)
		
		ITT GE            ; if a >= b
		SUBGE r0,r0,r1    ; r0 = c - d
		STRGE r0,[r4]     ; y = r0 (=c-d)
l	B	l
		
a	DCD 0x10, 0x20, 0x40, 0x30 ; a,b,c,d
	
	AREA DATA, DATA, READWRITE

DST	DCD 0x0, 0x0  ; y, x

	END
