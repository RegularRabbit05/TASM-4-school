title CapovolgiStringa
.model small
.stack
.data
.code
.startup

    mov di,0
    input:
        mov ah,1
        int 21h
        
        mov ah,0
        push ax
        inc di
        
        cmp di,5
        jne input
        
        
    mov di,0    
    output:
        mov ah,2
        pop dx
        int 21h
        
        inc di    
        cmp di,5
        jne output        
        
        
end