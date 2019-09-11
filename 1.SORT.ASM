.model small
.stack
.data
        arr db 99h,88h,77h,29h,22h
        n db 5
.code
        mov ax,@data
        mov ds,ax

        mov cx,0
        mov cl,n
        dec cl

again:
        mov si,0
        mov dl,cl
repeat:
        mov al,arr[si]
        cmp al,arr[si+1]
        jbe noswap
        xchg al,arr[si+1]
        mov arr[si],al
noswap:
        inc si
        dec dl
        cmp dl,0
        jne repeat
        loop again
mov ah,4ch
int 21h
end
