title a
.model small
.stack
.data 
    
    nuovaLinea db 0dh,0ah,'$'
    utente_prm db "Inserisci utente: $"
    password_prm db "Inserisci password: $"
    errore db "Qualcosa non corrisponde$"
    
    utente db 'u','t','e','n','t','e',0dh,0dh,0dh,0dh
    password db 'p','a','s','s','w','o','r','d',0dh,0dh
    utente_input db 10 dup(0dh)
    password_input db 10 dup(0ah)    
 
.code
.startup    
    lea dx,utente_prm         
    mov ah,9
    int 21h
     
    mov di,0
    inputUtente:
        mov ah,1
        int 21h
        mov utente_input[di],al
        
        inc di 
        cmp al,0dh
        je confrontoUtente
        cmp di,10      
        je confrontoUtente
        jmp inputUtente
             

    mov di,0
    confrontoUtente:
        mov ch,utente[di] 
        cmp ch,0dh
        je prossimo
        cmp utente_prm[di],ch
        jne nonUguali
        
        inc di
        cmp di,10
        jne confrontoUtente    
    
    
    
    prossimo:
    
           
    lea dx,nuovaLinea
    mov ah,9
    int 21h
       
       
    lea dx,password_prm
    int 21h
           
    mov di,0
    inputPassword:
        mov ah,1
        int 21h
        mov password_input[di],al
        
        inc di
        cmp di,10
        jne inputPassword







    
    hlt
    nonUguali:
        lea dx,nuovaLinea
        mov ah,9
        int 21h
        
        lea dx,errore
        mov ah,9
        int 21h
        hlt    

end