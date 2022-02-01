title Decrypt
.model small
.stack
.data
    
    dat db "fghfffffffffff0z"
    
.code
.startup 
    mov al,5 ; Quanti caratteri spostare
    mov bx,16; Quanti caratteri nella stringa
    
    mov di,0
    elaborazione:
        mov ah,dat[di]
        sub ah,al
        cmp ah,05Dh
        jbe controlloN
        cmp ah,061h
        jae controlloN
        add ah,26
        
        controlloN:
        cmp ah,03fh
        ja prossimo   
        cmp ah,030h
        jae prossimo
        add ah,10
        
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