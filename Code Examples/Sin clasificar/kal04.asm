CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 07H	;Servicio de ingreso de un caracter x teclado
	INT 21H		;Leo el teclado
	CMP AL, 73H	;Comparo con 's'
	JE SGTE1
	JMP INICIO

SGTE1:	INT 21H
	CMP AL, 6FH	;Comparo con 'o'
	JE SGTE2
	JMP INICIO

SGTE2:	INT 21H
	CMP AL, 6CH	;Comparo con 'l'
	JE FIN		;Si se ha presionado q, finalizar
	JMP INICIO	;Si se ha presionado otro, ir a inicio

FIN:	MOV AH, 4CH	;Fin del programa
	INT 21H

	CODIGO ENDS

END INICIO
