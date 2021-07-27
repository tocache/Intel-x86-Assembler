;Programa para visualizar UCV en letras grandes en la pantalla
;usando la función 09H de la INT21H (impresión de cadena de caracteres)

DATOS SEGMENT
  TIT1 DB "O     O   OOOOOO  O        O", 0AH, 0DH, "$"
  TIT2 DB "O     O  O         O      O ", 0AH, 0DH, "$"
  TIT3 DB "O     O  O          O    O  ", 0AH, 0DH, "$"
  TIT4 DB "O     O  O           O  O   ", 0AH, 0DH, "$"
  TIT5 DB " OOOOO    OOOOOO      OO    ", 0AH, 0DH, "$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
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

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
