DATOS SEGMENT
	SALUDO DB "Solucionario del examen de laboratorio de orgarc0$"
	MENU DB 10, 13, "Elija opcion:", 10, 13, "a)Nombre completo", 10, 13, "b)Titileo rapido del led 15 veces", 10, 13, "c)Titileo lento del led 5 veces", 10, 13, "d)Fin del programa",  10, 13, "$"
	TITI1 DB 10, 13, "LED titilando rapido 15 veces$"
	TITI2 DB 10, 13, "LED titilando lento 5 veces$"
	TERMINO DB 10, 13, "Fin de la opcion$"
	ERRADO DB 10, 13, "Tecla presionada es erronea, intente de nuevo$"
	FIN DB 10, 13, "Gracias por usar el programa$"
	NOMBRE DB 10, 13, "Kalun Jose Lau Gan$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS: DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, SALUDO
	INT 21H
MENUS:	LEA DX, MENU
	INT 21H
	MOV AH, 01H
	INT 21H
	CMP AL, 'a'
	JE PRIM
	CMP AL, 'b'
	JE SEGU
	CMP AL, 'c'
	JE TRIC
	CMP AL, 'd'
	JE CUAR
	MOV AH, 09H
	LEA DX, ERRADO
	INT 21H
	JMP MENUS

PRIM:	MOV AH, 09H
	LEA DX, NOMBRE
	INT 21H
	CALL RETLEN
	CALL RETLEN
	CALL RETLEN
	CALL RETLEN
	LEA DX, TERMINO
	INT 21H
	JMP MENUS

SEGU:	MOV AH, 09H
	LEA DX, TITI1
	INT 21H
	MOV CX, 15
LAZO1:	MOV DX, 378H
	MOV AL, 01H
	OUT DX, AL
	CALL RETRAP
	MOV AL, 00H
	OUT DX, AL
	CALL RETRAP
	LOOP LAZO1
	MOV AH, 09H
	LEA DX, TERMINO
	INT 21H
	JMP MENUS
	
TRIC:	MOV AH, 09H
	LEA DX, TITI2
	INT 21H
	MOV CX, 5
LAZO2:	MOV DX, 378H
	MOV AL, 01H
	OUT DX, AL
	CALL RETLEN
	MOV AL, 00H
	OUT DX, AL
	CALL RETLEN
	LOOP LAZO2
	MOV AH, 09H
	LEA DX, TERMINO
	INT 21H
	JMP MENUS

CUAR:	MOV AH, 09H
	LEA DX, FIN
	INT 21H
	MOV AH, 4CH
	INT 21H

RETRAP:	PUSH AX
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

RETLEN:	PUSH AX
	PUSH BX
	PUSH CX
	MOV AX, 1000
P6:	MOV BX, 1000
P5:	MOV CX, 150
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
