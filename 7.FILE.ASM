readch macro
	mov ah,01
	int 21h
endm

print macro char
	mov ah,06
        lea dl,char
	int 21h
endm

pstr macro msg
	mov ah,09h
	lea dx,msg
	int 21h
endm

.model small
.stack
.data
	m1 db 10,13,'Enter msg : $'
	m2 db 10,13,'Entered msg : $'
	arr db 20 dup(0)
.code
	;include C:\masm\BIN\f1.asm
	;include C:\masm\BIN\f2.asm
        mov ax,@data
        mov ds,ax

        pstr m1
	mov si,0
repeat:
	readch
        mov arr[si],al
	inc si
	cmp al,0dh
	jne repeat
	
        mov si,0
repeatt:
        mov al,arr[si]
        print al
	inc si
	cmp al,0dh
	jne repeatt
mov ah,4ch
int 21h
end
