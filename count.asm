data segment
string db 'In 1990,the exchange rate was 8.1/$'
data ends

extra segment
num  1 dup(?)
char 1 dup(?)
other 1 dup(?)
extra ends

assume ds:data,es:extra,cs:code
code segment
start:
       mov ax,data
	   mov ds,ax
	   mov ax,extra
	   mov es,ax
	   mov si,offset string
	   

	   mov ah,9
	   int 21h
	   mov ah,4ch
	   int 21h
code ends
end start