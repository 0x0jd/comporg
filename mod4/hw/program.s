.text
.global main
	
	main:
		sub sp, sp, #4
		str lr, [sp,#4]
		
		ldr r0, =prompt
		bl printf
		
		ldr r0, =input
		ldr r1, =name
		blscanf
		
		ldr r0, =output
		ldr r1, =name
		bl printf
		
		mov r0, #0
		ldr lr, [sp.#0]
		add sp, sp, #4
		mov pc, lr
		
.data
	prompt: .asciz "Hello, what is your name? "
	output: .asciz "\nHello %s, how are you today?\n"
	input: .asciz "%s"
	name: .space 40
		
		
#gcc A.o -g -c -o A.o
#gcc A.o -g -o
