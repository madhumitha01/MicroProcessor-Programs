.model small
.stack
.data
        m1 db 10,13,'Enter str : $'
        m2 db 10,13,'Enter str : $'
        m3 db 10,13,'Concat : $'
        str db 20
            db 0
            db 20 dup(0)
        n db 05h
	str1 db 20
            db 0
            db 20 dup(0)
.code
        mov ax,@data
        mov ds,ax

        mov ah,09h
        lea dx,m1
        int 21h

        mov ah,0ah
        lea dx,str
        int 21h

        mov ah,09h
        lea dx,m2
        int 21h

        mov ah,0ah
        lea dx,str1
        int 21h

        mov cl,str[1]
        mov si,cx
        add si,2
        mov cl,str1[1]
        mov di,2
repeat:
        mov al,str1[di]
        mov str[si],al
        inc si
        inc di
        loop repeat
	mov str[si],'$'

        mov ah,09h
        lea dx,m3
        int 21h

        mov ah,09h
        lea dx,str[2]
        int 21h
mov ah,4ch
int 21h
end
