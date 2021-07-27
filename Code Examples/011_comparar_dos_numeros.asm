;Programa que me permite ingresar dos números de 0 al 9
;y que el programa identifique si uno es menor, igual o mayor
;que el otro.

DATOS SEGMENT
  TIT1 DB "Bienvenidos, este programa evalua dos numeros", 0AH, 0DH, "$"
  TIT2 DB "y muestra si es mayor, menor o igual", 0AH, 0DH, "$"
  TIT3 DB "Ingrese primer numero:", 0AH, 0DH, "$"
  TIT4 DB 0AH, 0DH, "Ingrese segundo numero:", 0AH, 0DH, "$"
  TIT5 DB 0AH, 0DH, "El numero $"
  TIT6 DB " es mayor que $"
  TIT7 DB " es menor que $"
  TIT8 DB " es igual a $"
  TIT9 DB 0AH, 0DH, "Gracias por usar el programa, hecho por Kalun$"
  NUM1 DB 0
  NUM2 DB 0
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, TIT1	;Toy imprimiendo las tres primeras
	INT 21H		;cadenas en pantalla!
	LEA DX, TIT2
	INT 21H
	LEA DX, TIT3
	INT 21H
	MOV AH, 01H
	INT 21H
	MOV NUM1, AL
	MOV AH, 09H
	LEA DX, TIT4
	INT 21H
	MOV AH, 01H
	INT 21H
	MOV NUM2, AL
	MOV AH, 09H
	LEA DX, TIT5
	INT 21H
	MOV BH, NUM1	;Cargamos NUM1 en BH
	MOV BL, NUM2	;Cargamos NUM2 en BL
	CMP BH, BL
	JA MAYOR
	JE IGUAL
	JB MENOR

MAYOR:  MOV AH, 02H
	MOV DL, NUM1
	INT 21H
	MOV AH, 09H
	LEA DX, TIT6
	INT 21H
	MOV AH, 02H
	MOV DL, NUM2
	INT 21H
	JMP FINAL

MENOR:  MOV AH, 02H
	MOV DL, NUM1
	INT 21H
	MOV AH, 09H
	LEA DX, TIT7
	INT 21H
	MOV AH, 02H
	MOV DL, NUM2
	INT 21H
	JMP FINAL

IGUAL:  MOV AH, 02H
	MOV DL, NUM1
	INT 21H
	MOV AH, 09H
	LEA DX, TIT8
	INT 21H
	MOV AH, 02H
	MOV DL, NUM2
	INT 21H
	JMP FINAL

FINAL:	MOV AH, 09H
	LEA DX, TIT9
	INT 21H
	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
	
