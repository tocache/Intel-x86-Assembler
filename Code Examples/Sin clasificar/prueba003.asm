;Visualizar un score del
;partido Peru-Brasil con
;letras amarillas y fondo
;azul, usando servicio de
;video

db "PERU:4-BRASIL:0"
mov ax, 1398
mov es, ax
lea bp, [0100]
mov ah, 13
mov al, 0
mov bh, 0
mov bl, 1e
mov cx, f 
mov dh, 1F
mov dl, 20
int 10
int 20