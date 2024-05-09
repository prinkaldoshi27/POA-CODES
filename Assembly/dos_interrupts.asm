DATA SEGMENT
    str DB "Enter a Character : $",10
    str2 DB 10,"Entered String : $", 10 
    input_char DB ?
DATA ENDS

CODE SEGMENT
start:
    ASSUME DS:DATA, CS:CODE
    MOV AX, DATA
    MOV DS, AX

    MOV AH, 09H  ; print string
    LEA DX, str
    INT 21H

    MOV AH, 01H  ; input character
    INT 21H
    MOV [input_char], AL 

    MOV AH, 09H  ; print string
    LEA DX, str2
    INT 21H

    MOV AH, 02H
    MOV DL, [input_char]
    INT 21H

    HLT
END start
CODE ENDS
