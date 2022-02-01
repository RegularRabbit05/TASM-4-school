;>> PASSWORD CHECK
.model small
.stack
.data
    
    pwd db 5 dup(0)
    pwdC db 'ciao!'
    
.code
.startup

    mov ah,1
    mov di,0
    loopInput:
        int 21h
        mov pwd[di],al
        
        inc di
        cmp di,5
        jne loopInput 
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov di,0
    mov cx,5
    mov ah,0
    loopCheck:
        mov al,pwdC[di]
        mov ah,pwd[di]
        inc di
        cmp ah,al 
        jne no
        loop loopCheck
        
        
    mov ah,2
    mov dl,053h
    int 21h
    mov dl,049h
    int 21h       
    hlt
    
    no:
        mov ah,2
        mov dl,04Eh
        int 21h
        mov dl,04Fh
        int 21h  
        
    hlt
            

end