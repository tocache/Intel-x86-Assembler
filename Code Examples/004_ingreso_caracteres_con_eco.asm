;Programa para ingresar cuatro caracteres con eco empleando
;la función 07H de la INT21, luego de ingresar los cuatro
;caracteres finaliza el programa


CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 07H
	INT 21H
	INT 21H
	INT 21H
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
