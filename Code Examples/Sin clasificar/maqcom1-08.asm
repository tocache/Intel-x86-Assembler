DATOS SEGMENT
DATOS ENDS

CODIGO SEGMENT
   ASSUME CS:CODIGO, DS:DATOS

INICIO: MOV AH, 02H
	MOV DL, 30H
OTRO1:	INT 21H
	CMP DL, 39H
	JE IGUAL
	ADD DL, 1
	JMP OTRO1
IGUAL	MOV AH, 4CH
	INT 21

CODIGO ENDS

END INICIO
