;stepper_motor

.model small
.stack
.data
        n dw 800
        pa equ 0d0a0h
        pb equ 0d0a1h
        pc equ 0d0a2h
        cw equ 0d0a3h
        m1 db 10,13,'Enter y $'
.code
        mov ax,@data
        mov ds,ax

        mov dx,cw
        mov al,80h
        out dx,al

        mov cx,n
        mov al,88h
again:
        mov dx,pa
        out dx,al
        ror al,1
        call delay
        loop again
        mov ah,4ch
        int 21h
delay proc
        push dx
        push cx
        mov dx,0ffh
outloop: mov cx,0ffffh
inloop:loop inloop
        dec dx
        jne outloop
        pop cx
        pop dx
        ret
        delay endp
end
