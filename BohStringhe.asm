title a
.model small
.stack
.data 
    stringa db 4 dup(0)
    a db "stringa$"
.code
.startup
    lea dx,a
    mov ah,9
    int 21h
    
    
    mov di,0
    input:
        mov ah,1
        int 21h
        mov stringa[di],al
           
        inc di
        cmp di,4
        jne input    
    
    
    mov bl,stringa[3]
    cmp stringa[0],bl
    jne no
    mov bl,stringa[2]
    cmp stringa[1],bl
    jne no
    
    
    mov ah,2
    mov dl,' '
    int 21h
    mov dl,'s'
    int 21h
    
    hlt


    
    no:
    mov ah,2
    mov dl,' '
    int 21h
    mov dl,'n'
    int 21h
    hlt
    
    
end