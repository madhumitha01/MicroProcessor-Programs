pstr macro msg
        mov ah,09h
        lea dx,msg
        int 21h
        endm

.model small
.stack
.data
        str db 20
            db 0
            db 20 dup(0)
        rev db 20 dup(0)
        m1 db 10,13,'Enter a string : $'
        m2 db 10,13,'Reverse is : $'
        m3 db 10,13,'is Palindrome$'
        m4 db 10,13,'not a palidrome$'
.code
        mov ax,@data
        mov ds,ax

        pstr m1

        mov ah,0ah
        lea dx,str
        int 21h

        mov cl,str[1]
        mov si,cx
        inc si
        mov di,0
repeat:
        mov al,str[si]
        mov rev[di],al
        dec si
        inc di
        loop repeat
        mov rev[di],'$'

        pstr m2
        pstr rev

        mov si,2
        mov di,0
        mov cl,str[1]
conti:
        mov bl,str[si]
        cmp bl,rev[di]
        jne notpali
        inc si
        inc di
        loop conti

        pstr m3
        jmp last
notpali:
        pstr m4
last:

mov ah,4ch
int 21h
end
