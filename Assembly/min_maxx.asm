DATA SEGMENT
    arr DB 5,3,95
    len DB 3
    min DB ?
    max DB ?
DATA ENDS

CODE SEGMENT
    start:
        ASSUME DS:DATA, CS:CODE   
        MOV AX, DATA
        MOV DS, AX
        MOV CL, len
        
        LEA SI, arr 
        
        MOV AH, 00H 
        MOV AL, 0FFH    
        
        MOV CH, 00H
        
        compare_loop:
            MOV BL, DS:[SI]
            CMP AH, BL
            JGE notmax
            MOV AH, BL
            
            notmax:
                NOP
            
            CMP AL, BL
            JBE notmin
            MOV AL, BL
            
            notmin:
                NOP  
                
                
            INC CH
            INC SI
            CMP CL, CH
            JNZ compare_loop
            
            
        MOV min, AL
        MOV max, BL
        HLT
    END start
CODE ENDS