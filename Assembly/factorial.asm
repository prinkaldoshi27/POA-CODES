DATA SEGMENT
    val1 DB 5   
    result DB ?
DATA ENDS

CODE SEGMENT
    start:
        ASSUME DS: DATA, CS: CODE  
        MOV AX, DATA
        MOV DS, AX
            MOV AL, 01
            MOV BL, val1
            factorial_loop:
                MUL BL
                DEC BL
                JNZ factorial_loop  
            MOV result, AL
        HLT         
    END start
CODE ENDS