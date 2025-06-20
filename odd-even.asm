JMP START

;data
START: NOP

MVI A, 00H   
MVI B, 08H   
MVI C, 02H   

LOOP:
  ADD C      
  CMP B      
  JZ EVEN    
  JC LOOP    
  JMP ODD

EVEN:
  MVI D, 01H 
  JMP END

ODD:
  MVI D, 00H 

END:
HLT
