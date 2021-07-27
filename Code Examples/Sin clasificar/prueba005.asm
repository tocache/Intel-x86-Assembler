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
lea dx, [151]
int 21
push ax
mov ah, 2
mov dl, a
int 21
mov dl, d
int 21
pop ax
lea dx, [016F]
int 21
int 20
db "+---------------------------+$"
db "|Ing. Computacion y Sistemas|$"
db "+---------------------------+$"