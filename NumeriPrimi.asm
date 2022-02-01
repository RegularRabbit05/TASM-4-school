title NumeriPrimi
.model small
.stack
.data
    
    num db 15           ;Numero di cui dobbiamo calcolare i divisori

.code
.startup              
    
    mov bl,2            ;Il primo divisore da verificare è 2 in quanto un numero primo equivale a "ogni numero che puo essere diviso solamente da 1 e se stesso"
    cerca:              ;Loop per la ricerca
        mov al,num      ;Salviamo il numero dentro AX
        mov ah,0        ;(Deve essere sempre vuoto in quanto il numero è di 8 bit)
        
        div bl          ;Dividiamo per bl (contiene il divisore da controllare) [AX/BL: il dividendo (ax) è sempre ax e non può essere specificato]
        
        cmp ah,0        ;Controlla che il resto sia zero
        je divisibile   ;Se il resto è zero il numero non è primo e quindi terminiamo subito
    
        inc bl          ;Altrimenti cerchiamo per il prossimo divisore
    cmp bl,num          ;Controlliamo che ci siano ancora divisori (divisore deve essere < numero)
    jne cerca           ;Se ci sono ancora divisori allora ritorniamo al loop
    
    mov dl,'S'          ;< Carattere 'S'   |     Altrimenti scriviamo "S" in console ad indicare che il numero è primo
    mov ah,2            ;< funzione print
    int 21h             ;< Attiva print
    
    jmp fine            ;Termine programma
    divisibile:         ;Questa funzione viene richiamata solamente se è stato trovato un divisore (Resto == 0)
        mov dl,'N'      ;Prepariamo l'output
        mov ah,2        ;Prepariamo la funzione da eseguire
        int 21h         ;Eseguiamo la funzione (Scriviamo "N" in console)
    
    
    fine:               ;Termine programma


end