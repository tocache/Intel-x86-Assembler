;Programa para imprimir una cadena de caracteres en la pantalla
;empleando la función 09H de la INT21H
;El simbolo $ en la cadena indica el final de ella

DATOS SEGMENT
  TIT1 DB "Queremos break$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, TIT1
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
