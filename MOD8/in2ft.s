/* Preamble
# Title: ARM Assembly Template
# Purpose: Conversions.s converts input ft & in into decimal value of ft
# Author: Justin E
# Edit Date: 29MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
inches2Ft:
#function prologue
    SUB sp, sp, #4
    STR lr, [sp, #0]
     
#function conversion inches to ft
    MOV r3, #10
    MUL r0, r0,r3
    MOV r1, #12
    bl __aeabi_idiv
    #answer is returned in r0

#function epilogue
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
    
#end inches2Ft
t: .asciz “r1 = “
#end increment

