title BinarioDecimale
.stack
.data

    numero db 0
    potenze db 128,64,32,16,8,4,2,1

.code
.startup
    
    mov si,0
    inp:
        mov ah,1
        int 21h
        sub al,030h
        
        mul potenze[si]
        add numero,al
        
        inc si
        cmp si,8
        jne inp


end