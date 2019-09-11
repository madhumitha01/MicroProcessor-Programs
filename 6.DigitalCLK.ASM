pch macro char
        mov ah,06h
        mov dl,char
        int 21h
        endm
.model small
.stack
.data
        sec db 0
        min db 0
        hr  db 0
.code
        mov ax,@data
        mov ds,ax

        mov al,0
        mov bh,07
        mov ch,0
        mov cl,0
        mov dh,24
        mov dl,79
        mov ah,06h
        int 10h
again:
        call display
        call delay
        inc sec
        cmp sec,60
        jne again

        mov sec,0

        inc min
        cmp min,60
        jne again

       mov min,0

       inc hr
       cmp hr,24
       jne again

       call delay
       mov sec,0
       mov min,0
       mov hr,0
       call display

mov ah,4ch
int 21h

display proc
        mov bh,0
        mov dh,12
        mov dl,30
        mov ah,02
        int 10h

        mov al,hr
        call print
        pch ':'

        mov al,min
        call print
        pch ':'

        mov al,sec
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
delay proc
        push cx
        push dx
        mov dx,0FFFh
outloop:
        mov cx,0FFFFh
inloop:loop inloop
        dec dx
        jne outloop
        pop dx
        pop cx
        ret
        delay endp
end
