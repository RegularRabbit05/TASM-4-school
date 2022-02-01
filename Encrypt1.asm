title Encrypt
.model small
.stack
.data
    
    dat db "abcaaaaaaaaaaa5u"
    
.code
.startup 
    mov al,5 ; Quanti caratteri spostare
    mov bx,16; Quanti caratteri nella stringa
    
    mov di,0
    elaborazione:
        mov ah,dat[di]
        add ah,al
        cmp ah,07Ah
        jbe controlloN
        sub ah,26
        
        controlloN:
        cmp ah,060h
        ja prossimo   
        cmp ah,039h
        jbe prossimo
        sub ah,10
        
        prossimo:
        mov dat[di],ah
    
    inc di
    cmp di,bx
    jne elaborazione
    
    
    mov di,0
    mov ah,2
    output: 
        mov dl,dat[di]
        int 21h
    
    inc di
    cmp di,bx
    jne output

end