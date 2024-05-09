DATA SEGMENT
    val1 DB 5
    val2 DB 5 
DATA ENDS    

EXTRA SEGMENT
    val3 DB ?
EXTRA ENDS

CODE SEGMENT
    start:
        ASSUME DS: DATA, CS: CODE, ES: EXTRA
        
        MOV AX, DATA
        MOV DS, AX                          
        
        MOV AX, EXTRA
        MOV ES, AX
        
        MOV AH, val1
        MOV AL, val2
        
        ADD AH, AL
         
        LEA DI, val3
        
        MOV ES:[DI], AH    
        HLT
     END start  
CODE ENDS