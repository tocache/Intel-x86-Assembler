DATOS SEGMENT
	TABLA DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 67H, 77H, 7CH, 39H, 5EH, 79H, 71H
;                 0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV CL, 0

INIC2:	MOV AH, 01H
	INT 21H
	CMP AL, 'I'
	JE INCRE
	CMP AL, 'D'
	JE DECRE
	CMP AL, 'Q'
	JE FIN
	JMP INIC2

INCRE:	CMP CL, 15
	JE MAXIM
	INC CL
MAXIM:	CALL VISUAL
	JMP INIC2

DECRE:	CMP CL, 0
	JE MINIM
	DEC CL
MINIM:	CALL VISUAL
	JMP INIC2

VISUAL:	MOV DX, OFFSET TABLA
	MOV SI, DX
	MOV BL, CL
	MOV BH, 0
	MOV AL, BYTE PTR[SI+BX]
	MOV DX, 378H
	OUT DX, AL
	RET

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO