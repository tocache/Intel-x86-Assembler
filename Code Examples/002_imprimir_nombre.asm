;Programa para visualizar un nombre en pantalla usando
;la función 02H de la INT21H

CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 02H   ;Funcion para imprimir un caracter en pantalla
	MOV DL, 'M'         ;Carga de caracter M en DL
	INT 21H             ;Ejecicion de la funcion
	MOV DL, 'A'
	INT 21H
	MOV DL, 'R'
	INT 21H
	MOV DL, 'I'
	INT 21H
	MOV DL, 'A'
	INT 21H

FIN:	MOV AH, 4CH     ;Funcion para pasar el control al SO
	INT 21H             ;Ejecucion de la funcion

	CODIGO ENDS

END INICIO
