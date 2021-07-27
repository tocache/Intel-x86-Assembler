;Displayado de varios asteriscos

mov ah, 2
mov dl, 2a
int 21
int 21
int 21
int 21
int 21
int 21
int 21
int 21
int 21
int 21
int 21
int 21
int 20

;Displayado de tres asteriscos separados con un espacio

mov ah, 2
mov dl, 2a
int 21
mov dl, 20
int 21
mov dl, 2a
int 21
mov dl, 20
int 21
mov dl, 2a
int 21
int 20