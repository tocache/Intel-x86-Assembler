;Programa con dos opciones, cuando presiones la tecla "q"
;finalize la ejecucion del programa, y cuando presionemos "i"
;imprima "KALUN en pantalla"

CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 07H
	INT 21H
	CMP AL, 'q'
	JE FIN
	CMP AL, 'i'
	JE IMPRI
	JMP INICIO

IMPRI:	MOV AH, 02H
	MOV DL, 13
	INT 21H
	MOV DL, 10
	INT 21H
	MOV DL, 'K'
	INT 21H
	MOV DL, 'A'
	INT 21H
	MOV DL, 'L'
	INT 21H
	MOV DL, 'U'
	INT 21H
	MOV DL, 'N'
	INT 21H
	JMP INICIO

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
