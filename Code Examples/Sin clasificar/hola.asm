data segment
 t1 db 0ah,0dh,"PROGRAMA PARA CAMBIO DE CODIGOS$"
 t2 db 0ah,0dh,"Ingrese el Primer Codigo:$"
 t3 db 0ah,0dh,"El Resultado del Cambio es:$"
cad  db 00
cad1 db 00
cad2 db 00
cad3 db 00
cad4 db 00
cad5 db 00
cad6 db 00
cad7 db 00
cad8 db 00
cad9 db 00
data ends
code segment
assume cs:code,ds:data
 start:mov ax,data
       mov ds,ax
       mov ah,09h
       mov dx,offset t1
       int 21h
       mov ah,09h
       mov dx,offset t2
       int 21h
       mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta: int 21h
       mov cad[si],al
       inc si
       cmp si,3
       jbe salta
       jmp sigue
sigue: mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta1:int 21h
       mov cad1[si],al
       inc si
       cmp si,3
       jbe salta1
       jmp sigue1
sigue1:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta2:int 21h
       mov cad2[si],al
       inc si
       cmp si,3
       jbe salta2
       jmp sigue2
sigue2:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta3:int 21h
       mov cad3[si],al
       inc si
       cmp si,3
       jbe salta3
       jmp sigue3
       mov ah,4ch
sigue3:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta4:int 21h
       mov cad4[si],al
       inc si
       cmp si,3
       jbe salta4
       jmp sigue4
sigue4:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta5:int 21h
       mov cad5[si],al
       inc si
       cmp si,3
       jbe salta5
       jmp sigue5
sigue5:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta6:int 21h
       mov cad6[si],al
       inc si
       cmp si,3
       jbe salta6
       jmp sigue6
sigue6:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta7:int 21h
       mov cad7[si],al
       inc si
       cmp si,3
       jbe salta7
       jmp sigue7
sigue7:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta8:int 21h
       mov cad8[si],al
       inc si
       cmp si,3
       jbe salta8
       jmp sigue8
sigue8:mov ah,02h
       mov dl,0ah
       int 21h
       mov si,0
       mov ah,01h
salta9:int 21h
       mov cad9[si],al
       inc si
       cmp si,3
       jbe salta9
       jmp sigue9
sigue9:mov ah,09h
       mov dx,offset t3
       int 21h
       mov ah,4ch
       int 21h
code ends
 end start 


