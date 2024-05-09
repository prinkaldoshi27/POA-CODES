             DATA SEGMENT
    val1 DB 5
    result DW ?
DATA ENDS

CODE SEGMENT   
    factorial PROC
        MUL BL
        DEC BL
        JZ exit
        CALL factorial
        exit:
            RET
    factorial ENDP
    start:     
        ASSUME DS: DATA, CS: CODE  
        MOV AX, DATA
        MOV DS, AX
        MOV AL, 1 
        MOV BL, val1
        CALL factorial
        MOV result, AX       
        HLT         
    END start
CODE ENDS