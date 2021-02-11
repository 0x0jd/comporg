.text            
.global main

# Print Message
main:
    SUB sp, sp, #4
	STR lr, [sp, #0]
	
    LDR r0, =message
    BL printf
	
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
message:.asciz "hello world\n"
