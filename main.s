	.arch armv8-a
	.file	"main.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Iteration %d\n"
.data

.global x
.comm x, 8000, 4

.global y
.comm y, 8000, 4

.global result
.comm result, 8000, 4

.global alpha
alpha: .word 13


	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	
	str 	wzr, [sp, 16]
	
	ldr	x19, =x
	ldr	x20, =y
	ldr	x21, =result
	ldr	x0, =alpha
	ldr	w22, [x0]	


looptop:
	ldr 	w0, [sp, 16]
	cmp	w0, #2000
	bge	myquit	

	mov	w1, w0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	
	ldr	w9, [x19], 4 	
	ldr	w10, [x20], 4 
	mul	w9, w22, w9
	add	w9, w9, w10
	str	w9, [x21], 4
 
	ldr 	w0, [sp, 16]
	add 	w0, w0, #1
	str 	w0, [sp, 16]	

	b	looptop

myquit:


	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
