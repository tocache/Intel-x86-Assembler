CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO: MOV DX, 378H
	MOV AL, 81H
	OUT DX, AL
	CALL PAUSA
	MOV AL, 42H
	OUT DX, AL
	CALL PAUSA
	MOV AL, 24H
	OUT DX, AL
	CALL PAUSA
	MOV AL, 18H
	OUT DX, AL
	CALL PAUSA
	MOV AL, 24H
	OUT DX, AL
	CALL PAUSA
	MOV AL, 42H
	OUT DX, AL
	CALL PAUSA
	JMP INICIO

PAUSA:	PUSH AX
	PUSH BX
	PUSH CX
	MOV AX, 1000
P3:	MOV BX, 1000
P2:	MOV CX, 50
P1:	DEC CX
	JNZ P1
	DEC BX
	JNZ P2
	DEC AX
	JNZ P3
	POP CX
	POP BX
	POP AX
	RET


	CODIGO ENDS

END INICIO

