;Displayar en pantalla: "Ingrese password", e ingrese
;seis pulsaciones de teclado, cada pulsaciòn debe mostrar
;en pantalla un asterisco (*)
;Autor: Ing Kalun Lau
;Fecha 04/05/2004

DATOS SEGMENT
	TITULO DB "Ingrese Password:", 0AH, 0DH, "$"
DATOS ENDS

CODIGO SEGMENT
  ASSUME CS:CODIGO, DS:DATOS
INICIO:
	MOV AX, DATOS
	MOV DS, AX
	LEA DX, TITULO
	MOV AH, 09H
	INT 21H

	MOV CX, 6
LAZO:
	MOV AH, 07H
	INT 21H
	MOV AH, 02H
	MOV DL, '*'
	INT 21H
	LOOP LAZO

	MOV AH, 4CH
	INT 21H

CODIGO ENDS

END INICIO
END LAZO
