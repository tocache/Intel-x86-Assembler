CODIGO SEGMENT
ASSUME CS:CODIGO

INICIO:
	MOV DX, 37AH
	MOV AL, 04H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 01H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 02H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 04H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 08H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 16H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 32H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL,1AH
	OUT DX, AL
    CALL RETARDO
MOV DX, 37CH
	MOV AL, 89H
	OUT DX, AL
    CALL RETARDO
MOV DX, 37BH
	MOV AL, 3AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 0AH
	OUT DX, AL
MOV DX, 37CH
	MOV AL, 64H
	OUT DX, AL
MOV DX, 37BH
	MOV AL, 2AH
	OUT DX, AL
    RETARDO:PUSH DX
	PUSH CX
	PUSH BX
	MOV DX, 1000
P1:	MOV CX, 1000
P2:	MOV BX, 200
P3:	DEC BX
	JNZ P3
	DEC CX
	JNZ P2
	DEC DX
	JNZ P1
	POP BX
	POP CX
	POP DX
	RET

;Para finalizar el programa correctamente
	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
