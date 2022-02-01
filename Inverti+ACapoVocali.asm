.model small
.stack
.data
    stringa db 1000 dup(0)
.code
.startup
mov si,0
    input:
        mov ah,1
        int 21h
        cmp al,0Dh
        je fineInput
        mov stringa[si],al
        inc si
        cmp si,1000
        jne input

fineInput:
    mov ah,2        
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
output:    
    cmp si,0
    je fine
    dec si
    mov ah,2
    mov dl,stringa[si]
    int 21h
    cmp dl,041h
    je vocale
    cmp dl,061h
    je vocale
    cmp dl,045h
    je vocale
    cmp dl,065h 
    je vocale
    cmp dl,049h
    je vocale
    cmp dl,069h
    je vocale
    cmp dl,04fh
    je vocale
    cmp dl,06fh
    je vocale
    cmp dl,055h
    je vocale
    cmp dl,075h
    je vocale
    jmp consonante
    vocale:
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    consonante:
    jmp output


fine:

end