.model small
.stack
.data
        m1 db 10,13,'Enter msg : $'
        m2 db 10,13,'Valid$'
        m3 db 10,13,'Innvalid$'
        str db 20
            db 0
            db 20 dup(0)
        n db 05h
        pass db 'rahul$'
.code
        mov ax,@data
        mov ds,ax

        mov ah,09h
        lea dx,m1
        int 21h

        mov ah,0ah
        lea dx,str
        int 21h

        mov cl,str[1]
        cmp cl,n
        jne innvalid

        mov si,2
        mov di,0
repeat:
        mov al,str[si]
        cmp al,pass[di]
        jne innvalid
        inc si
        inc di
        loop repeat

        mov ah,09h
        lea dx,m2
        int 21h
        jmp last
innvalid:
        mov ah,09h
        lea dx,m3
        int 21h
last:
mov ah,4ch
int 21h
end
