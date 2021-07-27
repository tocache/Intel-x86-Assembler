;Programa que me imprime diez veces una cadena de caracteres, usando
;un bucle repetitivo basado en el registro CX y con la instrucción LOOP

DATOS SEGMENT
  TITULO DB "HOLA YA TENEMOS KARNEEEE", 0AH, 0DH, "$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX

	MOV CX, 10	;Repetir 10 veces la impresion
LAZO:	MOV AH, 09H
	LEA DX, TITULO
	INT 21H
	LOOP LAZO

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
