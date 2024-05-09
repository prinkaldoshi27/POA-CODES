DATA SEGMENT
    arr DB 3,8,2,5,1,4
    len DB 6
DATA ENDS
CODE SEGMENT 
    ascending MACRO:  
        inner_loop: 
            MOV BL, DS:[SI]
            MOV BH, DS:[SI+1]
            CMP BL,BH
            JBE no_swap
            MOV [SI], BH
            MOV [SI+1], BL
            no_swap:
                NOP
            INC SI
            DEC CL
            JNZ inner_loop      
    ascending ENDM    
    start:   
        ASSUME DS: DATA, CS: CODE
        MOV AX, DATA
        MOV DS, AX
           
        MOV CH, len
    outer_loop:  
        LEA SI, arr 
        MOV CL, len
        DEC CL
            ascending
        DEC CH
        JNZ outer_loop           
        HLT     
    END start
CODE ENDS