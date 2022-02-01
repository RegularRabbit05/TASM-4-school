title CompitoInClasse
.model small
.stack
.data
    
    key db "frase$"
    lunghezza dw 5
    text db "*****$"
    tentativi db 10
    
    msg0 db "Le tue lettere: $"
    msg1 db "Inserire lettera > $"
    msg2 db "Hai vinto$"
    msg3 db "Hai perso$"
    msg4 db "Punteggio: $"
    msg5 db "Tentativi rimasti: $"
    nl db 0dh,0ah,'$'
    
    score dw 0
    
    lettera db ?
    fine db 0
    
.code
.startup
                 
    ciclo:                 
        je controlloFinale  
        
        mov ah,9
        lea dx,msg0
        int 21h
        call acapo
        call mostraIndovinare
        
        call acapo
        mov ah,9
        lea dx,msg1
        int 21h
        
        mov ah,1
        int 21h
        mov lettera,al
        call rimpiazzaSequenza
        call acapo
        
        call acapo
        call acapo
    dec tentativi
        call mostraTentativiRimasti
        call acapo
    
    cmp tentativi,0 
    jne ciclo


    controlloFinale: 
    
    call acapo
    
    
    mov fine,1
    call controlloFine

    call vittoria


;-----------------------------------------------------------------------------------------------
    
    mostraScore PROC
       call acapo
       mov ah,9
       lea dx,msg4
       int 21h
       mov ax,score
       mov bl,10
       div bl
       mov dh,ah
       mov dl,al
       add dl,030h
       add dh,030h
       mov ah,2
       int 21h
       mov dl,dh
       int 21h
        
    ret 
    mostraScore ENDP
    
    
    mostraTentativiRimasti PROC
       push ax
       push dx
       
       mov ah,9
       lea dx,msg5
       int 21h
       
       mov dl,tentativi
       add dl,030h
       mov ah,2
       int 21h 
       
       pop dx
       pop ax 
    ret
    mostraTentativiRimasti ENDP
    
    mostraIndovinare PROC
       push ax
       push dx 
       
       mov ah,9
       lea dx,text
       int 21h
       call acapo
       
       pop dx
       pop ax
    ret    
    mostraIndovinare ENDP
    
    rimpiazzaSequenza PROC
       mov bl,lettera 
       mov di,0
       mov bh,0
       loopR:     
          cmp key[di],bl
          jne nonRimpiazza
             mov text[di],bl
             
             cmp bh,0
             jne nonRimpiazza
             add score,10
             mov bh,1
             
          nonRimpiazza: 
       inc di
       cmp di,lunghezza
       jna loopR       
       
       cmp bh,0
       jne controlloFineCall 
          sub score,2
       controlloFineCall: 
       call controlloFine 
    ret    
    rimpiazzaSequenza ENDP
    
    controlloFine PROC
       mov di,1
       controlloTuttiRiempiti:     
          cmp text[di],'*'
          je buchi 
       inc di
       cmp di,lunghezza
       jna controlloTuttiRiempiti
                       
       call acapo                
       call mostraScore
       call acapo
       call vittoria
       
       buchi:
       
       cmp fine,1
       je sconfittaEsegui
       
       
    ret
       sconfittaEsegui:
       call acapo
       call mostraScore
       call acapo
       call sconfitta
    ret    
    controlloFine ENDP

    vittoria PROC
       call acapo
       call acapo 
        
       mov ah,9
       lea dx,msg2
       int 21h           
                  
       mov ah,4ch
       int 21h           
    ret
    vittoria ENDP
    
    sconfitta PROC 
       call acapo
       call acapo 
 
       mov ah,9
       lea dx,msg3
       int 21h
       
    
       mov ah,4ch
       int 21h
    ret
    sconfitta ENDP


    acapo PROC
    push ax
    push dx    
    
       mov ah,9
       lea dx,nl
       int 21h    
        
    pop dx
    pop ax
    ret    
    acapo ENDP




end