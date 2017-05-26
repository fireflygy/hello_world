data segment
string1 db'please input a character string$';提示输入字符串
string2 db'input errow,please input a character string again$';提示输入错误
data ends

code segment
assume ds:data,cs:code
start:
      mov ax,data
	  mov ds,ax
	  mov dx,offset string1
	  mov ah,9
	  int 21h	  
lop:  mov ah,1
	  int 21h
	  cmp al,'$';$字符表示程序退出
	  je exit
	  cmp al,'A'
	  jl errow
	  cmp al,'Z'
	  jng trans
	  cmp al,'a'
	  jl errow
	  cmp al,'z'
	  jng printf
	  cmp al,'z'
	  jg errow
	  jmp exit
printf:mov ah,2
       int 21h3
       jmp lop	   
trans:add al,20h
      mov dl,al
      mov ah,2
      int 21h
      jmp printf;转换后输出	  
errow: 
      mov ah,2
	  int 21h
      mov dx,offset string2
      mov dl,0dh
	  mov ah,2
	  int 21h
	  mov dl,0ah
	  mov ah,2
	  int 21h
	  mov ah,9
	  int 21h
	  jmp lop;输入错误则跳转至lop 	  
exit:mov ax,4c00h
	  int 21h
	  
code ends
end start
；问题：1换行未成功
      2 字母重复输出