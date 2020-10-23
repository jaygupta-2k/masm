ASSUME CS:CODE, DS:DATA
DATA SEGMENT
N DW 0006H
R DW 0003H
NR DW ?
NF DW ?
RF DW ?
NRF DW ?
NPR DW ?
NCR DW ?
DATA ENDS
CODE SEGMENT
START:
MOV AX, DATA
MOV DS, AX
MOV CX, N
MOV AX, N
MOV BX, R
SUB AX, BX ;N-R
MOV NR, AX ;NR CONTAINS (N-R)
CALL FAC
MOV NF, AX ;NF CONTAINS N!
MOV CX, R
CALL FAC
MOV RF, AX ;RF CONTAINS R!
MOV CX, NR
CALL FAC
MOV NRF, AX ;NRF CONTAINS (N-R)!
MOV AX, NF
MOV BX, NRF
MOV CX, RF
DIV BX
MOV NPR, AX ;NPR CONTAINS PERMUTATION
DIV CX
MOV NCR, AX ;NCR CONTAINS COMBINATION
HLT
FAC PROC
MOV AX, 0001H
MOV BX, AX
L1:
INC BX
MUL BX
CMP BX, CX
JNZ L1
RET
FAC ENDP
CODE ENDS
END START