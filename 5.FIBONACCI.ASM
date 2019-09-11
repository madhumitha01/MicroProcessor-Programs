.model small
.stack
.data
        arr db 24 dup(0)
        n db 7
 .code
        mov ax,@data
        mov ds,ax

        mov arr[0],0
        mov arr[1],1
        dec n,2

        mov si,2
        mov cl,n
 repeat:
        mov ah,arr[si-1]
        add ah,arr[si-2]
        mov arr[si],ah
        inc si
        loop repeat

mov ah,4ch
int 21h
end

