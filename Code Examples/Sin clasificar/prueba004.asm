;Visualizar un score del
;partido Peru-Brasil usando
;servicio de dos

jmp 112
db "PERU:4-BRASIL:0$"
mov ax, 1398
mov ds, ax
lea dx, [0102]
mov ah, 9
int 21
int 20

mov ax, 1398
mov ds, ax
mov ah, 9
lea dx, [10f]
int 21
int 20
db "PERU:4-BRASIL:0$"

mov ax, 1398
mov ds, ax
mov ah, 9
lea dx, [133]
int 21
push ax
mov ah, 2
mov dl, a
int 21
mov dl, d
int 21
pop ax
lea dx, [145]
int 21
push ax
mov ah, 2
mov dl, a
int 21
mov dl, d
int 21
pop ax
lea dx, [0157]
int 21
int 20
db "+---------------+$"
db "¦PERU:4-BRASIL:0¦$"
db "+---------------+$"
