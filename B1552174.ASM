_DATA	SEGMENT 'DATA'
A	DB	40H
B	DB	30H
M	DB	20H
D	DB	10H
S	DB	?
_DATA	ENDS
_TEXT	SEGMENT 'CODE'
	ASSUME CS: _TEXT, DS: _DATA
Start:	MOV	AX,_DATA
	MOV	DS,AX
	SUB	AX,AX
	MOV	AL,A
	IMUL 	B
	MOV 	BL,M
	ADD	BL,D
	IDIV	BL
	MOV	S,AL
	SUB	AL,AL
	MOV	AL,A
	SUB	AL,B
	MOV	BL,5
	IMUL	BL
	SUB	BL,BL
	MOV	BL,2
	IDIV	BL
	ADD	S,AL
	SUB	AL,AL
	SUB	BL,BL
	MOV	AL,M
	CBW
	IDIV	D
	ADD	S,AL
_TEXT	ENDS
	END	START
