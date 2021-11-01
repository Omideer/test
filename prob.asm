.data
	arr: .long 10, 11, 12
	nr: .long 3
	med: .long 0
	test_par: .long 2
	comp_par: .long 0
	nr_par: .long 0
.text

.global main
			
main:
	movl $arr, %edi
	movl $0, %ecx
	movl $0, med
	et_for:
		cmp nr, %ecx
		je et_exit
		movl (%edi, %ecx, 4), %ebx
		movl %ebx, %eax
		movl $0, %edx
		divl test_par
		cmp %edx, comp_par
		je et_adv
		incl %ecx
		jmp et_for
	et_adv: 
		addl %ebx, med
		incl nr_par
		incl %ecx
		jmp et_for
	
et_exit:
	movl med, %eax
	mov $0, %edx
	divl nr_par
	movl %eax, med
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
