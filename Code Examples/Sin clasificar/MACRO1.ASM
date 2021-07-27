DATA SEGMENT 
    CURSO DB 9 DUP(?)
    NOMBRE DB 22 DUP(?)
    CAD1 DB 0AH,0DH,"       PROGRAMA N°01 "
         DB 0AH,0DH,"       ------------- $"
    CAD0 DB 0AH,0DH,"CURSO:$"
   CAD00 DB 0AH,0DH,"NOMBRE:$"
    CAD2 DB 0AH,0DH,"PROGRAMA DE COMPARACION $"
    CAD3 DB 0AH,0AH,0DH,"INGRESE I VALOR:$"
    CAD4 DB 0AH,0DH,"INGRESE II VALOR:$"
    CAD5 DB 0AH,0DH,"INGRESE III VALOR:$"
    CAD6 DB 0AH,0DH,"INGRESE IIII VALOR:$"
    CAD7 DB 0AH,0DH,"EL RESULTADO DE LA COMP. ES:$"
    CAD8 DB 0AH,0DH,"CARACTER INGRESADO NO PERTENECE A RANGO"
         DB 0AH,0DH,"DESEA CONTINUAR? [S/N]:$"
    CAD9 DB 0AH,0AH,0DH,"DESEA CONTINUAR? [S/N]:$"
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:MOV AX,DATA
      MOV DS,AX
      MOV AX,03H
      INT 10H
      MOV DX,OFFSET CAD1
      MOV AH,09H
      INT 21H
      MOV DX,OFFSET CAD0
      MOV AH,09H
      INT 21H  
      MOV SI,01H
      MOV AH,01H
   E4:INT 21H
      MOV CURSO[SI],AL
      CMP SI,09
      JE E3
      INC SI
      JMP E4    
   E3:MOV DX,OFFSET CAD00
      MOV AH,09H
      INT 21H
      MOV SI,01H
      MOV AH,01H
   E2:INT 21H
      MOV NOMBRE[SI],AL
      CMP SI,22
      JE E1
      INC SI
      JMP E2
   E1:MOV DX,OFFSET CAD2
      MOV AH,09H
      INT 21H 
   S1:MOV DX,OFFSET CAD3
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H
      CMP AL,30H
      JB ERROR1
      CMP AL,39H
      JA K1
      JMP K2
   K1:CMP AL,41H
      JB ERROR1
      CMP AL,46H
      JA ERROR1
   K2:MOV BH,AL
      JMP F1
ERROR1:MOV DX,OFFSET CAD8
       MOV AH,09H
       INT 21H
       MOV AH,01H
       INT 21H
       CMP AL,"S"
       JE INI1
       JMP FIN
  INI1:JMP S1 
   F1:MOV DX,OFFSET CAD4
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H
      CMP AL,30H
      JB ERROR2
      CMP AL,39H
      JA K3
      JMP K4
   K3:CMP AL,41H
      JB ERROR2
      CMP AL,46H
      JA ERROR2
   K4:MOV BL,AL
      JMP F2
ERROR2:MOV DX,OFFSET CAD8
       MOV AH,09H
       INT 21H
       MOV AH,01H
       INT 21H
       CMP AL,"S"
       JE INI2
       JMP FIN
  INI2:JMP F1
    F2:MOV DX,OFFSET CAD5
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H
      CMP AL,30H
      JB ERROR3
      CMP AL,39H
      JA K5
      JMP K6
   K5:CMP AL,41H
      JB ERROR3
      CMP AL,46H
      JA ERROR3
   K6:MOV CH,AL
      JMP F3
ERROR3:MOV DX,OFFSET CAD8
       MOV AH,09H
       INT 21H
       MOV AH,01H
       INT 21H
       CMP AL,"S"
       JE INI3
       JMP FIN
  INI3:JMP F2  
   F3:MOV DX,OFFSET CAD6
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H
      CMP AL,30H
      JB ERROR4
      CMP AL,39H
      JA K7
      JMP K8
   K7:CMP AL,41H
      JB ERROR4
      CMP AL,46H
      JA ERROR4
   K8:MOV CL,AL
      JMP F4
ERROR4:MOV DX,OFFSET CAD8
       MOV AH,09H
       INT 21H
       MOV AH,01H
       INT 21H
       CMP AL,"S"
       JE INI4
       JMP FIN
  INI4:JMP F3 
   F4:MOV DX,OFFSET CAD7
      MOV AH,09H
      INT 21H
      MOV AH,02H
      CMP BH,BL
      JB B1
      JMP B2
   B1:MOV DH,BH
      MOV BH,BL
      MOV BL,DH
   B2:CMP BH,CH
      JB B3
      JMP B4    
   B3:MOV DH,BH
      MOV BH,CH
      MOV CH,DH
   B4:CMP BH,CL
      JB B5
      JMP B6
   B5:MOV DH,BH
      MOV BH,CL
      MOV CL,DH
   B6:CMP BL,CL
      JB B7
      JMP B8
   B7:MOV DH,BL
      MOV BL,CL
      MOV CL,DH
   B8:CMP BL,CH
      JB B9
      JMP B10
   B9:MOV DH,BL
      MOV BL,CH  
      MOV CH,DH
  B10:CMP CH,CL
      JB B11
      JMP B12 
  B11:MOV DH,CH
      MOV CH,CL
      MOV CL,DH
  B12:MOV DL,CL
      INT 21H
      CMP CH,CL
      JA B13
      JMP B14    
  B13:MOV DL,3CH
      INT 21H
      JMP B15
  B14:MOV DL,3DH
      INT 21H      
  B15:MOV DL,CH
      INT 21H
      CMP BL,CH
      JA B16
      JMP B17
  B16:MOV DL,3CH
      INT 21H 
      JMP B18
  B17:MOV DL,3DH
      INT 21H
  B18:MOV DL,BL
      INT 21H
      CMP BH,BL
      JA B19
      JMP B20
  B19:MOV DL,3CH
      INT 21H
      JMP B21
  B20:MOV DL,3DH
      INT 21H
  B21:MOV DL,BH
      INT 21H
      MOV DX,OFFSET CAD9
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H
      CMP AL,"S"
      JE J1
      JMP FIN
   J1:MOV AX,03H
      INT 10H
      MOV DX,OFFSET CAD1
      MOV AH,09H
      INT 21H
      MOV DX,OFFSET CAD0
      MOV AH,09H
      INT 21H 
      MOV SI,01H
      MOV AH,02H
   J3:MOV DL,CURSO[SI]
      INT 21H
      CMP SI,09 
      JE J2
      INC SI
      JMP J3
   J2:MOV DX,OFFSET CAD00
      MOV AH,09H
      INT 21H  
      MOV SI,01H
      MOV AH,02H
   J5:MOV DL,NOMBRE[SI]
      INT 21H
      CMP SI,22 
      JE J4
      INC SI
      JMP J5
   J4:JMP E1
  FIN:MOV AH,4CH
      INT 21H   
CODE ENDS
  END START




