pstr macro msg
        mov ah,09h
        lea dx,msg
        int 21h
        endm
pch macro ch
        mov ah,06h
        mov dl,ch
        int 21h
        endm
.model small
.stack
.data
        m1 db 10,13,'1: Display 2: Set : $'
        m2 db 10,13,'Current date : $'
        m3 db 10,13,'Enter date : $'
        m4 db 10,13,'Invalid$'
.code
        mov ax,@data
        mov ds,ax
        pstr m1
        mov ah,01h
        int 21h

        cmp al,'1'
        je get
        cmp al,'2'
        je set
        pstr m4
        jmp last
get:
        mov ah,2ah
        int 21h
        call display
        jmp last
set:
        pstr m3
        call read
        mov dl,al
        call read
        mov dh,al
        mov cx,2018

        mov ah,2bh
        int 21h
        call display
last:
        mov ah,4ch
        int 21h

display proc
        push dx
        pstr m2
        pop dx

        mov al,dl
        call print
        pch ':'
        mov al,dh
        call print
        ret
        display endp
print proc
        aam
        add ax,3030h
        mov bx,ax
        pch bh
        pch bl
        ret
        print endp
read proc
        mov ah,01h
        int 21h
        mov bh,al
        mov ah,01h
        int 21h
        mov bl,al
        sub bx,3030h
        mov ax,bx
        aad
        ret
        read endp
end
