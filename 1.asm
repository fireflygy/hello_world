data segment
A db 0A2h
data ends
code segment 
assume cs:code,ds:data
start:
      mov ax,data
	  mov ds,ax
	  mov al, a
	  mov bh,al
	  mov bl,bh
	  mov cl,4
	  shr bl,cl
	  and bl,0fh
	  mov dl,bl
	  add dl,30h
	  cmp dl,39h
	  jng l
	  add dl,7h
l:	  mov ah,2
	  int 21h	  
	  mov bl,bh
	  and bl,0fh
	  mov dl,bl
	  add dl,30h
	  cmp dl,39h
	  jng ll
	  add dl,7h
ll:	  mov ah,2
	  int 21h
	  mov ax,4c00h
	  int 21h
code ends
end start