title ContatoreParoleCon3Caratteri
.model small
.stack 
.data 
    str db 20 dup(0) ; stringa
    contatore db 0   ; contatore
.code            
.startup

    mov di,0           ; svuota contatore ciclo
    input:
       mov ah,1        ; input carattere
       int 21h
       mov str[di],al  ; salvo carattere nell'array
       inc di          ; aumento contatore ciclo
       
       cmp di,20       ; controllo di non essere arrivato a 20 caratteri
       jne input       ; se ci sono ancora caratteri da prendere continuo il loop (i < 20)
    
    
    mov bl,0           ; registro che conta i caratteri temporaneamente (viene usato per vedere di quanti caratteri sono composte le singole parole)
    mov di,0           ; svuoto contatore ciclo
    conto:
       cmp str[di],' ' ; controllo che il carattere corrente non sia SPAZIO (se non equivale a SPAZIO continuo a contare quanti caratteri contiene la parola)
       jne ignora: ;*  ; la parola non e terminata quindi continuo a contare i caratteri
       
       cmp bl,3        ; la parola e terminata, controllo se ha 3 caratteri altrimenti ripristino il contatore caratteri visto che la parola e terminata 
       jne reset:      ; la parola non ha 3 caratteri quindi ne cerco un'altra ripristinando il contatore di caratteri
       inc contatore   ; la parola ha esattamente 3 caratteri, aumento il contatore
       
       reset:          ; ripristino il contatore di caratteri
       mov bl,0
       
       jmp continua    ; mi dirigo al prossimo carattere (controllando se non sono terminati)
       
       
       ignora:
       inc bl          ; Questa riga viene chiamata dall'asterisco ("jne ignora")
                       ; Viene richiamata se il carattere non e uno spazio quindi lo conto come parte della parola
                       
       continua:       ; Controllo che i caratteri non sono terminati (20 caratteri)
       inc di   
       cmp di,20
       jne conto       ; Se non ho raggiunto i 20 caratteri ricomincio il loop
       
    cmp bl,3           ; Se ho terminato i 20 caratteri controllo che l'ultima parola che stavo contando aveva 3 caratteri ma NON TERMINAVA CON SPAZIO 
    jne fine           ; (l'ultima lettera equivaleva all'ultima posizione dell'array quindi il controllo dello spazio all'inizio del loop non si verifica)
    inc contatore      ; Aumento il contatore se quest'ultima paroa aveva 3 caratteri altrimenti eseguo "FINE" che termina il programma
    
    mov dl,contatore
    add dl,030h
    mov ah,2
    int 21h
    
    fine:
       
       
end