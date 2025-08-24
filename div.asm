global _start
section .text
_start:
	mov ax,7510	;16-bit num (256-65k)
	mov bl,75	;8-bit num (<=256)
	div bl		;AX / BL
			;AL = quotient
			;AH = remainder
	
	mov cl,ah	;moving remainder to ecx regs
	xor ah,ah	;clearing ah so eax regs will have quotient only
			
			;by this method in gnu(gdb) one can clearly see
			;remainder and quotient in different regs as early
			;both ah and al were in eax which gave different answer combined
	mov eax,1
	xor ebx,ebx
	int 80h
