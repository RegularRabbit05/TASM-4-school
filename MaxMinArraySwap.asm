title MaxMinArray
.model small
.stack
.data

    arrayMax db 34,65,2,-23,-20,-100,1,9,0,10
    arrayMin db 0,20,100,20,-30,-1,32,56,29,9
 
.code
.startup
    
    mov di,0
    ciclo:
        mov ah,arrayMin[di]
        cmp arrayMax[di],ah
        jg prossimo
        xchg arrayMax[di],ah
        xchg arrayMin[di],ah

        prossimo:
        inc di
        cmp di,10
        jne ciclo

end