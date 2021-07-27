:Programa para ingresar una cadena y visualizarla al reves
;Hecho por el profe XD

DATOS SEGMENT
	TITU1 DB 0AH, 0DH, "Bienvenidos$"
	TITU2 DB 0AH, 0DH, "Ingresa tu nombre: $"
	NOMBRE DB 30, 0, 30 DUP('*')
	INVER DB 30 DUP('%')
	TITU3 DB 0AH, 0DH, "El nombre ingresado fue:", 0AH, 0DH, "$"
	TITU4 DB 0AH, 0DH, "Gracias por usar el software$"
	TEMP DW 0
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	MOV DX, OFFSET TITU1
	INT 21H
	MOV DX, OFFSET TITU2
	INT 21H

	MOV AH, 0AH
	MOV DX, OFFSET NOMBRE
	INT 21H

	;Obtener numero de caracteres ingresados
	MOV SI, DX
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0

	MOV DX, OFFSET INVER
	MOV DI, DX

	;Para invertir el contenido de la cadena
	MOV CX, BX
LAZO:	MOV AH, BYTE PTR[SI+BX+1]
	PUSH BX
	PUSH AX
	MOV AX, TEMP
	MOV BX, AX
	POP AX
	MOV BYTE PTR[DI+BX], AH
	POP BX
	INC TEMP
	DEC BX
	LOOP LAZO
	
	;Colocar el "$" al final de la nueva cadena
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[DI+BX], "$"


	MOV AH, 09H
	MOV DX, OFFSET TITU3
	INT 21H
	MOV DX, OFFSET INVER
	INT 21H
	MOV DX, OFFSET TITU4
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

CODIGO ENDS
	END INICIO

