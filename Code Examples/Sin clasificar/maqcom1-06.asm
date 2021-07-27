;Visualiza el abecedario

MOV AH,02
MOV DL,41
INT 21
CMP DL,5A
JE 110
ADD DL,1
JMP 104
INT 20

;Visualiza del 0 al 9

MOV AH,02
MOV DL,30
INT 21
CMP DL,39
JE 110
ADD DL,1
JMP 104
INT 20