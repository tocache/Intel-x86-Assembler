CODIGO SEGMENT
ASSUME CS:CODIGO

INICIO:
	MOV DX, 378H
	MOV AL, 01H
	OUT DX, AL
;Para finalizar el programa correctamente
	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
