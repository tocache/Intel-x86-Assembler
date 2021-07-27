DATOS SEGMENT
	TIT1 DB "Programa que controla un LED conectado al puerto paralelo", 0AH, 0DH, "$"
	TIT2 DB "Elija opcion:", 0AH, 0DH, "$"
	TIT3 DB "(1) Parpadeo rapido", 0AH, 0DH, "$"
	TIT4 DB "(2) Parpadeo lento", 0AH, 0DH, "$"
	TIT5 DB "(3) Encender LED", 0AH, 0DH, "$"
	TIT6 DB "(4) Apagar LED", 0AH, 0DH, "$"
	TIT7 DB "(5) Salir del programa", 0AH, 0DH, "$"
	TIT8 DB "Tecla presionada es incorrecta, intente de nuevo", 0AH, 0DH, "$"
	TIT9 DB "Gracias por usar el programa, hecho por Kalun Lau", 0AH, 0DH, "$"
	TITA DB "LED parpadeando, pulse la tecla E para regresar al menu", 0AH, 0DH, "$"
	TITB DB "LED encendido!", 0AH, 0DH, "$"
	TITC DB "LED apagado!", 0AH, 0DH, "$"

DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO: MOV AX, DATOS
	MOV DS, AX

MENU:	MOV AH, 09H		;Visualizacion del menu
	LEA DX, TIT1
	INT 21H
	LEA DX, TIT2
	INT 21H
	LEA DX, TIT3
	INT 21H
	LEA DX, TIT4
	INT 21H
	LEA DX, TIT5
	INT 21H
	LEA DX, TIT6
	INT 21H
	LEA DX, TIT7
	INT 21H

	MOV AH, 07H
	INT 21H
	CMP AL, '1'	;Luego de INT16H, se almacena en AL el caracter ASCII
	JE UNO
	CMP AL, '2'
	JE DOS
	CMP AL, '3'
	JE TRES
	CMP AL, '4'
	JE CUATRO
	CMP AL, '5'
	JE FIN
	MOV AH, 09H
	LEA DX, TIT8
	INT 21H
	JMP MENU


UNO:	MOV AH, 09H
	LEA DX, TITA
	INT 21H
TMP1:	MOV DX, 378H
	MOV AL, 00H
	OUT DX, AL
	CALL RETARD1
	MOV AL, 01H
	OUT DX, AL
	CALL RETARD1
	CALL MTECLA
	JMP TMP1

SALTO:	JMP MENU

DOS:	MOV AH, 09H
	LEA DX, TITA
	INT 21H
TMP2:	MOV DX, 378H
	MOV AL, 00H
	OUT DX, AL
	CALL RETARD2
	MOV AL, 01H
	OUT DX, AL
	CALL RETARD2
	CALL MTECLA
	JMP TMP2

MTECLA:	MOV AH, 01H	;Función para ver si se presionó una tecla (chequea buffer)
	INT 16H
	JNZ TECLAOK	;Cuando se presionó una tecla, saltar a rutina TECLAOK
	RET

TECLAOK:MOV AH, 00H	;Para leer la tecla presionada
	INT 16H
	CMP AL, 'E'	;Luego de INT16H, se almacena en AL el caracter ASCII
	JE SALTO
	RET

TRES:	MOV AH, 09H
	LEA DX, TITB
	INT 21H
	MOV DX, 378H
	MOV AL, 01H
	OUT DX, AL
	JMP MENU

CUATRO:	MOV AH, 09H
	LEA DX, TITC
	INT 21H
	MOV DX, 378H
	MOV AL, 00H
	OUT DX, AL
	JMP MENU


FIN:	MOV AH, 09H
	LEA DX, TIT9
	INT 21H
	MOV AH, 4CH
	INT 21H

RETARD1:PUSH AX
	PUSH BX
	PUSH CX
	MOV AX, 1000
P3:	MOV BX, 1000
P2:	MOV CX, 100
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

RETARD2:PUSH AX
	PUSH BX
	PUSH CX
	MOV AX, 1000
P6:	MOV BX, 1000
P5:	MOV CX, 300
P4:	DEC CX
	JNZ P4
	DEC BX
	JNZ P5
	DEC AX
	JNZ P6
	POP CX
	POP BX
	POP AX
	RET


	CODIGO ENDS

END INICIO
