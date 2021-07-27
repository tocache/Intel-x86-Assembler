;Otro ejercicio: imprimir una cadena
;pero espaciado (un espacio)
;Para hacer esto, empleamos la funcion 02H para
;imprimir caracter por caracter, y por cada
;caracter impreso, imprimir un espacio

DATOS SEGMENT
  CADE1 DB "Angie Chauca", 0AH, 0DH, "$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, CADE1
	INT 21H
	MOV SI, DX
	MOV BX, 0
BUCLE:	MOV CL, BYTE PTR[SI+BX]
	CMP CL, '$'
	JE FINAL
	MOV AH, 02H
	MOV DL, CL
	INT 21H
	MOV DL, ' '
	INT 21H
	INC BX
	JMP BUCLE

FINAL:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
