.model small
.stack
.data
    array db 34,43,1,2,3,5,6,7,9,3
    divisibili db 0
.code
.startup
    mov si,0
        
    mov bh,0
    mov bl,3            ; Inizializza tutte le variabili
    
    calcolo:
        mov ah,0        ; Dividi il numero corrente per 3
        mov al,array[si]
        div bl
        
        cmp ah,0        ; Se il resto e zero allora e divisibile quindi aumenta "divisibili" altrimenti continua e basta
        jne controllaLoop
        inc divisibili  ; Aumenta contatore numeri divisibili
        
        controllaLoop:
        inc si          ; Aumenta il contatore numeri controllati
        cmp si,10
        jne calcolo     ; Se non ha compiuto 10 giri torna su
   
end     