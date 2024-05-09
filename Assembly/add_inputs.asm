DATA SEGMENT
   str_val1 DB "Enter value 1 : $"
   str_val2 DB "Entre value 2 : $"
   val1 DB ?
   val2 DB ?
   result DB ? 
DATA ENDS

CODE SEGMENT
    start:
        ASSUME DS: DATA, CS: CODE
        MOV AX, DATA
        MOV DS, AX   
        
        MOV AH, 09H
        LEA DX, str_val1
        INT 21H 
        
        MOV AH, 0AH
        INT 21H
        MOV [val1], AL 
        
        MOV AH, 09H
        LEA DX, str_val2
        INT 21H 
        
        MOV AH, 0AH
        INT 21H
        MOV [val2], AL 
        
        MOV AL, val1
        MOV AH, val2  
        
        ADD AL, AH
        
        MOV [result], AL
        
        MOV AH, 09H
        LEA DX, result
        INT 21H
        
        HLT
     END start
CODE ENDS