_DATA	SEGMENT
S	DW	?
A	DW	3
B	DW	4
_DATA	ENDS
_TEXT	SEGMENT
	ASSUME	CS: _TEXT, DS: _DATA
AREA	PROC	
	PUSH	BP
	MOV	BP, SP
	MOV	AX, [BP+4]
	MUL	BYTE PTR [BP+6]
	MOV	CL, BYTE PTR 1
	SHR	AX, CL
	MOV	S, AX
	MOV	SP, BP
	POP	BP
	RET
AREA	ENDP

DISPBX  PROC    
        MOV     CH,4
        MOV     CL,4
ROTATE: ROL     BX,CL
        MOV     AL,BL
        AND     AL,0FH
        ADD     AL,30H
        CMP     AL,3AH
        JL      PRINTIT
        ADD     AL,7
PRINTIT:MOV     DL,AL
        MOV     AH,2
        INT     21H
        DEC     CH
        JNZ     ROTATE
	MOV	DL, 48H
	MOV	AH, 2
	INT	21H
        RET
DISPBX  ENDP

DISPAX  PROC    NEAR
        mov bx,N
	xor cx,cx
Q0:	xor dx,dx
	div bx
	or dx,0e30h
	push dx
	inc cx
	cmp ax,0
	jnz Q0
Q1:	pop ax
	int 10h
	loop Q1
	ret
DISPAX  ENDP

ENDL	PROC	
	PUSH	DX
	MOV	DL, 0DH
	MOV	AH, 2
	INT	21H
	MOV	DL, 0AH
	MOV	AH, 2
	INT	21H
	POP	DX
	RET
ENDL	ENDP	

MAIN	PROC	FAR
START:	PUSH	DS
	SUB	AX, AX
	PUSH	AX
	MOV	AX, _DATA
	MOV	DS, AX
	PUSH	B
	PUSH	A
	CALL	AREA
	MOV	AX, S
	CALL	DISPAX		;Ê®½øÖÆ
	CALL	ENDL
	MOV	BX, S
	CALL	DISPBX		;Ê®Áù½øÖÆ
	POP	B
	POP	A
	RETF
MAIN	ENDP
_TEXT	ENDS
	END	START
