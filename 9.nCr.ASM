.model small
.stack
.data
        n db 05h
        r db 03h
        res dw 00h
.code
        mov ax,@data
        mov ds,ax

        mov al,1
        mov cl,r
        call fact
        mov res,ax

        mov al,1
        mov cl,n
        call fact
        mov dx,0
        div res
        mov res,ax

        mov al,1
        mov cl,n
        sub cl,r
        call fact
        xchg ax,res
        mov dx,0
        div res
        mov res,ax

mov ah,4ch
int 21h

fact proc
        mul cl
        loop again
        ret
    again:
        call fact
        ret
fact endp
end
