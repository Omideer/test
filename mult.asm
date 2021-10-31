.data
	v1: .long 11
	v2: .long 5
	rez_mult: .space 4
	cat: .space 4
	rest: .space 4
	afis_mult: .asciz "nu a fost facuta impartirea\n"
	afis_divl: .asciz "nu a fost facuta inmultirea\n"
	
.text

.global main

main:
	movl v1, %eax
	cmp v2, %eax
	jle et_inmultire
	jmp et_impartire
	
et_inmultire:
	mull v2
	movl %eax, rez_mult
	movl $4, %eax
	movl $1, %ebx
	movl $afis_mult, %ecx
	movl $29, %edx
	int $0x80
	jmp et_exit
	
et_impartire:
	movl $0, %edx
	divl v2
	movl %eax, cat
	movl %edx, rest
	movl $4, %eax
	movl $1, %ebx
	movl $afis_divl, %ecx
	movl $29, %edx
	int $0x80
	
et_exit:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	
