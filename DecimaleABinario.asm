title DecimaleBinario
.model small
.stack
.data

    numero db 64
    binario db 8 dup(0)
     
.code
.startup   

    mov dh,2
    mov di,0
    mov al,numero
    ciclo:
        mov ah,0
        div dh
        mov binario[si],ah
                       
        inc si
        cmp al,0
        jne ciclo
        
    mov di,8   
    mov ah,2
    output:
        dec di
        mov dl,binario[di]
        add dl,030h
        int 21h
             
    cmp di,0
    jne output

end