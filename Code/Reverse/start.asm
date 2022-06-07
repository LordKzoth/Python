
start:     file format elf32-i386


Disassembly of section .text:

08048060 <_start>:
 8048060:	54                   	push   %esp		; Get value from ESP and place it into Stack
 8048061:	68 9d 80 04 08       	push   $0x804809d	; Get value from $0x804809d and place it into Stact
 8048066:	31 c0                	xor    %eax,%eax	; %eax = 0
 8048068:	31 db                	xor    %ebx,%ebx	; %ebx = 0
 804806a:	31 c9                	xor    %ecx,%ecx	; %ecx = 0
 804806c:	31 d2                	xor    %edx,%edx	; %edx = 0
 804806e:	68 43 54 46 3a       	push   $0x3a465443	; $0x3a465443 -> Stack
 8048073:	68 74 68 65 20       	push   $0x20656874	; $0x20656874 -> Stack
 8048078:	68 61 72 74 20       	push   $0x20747261	; $0x20747261 -> Stack
 804807d:	68 73 20 73 74       	push   $0x74732073	; $0x74732073 -> Stack
 8048082:	68 4c 65 74 27       	push   $0x2774654c	; $0x2774654c -> Stack
 8048087:	89 e1                	mov    %esp,%ecx	; %ecx = %esp (%esp - Pointer to top of the Stack)
 								; !!! Objdump changing _op1_ and _op2_ order
 8048089:	b2 14                	mov    $0x14,%dl	; %dl = 0x14 (14)
 804808b:	b3 01                	mov    $0x1,%bl		; %bl = 0x1  (1)
 804808d:	b0 04                	mov    $0x4,%al		; %al = 0x4  (4)
 804808f:	cd 80                	int    $0x80		; 0x80 -> Linux system_call | al = 4 => eax = 4 => Write
 								; + ebx = 1 (stdout)
 8048091:	31 db                	xor    %ebx,%ebx	; %ebx = 0
 8048093:	b2 3c                	mov    $0x3c,%dl	; %dl = 0x3c (60) 
 8048095:	b0 03                	mov    $0x3,%al		; %al = 0x3  (3)
 8048097:	cd 80                	int    $0x80		; system_call | eax = 3 => Read
 								; + ebx = 0 (stdin)
 8048099:	83 c4 14             	add    $0x14,%esp	; %esp = %esp + 14
 804809c:	c3                   	ret    

; Segmentation fault after 12345678901234567890 (1234567890123456789 - it's OK)
; In this case 0x804800a was called as next instruction
; \n (After Enter pressing) = 0x0a, so 9d was replaced to 0a (as I think)

0804809d <_exit>:
 804809d:	5c                   	pop    %esp
 804809e:	31 c0                	xor    %eax,%eax
 80480a0:	40                   	inc    %eax
 80480a1:	cd 80                	int    $0x80
