
start:     file format elf32-i386

Contents of section .text:
 8048060 54689d80 040831c0 31db31c9 31d26843  Th....1.1.1.1.hC
 8048070 54463a68 74686520 68617274 20687320  TF:hthe hart hs 
 8048080 7374684c 65742789 e1b214b3 01b004cd  sthLet'.........
 8048090 8031dbb2 3cb003cd 8083c414 c35c31c0  .1..<........\1.
 80480a0 40cd80                               @..             

Disassembly of section .text:

08048060 <_start>:
 8048060:	54                   	push   %esp
 8048061:	68 9d 80 04 08       	push   $0x804809d
 8048066:	31 c0                	xor    %eax,%eax
 8048068:	31 db                	xor    %ebx,%ebx
 804806a:	31 c9                	xor    %ecx,%ecx
 804806c:	31 d2                	xor    %edx,%edx
 804806e:	68 43 54 46 3a       	push   $0x3a465443
 8048073:	68 74 68 65 20       	push   $0x20656874
 8048078:	68 61 72 74 20       	push   $0x20747261
 804807d:	68 73 20 73 74       	push   $0x74732073
 8048082:	68 4c 65 74 27       	push   $0x2774654c
 8048087:	89 e1                	mov    %esp,%ecx
 8048089:	b2 14                	mov    $0x14,%dl
 804808b:	b3 01                	mov    $0x1,%bl
 804808d:	b0 04                	mov    $0x4,%al
 804808f:	cd 80                	int    $0x80
 8048091:	31 db                	xor    %ebx,%ebx
 8048093:	b2 3c                	mov    $0x3c,%dl
 8048095:	b0 03                	mov    $0x3,%al
 8048097:	cd 80                	int    $0x80
 8048099:	83 c4 14             	add    $0x14,%esp
 804809c:	c3                   	ret    

0804809d <_exit>:
 804809d:	5c                   	pop    %esp
 804809e:	31 c0                	xor    %eax,%eax
 80480a0:	40                   	inc    %eax
 80480a1:	cd 80                	int    $0x80
