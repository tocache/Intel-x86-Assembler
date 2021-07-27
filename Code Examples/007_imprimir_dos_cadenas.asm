;Programa para visualizar dos cadenas de caracteres en pantalla
;usando la función 09H de la INT21H
;Se esta empleando 0AH para nueva linea y ODH para retorno de carro

DATOS SEGMENT
  TIT1 DB "Arquitectura del Computador", 0AH, 0DH, "$"
  TIT2 DB "Universidad Cesar Vallejo de Chimbote$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	MOV AH, 09H
	LEA DX, TIT1
	INT 21H
	LEA DX, TIT2
	INT 21H

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
