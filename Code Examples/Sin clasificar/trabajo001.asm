;Programa elaborado por:
;Ing. Kalun José Lau Gan
;03/12/2004
;No ha sido probado, sujeto a errores en la etapa de compilación

DATOS SEGMENT
	TITULO DB "INGRESE CARACTER:$"
	MSB DB ?
	LSB DB ?
	SUMA DB ?
	UNIDAD DB ?
	DECENA DB ?
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS

INICIO:	MOV AX, DATOS		;impresion de cadena de caracteres
	MOV DS, AX
	MOV AH, 09H
	MOV DX, OFFSET TITULO
	INT 21H

	MOV AH, 01H		;ingreso de caracter a evaluar
	INT 21H
	MOV MSB, AL		;obtenemos el byte mas significativo del caracter ingresado
	SHR MSB, 4
	MOV LSB, AL		;obtenemos el byte menos significativo del caracter ingresado
	AND LSB, 0FH

	MOV SUMA, MSB
	ADD SUMA, LSB		;obtenemos la suma de ambos bytes vistos anteiormente

	MOV AH, 0		;rutina para impresion en pantalla de la suma
	MOV AL, SUMA		
	DIV 10			;dividimos entre 10 para obtener cifra de decena de la suma
	MOV DECENA, AL
	ADD DECENA, 30H		;sumamos 30h para que se displaya numeros en pantalla

	MUL AL, 10		;calculo para la obtencion de las unidades de la suma
	SUB SUMA, AL
	MOV UNIDAD, SUMA	
	ADD UNIDAD, 30H

	ADD LSB, 30H		;sumamos 30h para que se displaya numeros en pantalla
	ADD MSB, 30H		;sumamos 30h para que se displaya numeros en pantalla

	MOV AH, 02H		;Impresión de caracteres ASCII usando servicio 02h
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H	
	MOV DL, MSB		;imprime el MSB del caracter ingresado
	INT 21H	
	MOV DL, '+'		;imprime el simbolo "+"
	INT 21H
	MOV DL LSB		;imprime el LSB del caracter ingresado
	INT 21H
	MOV DL, '='		;imprime el simbolo "="
	INT 21H
	MOV DL, DECENA		;imprime la decena de la suma
	INT 21H
	MOV DL, UNIDAD		;imprime la unidad de la suma
	INT 21H

FIN:	MOV AH, 4CH		;fin del programa
	INT 21H

	CODIGO ENDS

END INICIO
	

	