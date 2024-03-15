;--------------------------------------------------------------------------------------
; Description: Displays a subroutine's return address, using WriteHex proc.
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
msg byte "subRoutine's return address is: ", 0

.code
main PROC
	; Just wanted to use WriteString
	mov  edx, offset msg
	call WriteString

	call subRoutine

	Invoke ExitProcess, 0
main ENDP

subRoutine PROC
	mov  eax, esp		; Returning address was just pushed to the top of the stack to which esp is pointing
	call WriteHex		; Displays hex value stored in eaxs
	ret
subRoutine ENDP

END main