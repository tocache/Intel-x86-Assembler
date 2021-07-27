DATOS SEGMENT     ;Segmento de datos (vacio)
DATOS ENDS

CODIGO SEGMENT    ;Segmento de codigo (tu programa)
  ASSUME CS:CODIGO, DS:DATOS    ;Para que el ensamblador oriente el segmento CODIGO hacia CS y DATOS hacia DS

INICIO:           ;Etiqueta
	NOP
	MOV AH, 4CH   ;Funcion para retornar al sistema operativo
	INT 21H       ;Ejecucion de la funcion anterior

CODIGO ENDS

END INICIO
