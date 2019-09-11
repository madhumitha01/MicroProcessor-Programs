pstr macro msg
        mov ah,09h
        lea dx,msg
        int 21h
endm

.model small
.stack
.data
        x dw 4455h,3322h
        y dw 5566h,9988h
        res dw 05 dup(0)

        m1 db 10,13,'Enter 1:Add 2: Mul 3: Div : $'
        m2 db 10,13,'Invalid$'
.code
        mov ax,@data
        mov ds,ax

        pstr m1

        mov ah,01h
        int 21h

        cmp al,'1'
        je adddd
        cmp al,'2'
        je multi
        cmp al,'3'
        je division
         pstr m2
         jmp last

adddd:
        mov ax,x[0]
        add ax,y[0]
        mov res[0],ax
        mov ax,x[2]
        adc ax,y[2]
        mov res[2],ax
        adc res[4],0
        jmp last
multi:
        mov ax,x[0]
        mul y[0]
        mov res[0],ax
        mov res[2],dx

        mov ax,x[2]
        mul y[0]
        add res[2],ax
        adc res[4],dx
	adc res[6],0

        mov ax,x[0]
        mul y[2]
        add res[2],ax
        adc res[4],dx
	adc res[6],0

        mov ax,x[2]
        mul y[2]
        add res[4],ax
        adc res[6],dx
	adc res[8],0

        jmp last
division:
	mov ax,x[0]
	mov dx,x[2]
	div y[0]
	mov res[0],ax
	mov res[2],dx
last:
mov ah,4ch
int 21h
end

