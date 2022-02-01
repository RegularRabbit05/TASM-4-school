title
.model small
.data
    A db 1
    B db 2
    C db 4
    D db 3
    E db 5
    R dw 0
.code
.startup
    mov ax,0
    mov al,A
    add bl,B
    
    mov bx,0
    mov bl,C
    sub bl,D
    
    div bl
    mov ah,0
    
    mul E
    
    mov R,ax

end