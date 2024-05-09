DATA SEGMENT
    arr DB 3,8,2,5,1,4
    len DB 6
DATA ENDS
CODE SEGMENT 
       
    start:   
        ASSUME DS: DATA, CS: CODE
        MOV AX, DATA
        MOV DS, AX
           
        MOV CH, len
    outer_loop:  
        LEA SI, arr 
        MOV CL, len
        DEC CL
        CALL ascending
        DEC CH
        JNZ outer_loop           
        HLT     
    END start
CODE ENDS