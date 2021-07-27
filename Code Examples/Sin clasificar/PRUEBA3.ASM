DATOS SEGMENT
	EXAMEN DB "Examen 3 de laboratorio de Org. Arq. de PC$"
	BIENVE DB 10,13, "Bienvenidos, elija opcion:$"
	OPT1 DB 10, 13, "a) Ingresa Nombres$"
	OPT2 DB 10, 13, "b) Ingresa Apellidos$"
	OPT3 DB 10, 13, "c) Visualiza nombre completo$"
	OPT4 DB 10, 13, "d) Titileo LED 45 veces$"
	OPT5 DB 10, 13, "e) Fin de la aplicacion", 10, 13, "$"
	INNOMBR DB 10, 13, "Ingresa tus nombres y pulsa luego Enter", 10, 13, "$"
	INAPELL DB 10, 13, "Ingresa tus apellidos y pulsa luego Enter", 10, 13, "$"
	TITFIN DB 10, 13, "Gracias por usar el programa que fue creado por: $"
	TITNOM DB 10, 13, "El nombre ingresado fue: $"
	NOMBRE DB 20, 0, 20 DUP('*'), "$"
	APELLI DB 20, 0, 20 DUP('*'), "$"
	ESPAC DB " $"
	ERRA DB 10, 13, "La opcion ingresada es incorrecta, intente de nuevo$"
	TITIL DB 10, 13, "LED titilando$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO: MOV AX, DATOS
	MOV DS, AX
	MOV AH,09H
	LEA DX, EXAMEN
	INT 21H
MENUS:	MOV AH, 09H		;Visualizacion del menu
	LEA DX, BIENVE
	INT 21H
	LEA DX, OPT1
	INT 21H
	LEA DX, OPT2
	INT 21H
	LEA DX, OPT3
	INT 21H
	LEA DX, OPT4
	INT 21H
	LEA DX, OPT5
	INT 21H
	MOV AH, 01H
	INT 21H
	CMP AL, 'a'
	JE INNOMB
	CMP AL, 'b'
	JE INAPEL
	CMP AL, 'c'
	JE VISNOM
	CMP AL, 'd'
	JE TITLED
	CMP AL, 'e'
	JE FINAL
	MOV AH, 09H
	LEA DX, ERRA
	INT 21H
	CALL RETAR
	JMP MENUS

INNOMB:	MOV AH, 09H			;Ingreso de nombres
	LEA DX, INNOMBR
	INT 21H
	MOV AH, 0AH
	LEA DX, NOMBRE
	INT 21H
	MOV SI, DX			;Cambio del Enter por el $
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[BX+SI+2], "$"
	JMP MENUS

INAPEL:	MOV AH, 09H			;Ingreso de apellidos
	LEA DX, INAPELL
	INT 21H
	MOV AH, 0AH
	LEA DX, APELLI
	INT 21H
	MOV SI, DX			;Cambio del Enter por el $
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[BX+SI+2], "$"
	JMP MENUS

TITLED: JMP TITLED1	;No alcanza el salto (muy largo el programa)
FINAL:	JMP FINAL1	;No alcanza el salto (muy largo el programa)

VISNOM:	MOV AH, 09H			;Visualizacion del nombre completo
	LEA DX, TITNOM
	INT 21H
	LEA DX, NOMBRE
	ADD DX, 2
	INT 21H
	LEA DX, ESPAC
	INT 21H
	LEA DX, APELLI
	ADD DX, 2
	INT 21H
	MOV AH, 02H
	MOV DL, 10
	INT 21H
	MOV DL, 13
	INT 21H
	CALL RETAR
	CALL RETAR
	CALL RETAR
	CALL RETAR
	JMP MENUS

FINAL1:	MOV AH, 09H				;Fin de la aplicacion
	LEA DX, TITFIN
	INT 21H
	LEA DX, NOMBRE
	ADD DX, 2
	INT 21H
	LEA DX, ESPAC
	INT 21H
	LEA DX, APELLI
	ADD DX, 2
	INT 21H
	MOV AH, 4CH
	INT 21H

TITLED1:MOV AH, 09H				;Titileo del LED
	LEA DX, TITIL
	INT 21H
	MOV DX, 378H
	MOV CX, 45
LAZO:	MOV AL, 01H
	OUT DX, AL
	CALL RETAR
	MOV AL, 00H
	OUT DX, AL
	CALL RETAR
	LOOP LAZO
	JMP MENUS

RETAR:	PUSH AX					;Subrutina de retardo
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

	CODIGO ENDS

END INICIO
