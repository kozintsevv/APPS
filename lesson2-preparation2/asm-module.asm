    bits 64
    section .data
    extern bits,zero
;***************************************************************************
    section .text


;Spočítejte, kolik bitů je v proměnné long bits = 0x1010101010101010 nastaveno na 0. Použijte shr a and.
    global count_zero
count_zero:
    mov cl,0      ; индекс для того чтобы пройти каждый бит/ на сколько позиций сдвиг
    mov edi,0     ; счетчик нулей

.loop:
    mov rax,[bits] ;число 0x1010101010101010 в регистре rax
    cmp cl,64 ; цикл чтобы пройти 64 бита 
    jge .end

    shr rax,cl
    and rax,1

    jnz .next_bite

    inc edi

.next_bite:
    inc cl
    jmp .loop

.end:
    mov dword [zero],edi
    ret
