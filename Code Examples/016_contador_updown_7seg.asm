;Programa donde se visualiza en un display de siete segmentos de catodo comun conectado al
;puerto paralelo en direccion 378H la cuenta de un contador.
;-Presionando la tecla "U" se hara el incremento de la cuenta, si la cuenta llega a nueve
;y se presiona U dicha cuenta regresa a cero
;-Presionando la tecla "D" se hara el decremento de la cuenta, si la cuenta llega a cero
;y se presiona D dicha cuenta regresa a nueve
;-Si se presiona "Q" sale del programa.

DATOS SEGMENT
	CUENTAS DB 0
	TABLA DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 67H
;                 0    1    2    3    4    5    6    7    8    9 
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS
	MOV DS, AX
	CALL VISUAL
	MOV AH, 01H
	INT 21H
	CMP AL, 'U'
	JE INCREM
	CMP AL, 'D'
	JE DECREM
	CMP AL, 'Q'
	JE FIN
	JMP INICIO

INCREM:	CMP CUENTAS, 09H
	JE CERO
	INC CUENTAS
	JMP INICIO

CERO:	MOV CUENTAS, 00H
	JMP INICIO

DECREM:	CMP CUENTAS, 00H
	JE NUEVE
	DEC CUENTAS
	JMP INICIO

NUEVE:	MOV CUENTAS, 09H
	JMP INICIO

VISUAL:	LEA DX, TABLA
	MOV SI, DX
	MOV BL, CUENTAS
	MOV BH, 0
	MOV AL, BYTE PTR[SI+BX]
	MOV DX, 378H
	OUT DX, AL
	RET

FIN:	MOV AH, 4CH
	INT 21H

	CODIGO ENDS

END INICIO
