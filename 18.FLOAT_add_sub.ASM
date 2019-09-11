.model small
.stack
.data
        x dd 1.5
        y dd 1.4
        res1 dd 0
        res2 dd 0
.code
        mov ax,@data
        mov ds,ax

        finit
        fld x
        fld y
        fadd st(0),st(1)
        fst res1
        fld x
        fld y
        fsub st(0),st(1)
        fst res2
mov ah,4ch
int 21h
end

