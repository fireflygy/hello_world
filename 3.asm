data segment
string1 db' input a character string$';提示输入字符串
string2 db'input transformed string$';提示输入转换后的字符串
data ends

code segment
assume ds:data,cs:code
start:
      mov ax,data
	  mov ds,ax
	  mov dx,offset string1
	  mov ah,9;输出string1
	  int 21h	  
lop:  mov ah,1;输入字符串，回车表示结束
	  int 21h
	  cmp al,'0d'
	  je exit
	  jmp lop
      mov dx,offset string2;提示输出转换后的字符串
      mov ah,9
      int 21h	  
;trans:
     ; add al,20h
      ;mov dl,al
      ;mov ah,2
      ;int 21h
        
	  
exit:mov ax,4c00h
	  int 21h
	  
code ends
end start
