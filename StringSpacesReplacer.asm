;>> SPACES replacer
.model small
.stack
.data

    string db 100 dup(0)

.code
.startup
    
    mov di,0
    mov ah,1   
    loopInput:
        int 21h          
        cmp al,020h
        jne c
        mov al,05Fh
        
        c:
        mov string[di],al
        
        inc di
        cmp di,100
        jne loopInput
        
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    mov di,0
    mov ah,2    
    loopOutput:
        mov dl,string[di]
        int 21h
        inc di
        cmp di,100
        jne loopOutput      


end