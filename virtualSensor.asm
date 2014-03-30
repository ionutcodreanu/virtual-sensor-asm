
#start=D:\Work\SMP\tema\virtual-sensor-asm\virtualSensor.exe#
INCLUDE 'emu8086.inc'
   
INT 10H
   
;write oxigen sensor label
LEA SI, msgOxigen
GOTOXY 0,3
CALL print_string ; 
  
;write noise sensor label
LEA SI, msgNoise
GOTOXY 0,4
CALL print_string ;

;write dust sensor label
LEA SI, msgDust
GOTOXY 0,5
CALL print_string ;
 
TEST:
	CALL oxigenShow 
	CALL noiseShow
	CALL dustShow
jmp TEST
OxigenEmptyC: 
     gotoxy 17, 3 
     PUTC ' '
     RET 
NoiseEmptyC: 
     gotoxy 17, 4 
     PUTC ' '
     RET
DustEmptyC: 
     gotoxy 17, 5 
     PUTC ' '
     RET
HLT   

;oxigen sensor update value 
oxigenShow PROC NEAR
    gotoxy 15, 3
    IN AL, 2  
    MOV AH, 0    
    CALL print_num
    CMP AL, 100
    JB OxigenEmptyC
    RET
oxigenShow ENDP 

;noise sensor update value
noiseShow PROC NEAR
    gotoxy 15, 4
    IN AL, 3  
    MOV AH, 0    
    CALL print_num 
    CMP AL, 100
    JB NoiseEmptyC
    RET
noiseShow ENDP 

;dust sensor update value
dustShow PROC NEAR
    gotoxy 15, 5
    IN AL, 4  
    MOV AH, 0    
    CALL print_num 
    CMP AL, 100
    JB DustEmptyC
    RET
dustShow ENDP


;virtual oxigen sensor label
msgOxigen DB 'Oxigen sensor: ', 0  
;virtual noise sensor label
msgNoise DB 'Noise sensor: ', 0 
;virtual dust sensor label
msgDust DB 'Dust sensor: ', 0 

DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS     
DEFINE_PTHIS
END