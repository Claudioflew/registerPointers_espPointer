;--------------------------------------------------------------------------------------
; Description: Copies an element in an array to the previous position, using ESI and EDI
;			   pointers. So, {1, 2, 3} will be {2, 3, 3}.
; Author name: Koichi Nakata
; Author email: kanakta595@insite.4cd.edu
; Last modified date: March 14, 2024
; Creation date: March 14, 2024
;--------------------------------------------------------------------------------------

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
array dword 1111h, 2222h, 3333h, 4444h, 5555h, 6666h

.code
main PROC
	mov  esi, 0						; ESI points to the first element
	mov  ecx, lengthof array - 1	; Want to iterate (length - 1) times

L1:	mov  edi, esi					; EDI points to the prev element
	add  esi, type array			; Updates ESI pointer to the next element
	mov  ebx, array[esi]			; Evacuates curr element to stack
	mov	 array[edi], ebx			; Restores curr element in stack to prev pos
	loop L1

	; Just wanted to use DumpMem
	mov  esi, offset array
	mov  ebx, type array
	mov  ecx, lengthof array
	call DumpMem

	INVOKE ExitProcess, 0
main ENDP
END main

	
