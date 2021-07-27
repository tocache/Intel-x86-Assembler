;Programa para comparar dos números de dos digitos (00-99)
;Hecho por el profe XD

DATOS SEGMENT
	NUM1 DB 3, 0, 3 DUP('*')
	NUM2 DB 3, 0, 3 DUP('*')
	CAD1 DB 0AH, 0DH, "Bienvenidos al programa que compara numeros$"
	CAD2 DB 0AH, 0DH, "Ingrese el primer numero:$"
	CAD3 DB 0AH, 0DH, "Ingrese el segundo numero:$"
	CAD4 DB " es mayor que $"
	CAD5 DB " es igual que $"
	CAD6 DB " es menor que $"
	CAD7 DB 0AH, 0DH, "Desea seguir comparando? (s o n)$"
	CAD8 DB 0AH, 0DH, "Gracias por usar el programa$"
	ENTE DB 0AH, 0DH, "$"
	ERRA DB 0AH, 0DH, "La opcion es erronea!$"
	TMP1 DB 0
	TMP2 DB 0
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, CAD1	;Impresión del mensaje de bienvenida
	INT 21H
OTRA1:	MOV AH, 09H
	LEA DX, CAD2
	INT 21H
	LEA DX, NUM1	;Lectura del primer número
	MOV AH, 0AH
	INT 21H
	MOV AH, 09H
	LEA DX, CAD3
	INT 21H
	MOV AH, 0AH
	LEA DX, NUM2	;Lectura del segundo número
	INT 21H

	;Reemplazo del Enter por el Dolar en las dos cadenas
	LEA DX, NUM1
	MOV SI, DX
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[SI+BX+2], "$"

	LEA DX, NUM2
	MOV SI, DX
	MOV BL, BYTE PTR[SI+1]
	MOV BH, 0
	MOV BYTE PTR[SI+BX+2], "$"

	;Pasar el primer numero ingresado a TMP1
	LEA DX, NUM1
	MOV SI, DX
	MOV AL, BYTE PTR[SI+2]	;Captura de la decena del primer número
	SUB AL, 48
	MOV CL, 10
	MUL CL
	MOV BL, BYTE PTR[SI+3]	;Captura de la unidad del primer número
	SUB BL, 48
	ADD AL, BL
	MOV TMP1, AL

	;Pasar el segundo numero ingresado a TMP2
	LEA DX, NUM2
	MOV SI, DX
	MOV AL, BYTE PTR[SI+2]	;Captura de la decena del primer número
	SUB AL, 48
	MOV CL, 10
	MUL CL
	MOV BL, BYTE PTR[SI+3]	;Captura de la unidad del primer número
	SUB BL, 48
	ADD AL, BL
	MOV TMP2, AL

	;Comparación de TMP1 y TMP2
	MOV AH, TMP1
	MOV AL, TMP2
	CMP AH, AL
	JA MAYOR
	JE IGUAL
	JB MENOR

MAYOR:	MOV AH, 09H
	LEA DX, ENTE
	INT 21H
	LEA DX, NUM1
	ADD DX, 2
	INT 21H
	LEA DX, CAD4
	INT 21H
	LEA DX, NUM2
	ADD DX, 2
	INT 21H
	JMP PREG
	
OTRA:	JMP OTRA1

IGUAL:	MOV AH, 09H
	LEA DX, ENTE
	INT 21H
	LEA DX, NUM1
	ADD DX, 2
	INT 21H
	LEA DX, CAD5
	INT 21H
	LEA DX, NUM2
	ADD DX, 2
	INT 21H
	JMP PREG

MENOR:	MOV AH, 09H
	LEA DX, ENTE
	INT 21H
	LEA DX, NUM1
	ADD DX, 2
	INT 21H
	LEA DX, CAD6
	INT 21H
	LEA DX, NUM2
	ADD DX, 2
	INT 21H
	JMP PREG

PREG:	MOV AH, 09H
	LEA DX, CAD7
	INT 21H
	LEA DX, ENTE
	INT 21H
	MOV AH, 01H
	INT 21H
	CMP AL, 73H
	JE OTRA
	CMP AL, 6EH
	JE FIN
	MOV AH, 09H
	LEA DX, ERRA
	INT 21H
	JMP PREG
	
FIN:	MOV AH, 09H
	LEA DX, CAD8
	INT 21H
	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
