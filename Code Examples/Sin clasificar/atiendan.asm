DATOS SEGMENT
	TIT1 DB "Ingresa tu nombre:", 10 , 13, "$"
	TIT2 DB 10, 13, "El nombre ingresado fue:", 10, 13, "$"
	CAD DB 18, 0, 18 DUP('*')
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS
INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, TIT1
	INT 21H
	MOV AH, 0AH
	LEA DX, CAD
	INT 21H		;El servicio termina con ENTER
	MOV SI, DX
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[BX+SI+2], "$"
	MOV AH, 09H
	LEA DX, TIT2
	INT 21H
	LEA DX, CAD
	ADD DX, 2
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
