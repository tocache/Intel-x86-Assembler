DATOS SEGMENT
       TIT1 DB "            ------------        "
       TIT2 DB "            |          |        "
       TIT3 DB "            ---\    /---        "
       TIT4 DB "               |    |           "
       TIT5 DB "--------------/      \--------\ "
       TIT6 DB "|                              |"
       TIT7 DB "-------------------------\     |"
       TIT8 DB "                         |     |"
       TIT9 DB "                         -------"
       GOTA DB "*"
       ABC1 DB "----------------------"
       ABC2 DB "\                    /"
       ABC3 DB " \                  / "
       ABC4 DB "  \                /  "
       ABC5 DB "   ----------------   "
       CONT DB ?
DATOS ENDS

CODIGO SEGMENT
 ASSUME CS:CODIGO, DS:DATOS

INICIO:
       MOV AX, DATOS
       MOV ES, AX
       CALL DIBUJOS
       MOV CONT,0
GOTERO:
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 00H
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 16
       MOV DL, 33
       INT 10H
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 0FH
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 11
       MOV DL, 33
       INT 10H
       CALL RETARDO

       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 00H
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 11
       MOV DL, 33
       INT 10H
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 0FH
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 12
       MOV DL, 33
       INT 10H
       CALL RETARDO

       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 00H
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 12
       MOV DL, 33
       INT 10H
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 0FH
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 13
       MOV DL, 33
       INT 10H

       CALL RETARDO
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 00H
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 13
       MOV DL, 33
       INT 10H
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 0FH
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 14
       MOV DL, 33
       INT 10H
       CALL RETARDO

       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 00H
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 14
       MOV DL, 33
       INT 10H
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 0FH
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 15
       MOV DL, 33
       INT 10H
       CALL RETARDO

       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 00H
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 15
       MOV DL, 33
       INT 10H
       LEA BP, GOTA
       MOV BH, 0
       MOV BL, 0FH
       MOV AH, 13H
       MOV AL, 0
       MOV CX, 1
       MOV DH, 16
       MOV DL, 33
       INT 10H
       CALL RETARDO

       MOV AH,02
       MOV DL,07
       INT 21H

       ADD CONT,1
       CMP CONT,10
       JE FIN
       JMP GOTERO

FIN:
       MOV AH, 4CH
       INT 21H

DIBUJOS:
       LEA BP, TIT1
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 2
       MOV DL, 5
       INT 10H
       LEA BP, TIT2
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 3
       MOV DL, 5
       INT 10H
       LEA BP, TIT3
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 4
       MOV DL, 5
       INT 10H
       LEA BP, TIT4
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 5
       MOV DL, 5
       INT 10H
       LEA BP, TIT5
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 6
       MOV DL, 5
       INT 10H
       LEA BP, TIT6
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 7
       MOV DL, 5
       INT 10H
       LEA BP, TIT7
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 8
       MOV DL, 5
       INT 10H
       LEA BP, TIT8
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 9
       MOV DL, 5
       INT 10H
       LEA BP, TIT9
       MOV BH, 0
       MOV BL, 1AH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 32
       MOV DH, 10
       MOV DL, 5
       INT 10H
;DISPLAYADO DE LA VASIJA
       LEA BP, ABC1
       MOV BH, 0
       MOV BL, 1CH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 22
       MOV DH, 17
       MOV DL, 23
       INT 10H
       LEA BP, ABC2
       MOV BH, 0
       MOV BL, 1CH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 22
       MOV DH, 18
       MOV DL, 23
       INT 10H
       LEA BP, ABC3
       MOV BH, 0
       MOV BL, 1CH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 22
       MOV DH, 19
       MOV DL, 23
       INT 10H
       LEA BP, ABC4
       MOV BH, 0
       MOV BL, 1CH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 22
       MOV DH, 20
       MOV DL, 23
       INT 10H
       LEA BP, ABC5
       MOV BH, 0
       MOV BL, 1CH
       MOV AH, 13H
       MOV AL, 01
       MOV CX, 22
       MOV DH, 21
       MOV DL, 23
       INT 10H
       RET

RETARDO:
       PUSH DX
       PUSH CX
       PUSH BX
       MOV DX, 1000
P4:     MOV CX, 1000
P5:     MOV BX, 300
P6:     DEC BX
       JNZ P6
       DEC CX
       JNZ P5
       DEC DX
       JNZ P4
       POP BX
       POP CX
       POP DX
       RET

       CODIGO ENDS

END INICIO
