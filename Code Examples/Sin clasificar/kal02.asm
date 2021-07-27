CODIGO SEGMENT
  ASSUME CS:CODIGO

INICIO:	MOV AH, 01H	;Servicio de ingreso de un caracter x teclado
	INT 21H		;Leo el teclado
	CMP AL, 71H	;Comparo con 'q'
	JE FIN		;Si se ha presionado q, finalizar
	JMP INICIO	;Si se ha presionado otro, ir a inicio

FIN:	MOV AH, 4CH	;Fin del programa
	INT 21H

	CODIGO ENDS

END INICIO
