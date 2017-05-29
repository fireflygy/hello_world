data segment
string1 db 'a string for testing$'
data ends

extra segment
string2  db 20 dup(?)
extra ends

assume ds:data,es:extra,cs:code
code segment
start:
       mov ax,data
	   mov ds,ax
	   mov ax,extra
	   mov es,ax
	   lea si,string1
	   lea di,string2
	   cld
	   mov cx,20
	   rep movsb
	   mov dx,offset string2
	   mov ah,9
	   int 21h
	   mov ah,4ch
	   int 21h
code ends
end start