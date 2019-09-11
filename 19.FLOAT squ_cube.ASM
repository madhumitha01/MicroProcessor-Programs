.model small
.stack
.data
        x dd 1.5
        squ dd 0
        cube dd 0
.code
        mov ax,@data
        mov ds,ax

        finit
        fld x
        fmul st(0),st(0)
        fst squ
        fld x
        fmul st(0),st(1)
        fst cube
mov ah,4ch
int 21h
end

