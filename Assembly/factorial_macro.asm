DATA SEGMENT
    val1 DB 5
    result DW ?
DATA ENDS

CODE SEGMENT   
    factorial MACRO:
        fact_loop:
            MUL BL
            DEC BL
            JNZ fact_loop
    ENDM
    start:     
        ASSUME DS: DATA, CS: CODE  
        MOV AX, DATA
        MOV DS, AX
        MOV AL, 1 
        MOV BL, val1
        factorial
        MOV result, AX       
        HLT         
    END start
CODE ENDS