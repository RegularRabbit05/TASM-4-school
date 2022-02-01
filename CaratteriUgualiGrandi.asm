title CaratteriGrandi
.model small
.stack
.data

    caratteri db 20 dup(0)
   
.code
.startup
    
    mov bh,0
    mov bl,0
    mov cx,20
    mov ah,1
    mov si,0
    input:
        int 21h
        mov caratteri[si],al
        cmp al,bh
        jne nonUguale
        sub caratteri[si],020h
        cmp bl,0
        jne continua
        mov bl,1
        dec si
        sub caratteri[si],020h
        inc si
        jmp continua
        nonUguale:
        mov bh,al
        mov bl,0    
        
        continua:
        inc si
    loop input   
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    mov si,0
    output:
        mov dl,caratteri[si]
        int 21h 
         
        inc si
        cmp si,20
        jb output

end