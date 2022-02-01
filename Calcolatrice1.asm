title Calcolatrice
.stack
.data   

    op1 db 0
    op2 db 0
    r   db 0
    res db 0
    
.code
.startup

    mov ah,1
    int 21h
    sub al,030h
    mov op1,al
    int 21h
    mov cl,al
    int 21h
    sub al,030h
    mov op2,al
    
    mov ax,0
    mov bx,0
    
    cmp cl,'+'
    je ad
    cmp cl,'-'
    je so
    cmp cl,'/'
    je divi
    cmp cl,'*'
    je molt
    jmp termina
    
    ad:
    mov ah,op1
    add ah,op2
    mov r,ah   
    
    jmp fine
    so:
    mov ah,op1
    sub ah,op2
    mov r,ah
    
    jmp fine
    divi:
    mov al,op1
    div op2
    mov r,al
    mov res,ah
    
    
    jmp fine
    molt:
    mov al,op1
    mul op2
    mov r,al
    

fine:
    mov ah,2

    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h


    mov dl,r
    add dl,030h
    int 21h
    mov dl,'|'
    int 21h
    mov dl,res
    add dl,030h
    int 21h 


termina:
end