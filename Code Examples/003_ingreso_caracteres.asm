;Programa para ingresar cuatro caracteres sin eco empleando
;la función 01H de la INT21, luego de ingresar los cuatro
;caracteres finaliza el programa

CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 01H
	INT 21H
	INT 21H
	INT 21H
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
