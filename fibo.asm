bits 64
default rel

segment .data
    index db "%d: ", 0x9, 0
    result db "%d", 0xd, 0xa, 0

segment .text
    global main
    extern ExitProcess
    extern printf

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    mov     r12, 15
    
    test    r12, r12
    jz      .zero

    mov     rbx, 1
    mov     rsi, 1
    mov     rdi, 1
    
    lea     rcx, [index]
    mov     rdx, rbx
    call    printf

    lea     rcx, [result]
    mov     rdx, rsi
    call    printf

.for_loop:
    cmp     r12, rbx
    je      .end_loop

    inc     rbx

    add     rsi, rdi

    xor     rsi, rdi        ; xor swap
    xor     rdi, rsi
    xor     rsi, rdi

    lea     rcx, [index]
    mov     rdx, rbx
    call    printf

    lea     rcx, [result]
    mov     rdx, rsi
    call    printf
    
    jmp     .for_loop

.zero:
    mov eax, 1

.end_loop:
    xor     rax, rax
    call    ExitProcess
