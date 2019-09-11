;logic_controller
.model small
.stack
.data
        pa equ 0d0a0h
        pb equ 0d0a1h
        pc equ 0d0a2h
        cw equ 0d0a3h
        m1 db 10,13,'Enter y $'
        x db 0
        y db 0
.code
        mov ax,@data
        mov ds,ax

        mov dx,pa
        mov al,82h
        out dx,al

        mov dx,pb
        in al,dx
        mov x,al

        mov dx,pb
        in al,dx
        mov y,al

        add al,x
        adc ah,0

        mov dx,pa
        out dx,al

        mov dx,pa
        mov al,ah
        out dx,al
