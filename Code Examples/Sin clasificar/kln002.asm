;Programa para visualizar la hora en pantalla
;Autor: Ing. Kalun José Lau Gan
;Fecha: 25/04/2004

DATOS SEGMENT
    ETIQUETA DB "Hora: $"
    HRDEC DB ?
    HRUNI DB ?
    MNDEC DB ?
    MNUNI DB ?
    SCDEC DB ?
    SCUNI DB ?
DATOS ENDS

CODIGO SEGMENT
    ASSUME CS:CODIGO, DS:DATOS

INICIO:
    MOV AX, DATOS	;Apuntar al segmento de datos
    MOV DS, AX
    LEA DX, ETIQUETA
    MOV AH, 9H		;Visualización en pantalla
    INT 21H

    MOV AH, 02H		;Obtención de la hora
    INT 1AH

    MOV HRDEC, CH	;Asignación BCD Horas
    MOV HRUNI, CH
    MOV MNDEC, CL	;Asignación BCD Minutos
    MOV MNUNI, CL
    MOV SCDEC, DH	;Asignación BCD Segundos
    MOV SCUNI, DH

    MOV CL, 4		;Conversión
    SHR HRDEC, CL
    AND HRUNI, 0FH

    SHR MNDEC, CL
    AND MNUNI, 0FH

    SHR SCDEC, CL
    AND SCUNI, 0FH

    MOV AH, 02H		;Impresión de caracter en pantalla

    MOV DL, HRDEC
    ADD DL, 30H
    INT 21H

    MOV DL, HRUNI
    ADD DL, 30H
    INT 21H

    MOV DL, 3AH
    INT 21H

    MOV DL, MNDEC
    ADD DL, 30H
    INT 21H

    MOV DL, MNUNI
    ADD DL, 30H
    INT 21H

    MOV DL, 3AH
    INT 21H

    MOV DL, SCDEC
    ADD DL, 30H
    INT 21H

    MOV DL, SCUNI
    ADD DL, 30H
    INT 21H

FIN:
    MOV AH, 4CH
    INT 21H

CODIGO ENDS

END INICIO

