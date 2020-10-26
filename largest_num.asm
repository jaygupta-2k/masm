;1. Iterate through the list, compare consecutive numbers.
;2. Move the larger number in AL.
;3. When loop ends, largest number will be in AL.
;4. Move the largest number to position 2000.

assume cs:code, ds:data

data segment
list db 01h, 03h, 41h, 04h, 90h, 27h, 05h, 08h, 56h, 14h
data ends

code segment
start:
mov ax, data
mov ds, ax
mov cl, 09h
lea si, list
mov al, [si]
loop1:cmp al, [si+1]
jnc loop2
mov al, [si+1]
loop2: inc si
loop loop1
mov ds:[2000h], al
hlt
code ends
end start
