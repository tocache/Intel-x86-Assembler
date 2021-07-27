;Programa que posee un menú con opciones para ingresar nombre y DNI
;Se está empleando la función 09H de la INT21H para imprimir las
;cadenas de caracteres en la pantalla y la función 0AH de la INT21
;para leer del teclado una cadena de caracteres

DATOS SEGMENT
  TIT1 DB 0AH, 0DH, "Bienvenidos al Programa", 0AH, 0DH, "$"
  TIT2 DB "Ingrese opcion:", 0AH, 0DH, "$"
  TIT3 DB "(1) Ingresar nombre", 0AH, 0DH, "$"
  TIT4 DB "(2) Ingresar DNI", 0AH, 0DH, "$"
  TIT5 DB "(3) Visualizar informacion ingresada", 0AH, 0DH, "$"
  TIT6 DB "(4) Salir del Programa", 0AH, 0DH, "$"
  TIT7 DB "Opción ingresada es incorrecta, intente de nuevo", 0AH, 0DH, "$"
  TIT8 DB "Gracias por usar el programa, hecho por Kalun Lau", 0AH, 0DH, "$"
  TIT9 DB 0AH, 0DH, "La informacion ingresada fué:", 0AH, 0DH, "$"
  TITA DB "Ingrese informacion:", 0AH, 0DH, "$"
  NOMB DB 50, 0, 50 DUP('*')
  DNI  DB 9, 0, 9 DUP('*')
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
	LEA DX, TIT6
	INT 21H
	MOV AH, 01H
	INT 21H
	CMP AL, '1'
	JE UNO
	CMP AL, '2'
	JE DOS
	CMP AL, '3'
	JE TRES
	CMP AL, '4'
	JE CUATRO
	MOV AH, 09H
	LEA DX, TIT7
	INT 21H
	JMP INICIO

UNO:	MOV AH, 09H
	LEA DX, TITA
	INT 21H
	MOV AH, 0AH
	LEA DX, NOMB
	INT 21H
	MOV SI, DX
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[SI+BX+2], "$"
	JMP INICIO

DOS:	MOV AH, 09H
	LEA DX, TITA
	INT 21H
	MOV AH, 0AH
	LEA DX, DNI
	INT 21H
	MOV SI, DX
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[SI+BX+2], "$"
	JMP INICIO

TRES:	MOV AH, 09H
	LEA DX, TIT9
	INT 21H
	LEA DX, NOMB
	ADD DX, 2
	INT 21H
	MOV AH, 02H
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H
	MOV AH, 09H
	LEA DX, DNI
	ADD DX, 2
	INT 21H
	JMP INICIO

CUATRO:	MOV AH, 09H
	LEA DX, TIT8
	INT 21H
	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO

