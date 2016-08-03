# Note for [Learning assembly for linux-x64](http://0xax.github.io/categories/assembler/)

## Hello world
``` assembly
section .data
    msg db      "hello, world!"

section .text
    global _start
_start:
    mov     rax, 1    ; temporary register; when we call a syscall(sys_write) ,
                      ; rax must  contain syscall number
    mov     rdi, 1    ; used to pass 1st argument to functions(fd)
    mov     rsi, msg  ; pointer used to pass 2nd argument to functions(buf)
    mov     rdx, 13   ; used to pass 3rd argument to functions(count)
    syscall
    mov     rax, 60   ; syscall(sys_exit)
    mov     rdi, 0    ; used to pass 1st argument to functions(error_code)
    syscall
```

## Compile ld run
```
$ nasm -f elf64 -o hello.o hello.asm
$ ld -o hello hello.o
```
>ELF (Executable and Linkable Format)

## Section
>every assembly program consists from sections. There are following sections:
- data - section is used for declaring initialized data or constants
- bss - section is used for declaring non initialized variables
- text - section is used for code

## Instruction
```
  [label:] instruction [operands] [; comment]
```
``` assembly
  MOV COUNT, 48 ; Put value 48 in the COUNT variable
```
## Data Types
- DB  Define Bytes         ; allocates 1 byte
- DW  Define Word          ; allocates 2 byte
- DD  Define Doubleword    ; allocates 4 byte
- DQ  Define Quadword      ; allocates 8 byte
- DT  Define Ten Bytes     ; allocates 10 byte

## Arithmetic operations
* ADD - integer add
* SUB - substract
* MUL - unsigned multiply
* IMUL - signed multiply
* DIV - unsigned divide
* IDIV - signed divide
* INC - increment
* DEC - decrement
* NEG - negate

## Registers
- [CPU Registers x86-64](http://wiki.osdev.org/CPU_Registers_x86-64)

## Linux System Call
``` c
size_t sys_write(unsigned int fd, const char * buf, size_t count);
int sys_exit(int status);
```
* `fd` - file descriptor. Can be 0, 1 and 2 for standard input, standard output and standard error
* `buf` - points to a character array, which can be used to store content obtained from the
  file pointed to by fd.
* `count` - specifies the number of bytes to be written from the file into the character array

> - [Linux System Call Table](https://w3challs.com/syscalls/?arch=x86_64)
> - [Searchable Linux Syscall Table for x86 and x86_64](https://filippo.io/linux-syscall-table/)
> - [Linux System Call Table for x86_64](http://blog.rchapman.org/post/36801038863/linux-system-call-table-for-x86-64)

## Control flow
* JE - if equal
* JZ - if zero
* JNE - if not equal
* JNZ - if not zero
* JG - if first operand is greater than second
* JGE - if first operand is greater or equal to second
* JA - the same that JG, but performs unsigned comparison
* JAE - the same that JGE, but performs unsigned comparison

``` c
if (rax != 50) {
    exit();
} else {
    right();
}
```
** compare **
``` assembly
;; compare rax with 50
cmp rax, 50
;; perform .exit if rax is not equal 50
jne .exit
jmp .right
```
There is also unconditional jump with syntax:
``` assembly
JMP label
```
``` assembly
_start:
    ;; ....
    ;; do something and jump to .exit label
    ;; ....
    jmp .exit

.exit:
    mov    rax, 60
    mov    rdi, 0
    syscall
```

## Example
``` assembly
section .data
    ; Define constants
    num1:   equ 100
    num2:   equ 50
    ; initialize message
    msg:    db "Sum is correct\n"

section .text

    global _start

;; entry point
_start:
    ; set num1's value to rax
    mov rax, num1
    ; set num2's value to rbx
    mov rbx, num2
    ; get sum of rax and rbx, and store it's value in rax
    add rax, rbx
    ; compare rax and 150
    cmp rax, 150
    ; go to .exit label if rax and 150 are not equal
    jne .exit
    ; go to .rightSum label if rax and 150 are equal
    jmp .rightSum

; Print message that sum is correct
.rightSum:
    ;; write syscall
    mov     rax, 1
    ;; file descritor, standard output
    mov     rdi, 1
    ;; message address
    mov     rsi, msg
    ;; length of message
    mov     rdx, 15
    ;; call write syscall
    syscall
    ; exit from program
    jmp .exit

; exit procedure
.exit:
    ; exit syscall
    mov    rax, 60
    ; exit code
    mov    rdi, 0
    ; call exit syscall
    syscall
```

## Stack
call function

```
global _start

section .text

_start:
		mov rax, 1
		call incRax
		cmp rax, 2
		jne exit
		;;
		;; Do something
		;;

incRax:
		inc rax
		ret
```
The first six function arguments passed in registers. They are:

* rdi - first argument
* rsi - second argument
* rdx - third argument
* rcx - fourth argument
* r8 - fifth argument
* r9 - sixth

Next arguments will be passed in stack. So if we have function like this:
``` c
int foo(int a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
    return (a1 + a2 - a3 - a4 + a5 - a6) * a7;
}
```
Then first six arguments will be passed in registers, but 7 argument will be passed in stack.

## Stack pointer
* **RBP** is the base pointer register. It points to the base of the current stack frame.
* **RSP** is the stack pointer, which points to the top of current stack frame.
> We have two commands for work with stack:
- **push argument** - increments stack pointer (RSP) and stores argument in location pointed by stack pointer
- **pop argument** - copied data to argument from location pointed by stack pointer

``` assembly
global _start

section .text

_start:
		mov rax, 1
		mov rdx, 2
		push rax
		push rdx

		mov rax, [rsp + 8]

		;;
		;; Do something
		;;
```

``` assembly
section .data
	SYS_WRITE equ 1
	STD_IN    equ 1
	SYS_EXIT  equ 60
	EXIT_CODE equ 0

  NEW_LINE   db 0xa ; ASCII code ref 1.
	WRONG_ARGC db "Must be two command line argument", 0xa

section .text
global _start

_start:
  pop rcx         ; get first value from stack and puts it to rcx
                  ; command line arguments will be in stack
                  ; ref 2.
  cmp rcx, 3
  jne argcError

  add rsp, 8      ;  skip the name of the program
  pop rsi
  call str_to_int

  mov r10, rax
  pop rsi
  call str_to_int
  mov r11, rax

  add r10, r11


  mov rax, r10
  ;; number counter
  xor r12, r12    ; set r12 to zero
  jmp int_to_str  ; convert to string

argcError:
  mov rax, 1      ; sys_write syscall
  mov rdi, 1      ; file descritor, standard output

  mov rsi, WRONG_ARGC ; message address
  mov rdx, 34         ; length of message
  syscall             ; call write syscall
	jmp exit            ; exit from program

str_to_int:
  xor rax, rax        ; set rax to zero
  mov rcx,  10

next:
  cmp [rsi], byte 0   ；every string ends with NULL symbol
  je  return_str      ；All numbers from 0 to 9 have 48 to 57 codes in asci table
  mov bl, [rsi]
  sub bl, 48
  mul rcx
  add rax, rbx
  inc rsi             ; ref 3.
  jmp next

return_str:
  ret

int_to_str:
  mov rdx, 0
  mov rbx, 10
  div rbx             ; With this instruction we devide rax value on rbx value
                      ; and get reminder in rdx and whole part in rax.  
  add rdx, 48
  add rdx, 0x0
  push rdx
  inc r12
  cmp rax, 0x0        ; ref 4.
  jne int_to_str
  jmp print

print:
  ;; calculate number length
  mov rax, 1
  mul r12
  mov r12, 8
  mul r12
  mov rdx, rax

  ;; print sum
  mov rax, SYS_WRITE
  mov rdi, STD_IN
  mov rsi, rsp
  syscall             ; call sys_write

  jmp exit

exit:
	mov rax, SYS_EXIT
	exit code
	mov rdi, EXIT_CODE
	syscall

```
1. [ASCII Table](http://www.asciitable.com/)
2. If we run application with command line arguments, all of their will be in stack after running in following order:
> - [rsp] - top of stack will contain arguments count.
> - [rsp + 8] - will contain argv[0]
> - [rsp + 16] - will contain argv[1]
> - and so on...      
3. Algorthm is simple. For example if rsi points to ‘5’ ‘7’ ‘6’ ‘\000’ sequence, then will be following steps:
```
rax = 0
get first byte - 5 and put it to rbx
rax * 10 --> rax = 0 * 10
rax = rax + rbx = 0 + 5
Get second byte - 7 and put it to rbx
rax * 10 --> rax = 5 * 10 = 50
rax = rax + rbx = 50 + 7 = 57
and loop it while rsi is not \000
```
4. For example we have number 23
```
123 / 10. rax = 12; rdx = 3
rdx + 48 = "3"
push "3" to stack
compare rax with 0 if no go again
12 / 10. rax = 1; rdx = 2
rdx + 48 = "2"
push "2" to stack
compare rax with 0, if yes we can finish function execution and we will have "2" "3" ... in stack
```

## Reverse string

```
section .data
  SYS_WRITE equ 1
	STD_OUT   equ 1
	SYS_EXIT  equ 60
	EXIT_CODE equ 0

	NEW_LINE db 0xa
	INPUT db "Hello world!"

section .bss
  OUTPUT resb 12

_start:
  mov rsi, INPUT
  xor rcx, rcx
  cld                         ; resets df flag to zero
  mov rdi, $ + 15             ; $  - returns position in memory of string where $ defined
                              ; $$ - returns position in memory of current section start
                              ; ref 1.
  call calculateStrLength
  xor rax, rax
  xor rdi, rdi
  jmp reverseStr

calculateStrLength:
  cmp byte [rsi], 0           ; check is it end of string
  je exitFromRoutine          ; if yes exit from function
  lodsb                       ; load byte from rsi to al and inc rsi
  push rax                    ; push symbol to stack
  inc rcx                     ; increase counter
  jmp calculateStrLength      ; loop again

exitFromRoutine:
  push rdi    ; push return addres to stack again
  ret         ; return to _start

reverseStr:
  cmp rcx, 0
  je printResult
  pop rax
  mov [OUTPUT + rdi], rax
  dec rcx
  inc rdi
  jmp reverseStr

rintResult:
  mov rdx, rdi
  mov rax, 1
  mov rdi, 1
  mov rsi, OUTPUT
  syscall
  jmp printNewLine

printNewLine:
  mov rax, SYS_WRITE
  mov rdi, STD_OUT
  mov rsi, NEW_LINE
  mov rdx, 1
  syscall
  jmp exit

exit:
  mov rax, SYS_EXIT
  mov rdi, EXIT_CODE
  syscall

```

1. have position of mov rdi, $ + 15, but why we add 15 here? Look, we need to know position of next line after calculateStrLength. Let’s open our file with objdump util:

```
objdump -D reverse

reverse:     file format elf64-x86-64

Disassembly of section .text:

00000000004000b0 <_start>:
  4000b0:	48 be 41 01 60 00 00 	movabs $0x600141,%rsi
  4000b7:	00 00 00
  4000ba:	48 31 c9             	xor    %rcx,%rcx
  4000bd:	fc                   	cld
  4000be:	48 bf cd 00 40 00 00 	movabs $0x4000cd,%rdi
  4000c5:	00 00 00
  4000c8:	e8 08 00 00 00       	callq  4000d5 <calculateStrLength>
  4000cd:	48 31 c0             	xor    %rax,%rax
  4000d0:	48 31 ff             	xor    %rdi,%rdi
  4000d3:	eb 0e                	jmp    4000e3 <reverseStr>
```

## String operations
- **REP** - repeat while rcx is not zero
- **MOVSB** - copy a string of bytes (MOVSW, MOVSD and etc..)
- **CMPSB** - byte string comparison
- **SCASB** - byte string scanning
- **STOSB** - write byte to string

## Macros
> NASM supports two form of macro:
- **single-line** : start from %define directive.

  -  %define macro_name(parameter) value
  -  %define argc rsp + 8
  -  %define cliArg1 rsp + 24
  -  mov rax, [argc]          ; argc will be expanded to rsp + 8
  -  cmp rax, 3
  -  jne .mustBe3args

- **multiline** : starts with %macro nasm directive and end with %endmacro
```
%macro number_of_parameters
    instruction
    instruction
    instruction
%endmacro
```
```
%macro bootstrap 1
          push ebp
          mov ebp,esp
%endmacro
_start:
    bootstrap
```
```
%macro PRINT 1
    pusha
    pushf
    jmp %%astr        ; labels which defined in macro must start with %%
%%str db %1, 0
%%strln equ $-%%str
%%astr: _syscall_write %%str, %%strln
popf
popa
%endmacro
%macro _syscall_write 2
	mov rax, 1
        mov rdi, 1
        mov rsi, %%str
        mov rdx, %%strln
        syscall
%endmacro
```

Now we can use it:
```
label: PRINT "Hello World!"
```

## Useful standard macros
#### STRUC
```
struc person
   name: resb 10
   age:  resb 1
endstruc

section .data
    p: istruc person
      at name db "name"
      at age  db 25
    iend

section .text
_start:
    mov rax, [p + person.name]
```

#### %include
We can include other assembly files and jump to there labels or call functions with %include directive.

## AT&T syntax
#### Sections
```
.data
    //
    // initialized data definition
    //
.text
    .global _start

_start:
    //
    // main routine
    //
```
```
.section .data
    // 1 byte
    var1: .byte 10
    // 2 byte
    var2: .word 10
    // 4 byte
    var3: .int 10
    // 8 byte
    var4: .quad 10
    // 16 byte
    var5: .octa 10

    // assembles each string (with no automatic trailing zero byte) into consecutive addresses
    str1: .asci "Hello world"
    // just like .ascii, but each string is followed by a zero byte
    str2: .asciz "Hello world"
    // Copy the characters in str to the object file
    str3: .string "Hello world"
```
```
mov source, destination

;;
;; nasm syntax
;;
mov rax, rcx

//
// gas syntax
//
mov %rcx, %rax

movb $10, %rax
```

#### Size of operands and operation syntax
```
mov ax, word [rsi]
movw (%rsi), %ax
```
> GNU assembler has 6 postfixes for operations:
- b - 1 byte operands
- w - 2 bytes operands
- l - 4 bytes operands
- q - 8 bytes operands
- t - 10 bytes operands
- o - 16 bytes operands
> This rule is not only mov instruction, but also for all another like addl, xorb, cmpw and etc…

#### Memory access
```
movq -8(%rbp),%rdi
movq 8(%rbp),%rdi
```
#### Jumps
> Far jump - a jump to an instruction located in a different segment than the current code segment but at the same privilege level, sometimes referred to as an intersegment jump.
```
lcall $section, $offset
```
#### Comments
```
# - single line comments
// - single line comments
/* */ - for multiline comments
```
## How we can use C together with assembler
#### Call assembly from C
```
#include <string.h>

int main() {
	char* str = "Hello World\n";
	int len = strlen(str);
	printHelloWorld(str, len);
	return 0;
}
```
>  When we call function first six parameters passes through rdi, rsi, rdx, rcx, r8 and r9 general purpose registers, all another through the stack. So we can get first and second parameter from rdi and rsi registers and call write syscall and than return from function with ret instruction:
```
global printHelloWorld

section .text
printHelloWorld:
		;; 1 arg
		mov r10, rdi
		;; 2 arg
		mov r11, rsi
		;; call write syscall
		mov rax, 1
		mov rdi, 1
		mov rsi, r10
		mov rdx, r11
		syscall
		ret
```
```
build:
	nasm -f elf64 -o casm.o casm.asm
	gcc casm.o casm.c -o casm
```
#### Inline assembly
```
asm [volatile] ("assembly code" : output operand : input operand : clobbers);
```
> Each operand is described by constraint string followed by C expression in parentheses. There are a number of constraints:
- r - Kept variable value in general purpose register
- g - Any register, memory or immediate integer operand is allowed, except for registers that are not general registers.
- f - Floating point register
- m - A memory operand is allowed, with any kind of address that the machine supports in general.
- and etc…

```
#include <string.h>

int main() {
	char* str = "Hello World\n";
	long len = strlen(str);
	int ret = 0;

	__asm__("movq $1, %%rax \n\t"
		"movq $1, %%rdi \n\t"
		"movq %1, %%rsi \n\t"
		"movl %2, %%edx \n\t"
		"syscall"
		: "=g"(ret)
		: "g"(str), "g" (len));

	return 0;
}
```
```
build:
	gcc casm.c -o casm
```

#### Call C from assembly

``` c
#include <stdio.h>

extern int print();

int print() {
	printf("Hello World\n");
	return 0;
}
```

```
global _start

extern print

section .text

_start:
    call print

	mov rax, 60
	mov rdi, 0
	syscall
```

##  Floating Point Data

**FPU** **SSE**

> There are three floating point data types:
- single-precision
- double-precision
- double-extended precision

> Single-precision floating-point float point data presented in memory:
- sign - 1 bit
- exponent - 8 bits
- mantissa - 23 bits

```
| sign  | exponent | mantissa
|-------|----------|-------------------------
| 0     | 00001111 | 110000000000000000000000
```

> Double precision number is 64 bit of memory where:
- sign - 1 bit
- exponent - 11 bit
- mantissa - 52 bit

> Extended precision is 80 bit numbers where:
- sign - 1 bit
- exponent - 15 bit
- mantissa - 112 bit

#### x87 FPU
> x87 provides following instructions set:
- Data transfer instructions
- Basic arithmetic instructions
- Comparison instructions
- Transcendental instructions
- Load constant instructions
- x87 FPU control instructions

 > Data transfer instructions:
- FDL - load floating point
- FST - store floating point (in ST(0) register)
- FSTP - store floating point and pop (in ST(0) register)

> Arithmetic instructions:
- FADD - add floating point
- FIADD - add integer to floating point
- FSUB - subtract floating point
- FISUB - subtract integer from floating point
- FABS - get absolute value
- FIMUL - multiply integer and floating point
- FIDIV - device integer and floating point

```
section .data
    x dw 1.0

fld dword [x]
```
```
;
;; adds st0 value to st3 and saves it in st0
;;
fadd st0, st3

;;
;; adds x and y and saves it in st0
;;
fld dword [x]
fld dword [y]
fadd
```
```
extern printResult

section .data
	radius    dq  1.7
	result    dq  0

	SYS_EXIT  equ 60
	EXIT_CODE equ 0

global _start
section .text

_start:
	fld qword [radius]
	fld qword [radius]
	fmul

	fldpi
	fmul
	fstp qword [result]

	mov rax, 0
	movq xmm0, [result]
	call printResult

	mov rax, SYS_EXIT
	mov rdi, EXIT_CODE
	syscall
```
```
#include <stdio.h>

extern int printResult(double result);

int printResult(double result) {
	printf("Circle radius is - %f\n", result);
	return 0;
}
```
> We can build it with:
```
build:
	gcc  -g -c circle_fpu_87c.c -o c.o
	nasm -f elf64 circle_fpu_87.asm -o circle_fpu_87.o
	ld   -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc circle_fpu_87.o  c.o -o testFloat1

clean:
	rm -rf *.o
	rm -rf testFloat1
```
