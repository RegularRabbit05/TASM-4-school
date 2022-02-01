title ContoPosNeg
.model small
.stack
.data

    dati db 43,12,1,-4,-1,-45,0,9,10,-2

.code
.startup               
    mov bh,0 ; Positivi
    mov bl,0 ; Negativi
    
    mov di,9
    
    controllo:
        cmp dati[di],0
        jge positivo
        inc bl
        jmp continua
        
        positivo:
        inc bh
    
        continua:
    dec di
    cmp di,0
    jge controllo 

    mov ah,2
    mov dl,bh
    add dl,030h
    int 21h 
    mov dl,'|'
    int 21h
    mov dl,bl
    add dl,030h
    int 21h

end