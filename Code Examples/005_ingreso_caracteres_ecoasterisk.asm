;Programa para ingresar cuatro caracteres por teclado, cada
;vez que se ingresa un caracter, se visualizará el caracter
;asterisco en pantalla.

CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 07H
	INT 21H
	MOV AH, 02H
	MOV DL, '*'
	INT 21H
	MOV AH, 07H
	INT 21H
	MOV AH, 02H
	MOV DL, '*'
	INT 21H
	MOV AH, 07H
	INT 21H
	MOV AH, 02H
	MOV DL, '*'
	INT 21H
	MOV AH, 07H
	INT 21H
	MOV AH, 02H
	MOV DL, '*'
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
