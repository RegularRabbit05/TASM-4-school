title Fattoriale
.model small
.stack
.data
   
    numero db 7      ;Variabile contenente il numero di cui eseguire il fattoriale
    risultato dw 0   ;Variabile contenente il risultato

.code
.startup
   
    mov bx,0         ;Contiene il numero che stiamo moltiplicando (Esempio: se il fattoriale è 5 allora conterrà in ordine 5-4-3-2-1)
    mov ax,0         ;Contiene il risultato della moltiplicazione corrente (5*4 -> (5*4)*3 -> ...)
    mov al,numero    ;Muoviamo 5 nella moltiplicazione corrente (prepariamo 5x4)
    mov bl,numero    ;Stessa cosa di sopra ^
    
    fattoriale:      ;Loop per ogni numero compreso tra "Numero" e "1"
        dec bl       ;Diminuiamo di 1 il valore della moltiplicazione corrente (prepariamo per esempio ad eseguire 5*4)
        mul bx       ;Moltiplichiamo
    cmp bx,1         ;Controlliamo di non star eseguendo una moltiplicazione per "0"
    jne fattoriale   ;Se non siamo ancora arrivati alla moltiplicazione x0 possiamo continuare
    
    mov risultato,ax ;Salviamo il risultato di (2 byte = 16bit) nella sua variabile
    
end