;Para visualizar Kalun Lau en caracteres ASCII
;Elaborado por: Ing Kalun Lau
;Fecha: 29/09/2004

DATOS SEGMENT
	LINEA1 DB "|   / |----| |     |    | |\   |   |     |----| |    |", 0AH, 0DH,"$"
	LINEA2 DB "|--/  |    | |     |    | | \  |   |     |    | |    |", 0AH, 0DH,"$"
	LINEA3 DB "|  \  |----| |     |    | |  \ |   |     |----| |    |", 0AH, 0DH,"$"
	LINEA4 DB "|   \ |    | |---- |----| |   \|   |---- |    | |----|$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS
	
INICIO:	MOV AX,DATOS
	MOV DS,AX
	MOV AH,09H
	LEA DX,LINEA1
	INT 21H
	LEA DX,LINEA2
	INT 21H
	LEA DX,LINEA3
	INT 21H
	LEA DX,LINEA4
	INT 21H
FIN:	MOV AH,4CH
	INT 21H

    CODIGO ENDS
END INICIO	