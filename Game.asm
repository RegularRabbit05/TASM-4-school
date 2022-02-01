title G
.model small
.stack
.data                         
;screenData
    l1 db 80 dup(0C4h)
    l2 db 80 dup(020h)
    l3 db 80 dup(020h)
    l4 db 80 dup(020h)
    l5 db 80 dup(020h)
    l6 db 80 dup(020h)
    l7 db 80 dup(020h)
    l8 db 80 dup(020h)
    l9 db 80 dup(020h)
    l10 db 80 dup(020h)
    l11 db 80 dup(020h)
    l12 db 80 dup(020h)
    l13 db 80 dup(020h)
    l14 db 80 dup(020h)
    l15 db 80 dup(020h)
    l16 db 80 dup(020h)
    l17 db 80 dup(020h)
    l18 db 80 dup(020h)
    l19 db 80 dup(020h)
    l20 db 80 dup(0C4h)


    newLine db 0dh,0ah,'$'
    
;vars    
    
    

;pad
    padding0 dw 0AAFFh dup(?)

;config
    screenSize dw 20

    
.code
.startup

    
    call printScreen
 

      








    hlt
;;

   printScreen PROC
      
      push DI
      push SI
      push BP
      push ax
      push bx
      push cx
      push dx
      
      mov dx,0
      mov cx,2
      mov si,0
      
        mov ah,9
        mov dx,si
        add si,79
        mov ds:[si],'$'
      
        int 21h
        
        inc si
        
                        
        call printNewLine
        
        
      printAllScreenLines:
        mov dx,si
        add si,80
        mov ds:[si],'$'
      
        int 21h
        
        inc si
        
                        
        call printNewLine
      
        inc cx
        cmp cx,screenSize
        jne printAllScreenLines
      
      
      pop dx
      pop cx
      pop bx
      pop ax
      pop BP
      pop SI   
      pop DI
            
    ret
   printScreen ENDP 
   
;;   
   
   printNewLine PROC
      push ax
      push dx
      mov ah,9
      lea dx,newLine
      int 21h
   
   
      pop dx
      pop ax
    ret
   printNewLine ENDP   
   
;;
end