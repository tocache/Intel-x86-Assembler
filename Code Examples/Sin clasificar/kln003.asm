;Programa imprimir Ingrese Password y se ingrese seis pulsaciones
;de teclado a la vez que imprima en pantalla un asterisco
;Autor: Ing. Kalun José Lau Gan
;Fecha: 25/04/2004

DATOS SEGMENT
	TITULO DB "Ingrese Password:", 0AH, 0DH, "$"
DATOS ENDS

CODIGO SEGMENT
    ASSUME CS:CODIGO, DS:DATOS

INICIO:
    MOV AX, DATOS	;Apuntar al segmento de datos
    MOV DS, AX
    LEA DX, TITULO
    MOV AH, 9H		;Visualización en pantalla
    INT 21H

    MOV CX, 6
LAZO:
    MOV AH, 07H
    INT 21H
    MOV AH, 02H
    MOV DL, '*'
    INT 21H
    LOOP LAZO

    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    MOV CX, 20
LAZO2:
    MOV DL, 'Y'
    INT 21H
    MOV DL, 'E'
    INT 21H
    MOV DL, 'S'
    INT 21H
    CALL RETARDO
    LOOP LAZO2

FIN:
    MOV AH, 4CH
    INT 21H

RETARDO:
        PUSH DX
        PUSH CX
        PUSH BX
        MOV DX,1000
P1:	MOV CX,1000
P2:     MOV BX,100
P3:     DEC BX
        JNZ P3
        DEC CX
        JNZ P2
        DEC DX
        JNZ P1
        POP BX
        POP CX
        POP DX
    RET

CODIGO ENDS

END INICIO
END LAZO
END LAZO2
END FIN
END RETARDO
END P1
END P2
END P3

