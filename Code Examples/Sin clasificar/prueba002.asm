;Muestra la palabra
;hola dentro de un recuadro

mov ah, 2
mov dl, c9
int 21
mov cx, 4
mov dl, cd
int 21
loop 109
mov dl, bb
int 21
mov dl, a
int 21
mov dl, d
int 21
mov dl, ba
int 21
mov dl, 48
int 21
mov dl, 6f
int 21
mov dl, 6c
int 21
mov dl, 61
int 21
mov dl, BA
int 21
mov dl, a
int 21
mov dl, d
int 21
mov dl, c8
int 21
mov cx, 4
mov dl, cd
int 21
loop 142
mov dl, bc
int 21
int 20