;Muestra el alfabeto horizontalmente

mov ah, 2
mov cx, 1a
mov dl, bl
add dl, 41
int 21
inc bl
loop 105
int 20