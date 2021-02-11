DDATA		SEGMENT
X		DW  	55, 112, 37, 82
Y		DW  	4 DUP (?)
DATA		ENDS
CODE		SEGMENT
ASSUME	CS: CODE, DS: DATA
START:MOV  AX, DATA
	MOV	DS, AX
	MOV	DI, 2		;第2个元素在数组内的位移
	MOV	AX, X[DI]	;取出X数组第2个元素
	MOV	Y[DI], AX	;送入Y数组第2个元素中
	MOV	AX, X[DI+4]	;取出X数组第四个元素
	MOV	Y[DI+4], AX	;送入Y数组第四个元素中
        MOV     X[DI], 0        ;X数组第二个元素清零
        MOV     X[DI+4], 0      ;X数组第四个元素清零
	MOV	AX, 4C00H
	INT  	21H
CODE	ENDS
	END	START