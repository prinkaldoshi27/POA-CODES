# move 5 elements from arr1 to arr2
DATA SEGMENT
    arr1 DB 10, 20, 30, 40, 50
    len DB 05
DATA ENDS
                                            
EXTRA SEGMENT
    arr2 DB ?    
EXTRA ENDS

CODE SEGMENT
    start: 
        ASSUME DS: DATA, CS: CODE, ES: EXTRA
        
        MOV AX, DATA
        MOV DS, AX
        
        MOV AX, EXTRA
        MOV ES, AX 
        
        LEA SI, arr1
        LEA DI, arr2
        
        MOV CH, len
        MOV CL, 00
        
    move_loop:
        MOV BH, DS:[SI]
        MOV ES:[DI], BH
        
        INC SI
        INC DI     
        INC CL
        
        CMP CH, CL
        JNE move_loop    
               
        HLT
    END start
CODE ENDS