start:
    mov DX,0  
    mov CX,700h
    mov DS,CX
    mov [0],0
    mov [1],0
    mov [2],0
    mov [3],0
    mov CX,2
    mov SI,0
    loopInput:
        mov BX,0
        
        mov AH,1
        int 21h
        mov AH,0
        mov BX,100
        sub AX,48
        mul BX
        add DS:[SI],AX
        
        
        mov AH,1
        int 21h
        mov AH,0
        mov BX,10
        sub AX,48
        mul BX
        add DS:[SI],AX
        
        mov AH,1
        int 21h
        mov AH,0
        sub AX,48
        add DS:[SI],AX  
        
        inc SI
        inc SI
       
        
        loop loopInput
        
    xor AX,AX
    xor BX,BX
    mov AX,DS:[0]
    mov BX,DS:[2]
    add AX,BX
    mov [0],0
    mov [1],0
    mov [2],0
    mov [3],0
    mov [0],AX
