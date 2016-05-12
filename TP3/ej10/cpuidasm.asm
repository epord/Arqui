GLOBAL get_cpuid

section .text 

	get_cpuid:
		push ebp
		mov ebp, esp
		push ebx

		mov eax, 0
		cpuid
		mov [cpuident], ebx
		mov [cpuident+4], edx
		mov [cpuident+8], ecx
		mov [cpuident+12], dword 0
		mov eax, cpuident

		pop ebx
		mov esp, ebp
		pop ebp
		ret

section .bss
	cpuident resb 13
