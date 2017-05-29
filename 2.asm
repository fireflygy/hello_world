data segment

string2  db 'FOUND$'
string3  db'NOT FOUND$'
data ends
cout_string  db 20 dup(?)
extra segment
string1 db 'a string for testing$'
extra ends

assume ds:data,es:extra,cs:code
code segment
start:
       mov ax,data
	   mov ds,ax
	   mov ax,extra
	   mov es,ax
	   mov di,offset string1
	   cld
	   mov cx,21
	   mov al,'s'；要比较的字符为s
	   repnz scasb
	   jnz notfound	
       mov dx,offset string2
       jmp exit	   
notfound:  
       mov dx,offset string3 
exit:  mov ah,9
	   int 21h
	   mov ah,4ch
	   int 21h
code ends
end start
