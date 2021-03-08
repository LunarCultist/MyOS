global loader				; entry symbol for ELF

MAGIC_NUMBER 	equ 0x1BADB002		; define the magic number constant
FLAGS 		equ 0x0			; multiboot flags
CHECKSUM	equ -MAGIC_NUMBER	; calculate the checksum
					; (magic number + checksum + flags should equal 0)

section .text:				; start of the text (code) section
align 4					; the code must be 4 byte aligned
	dd MAGIC_NUMBER			; writhe the maginc number to the machine code,
	dd FLAGS			; the flags
	dd CHECKSUM			; and the checksum

loader:					; the loader label (defined as entry point in linker script)
	mov eax, 0xCAFEBABE		; place the number 0xCAFEBABE in the register eax
.loop:
	jmp .loop			; infinity loop

