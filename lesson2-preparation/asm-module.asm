    bits 64
    section .data
    extern g_int_outup,g_int_array,output,g_neg_val_array,index,vowel_count,g_char_array
;***************************************************************************
    section .text

;Spočítejte v poli `int g_int_array[15]` sudé čísla. Výsledek vydělte 4 a zbytek uložte do proměnné `int g_int_outup` a tu následně znegujte
    global count_even_numbers
count_even_numbers:
    mov ebx,0       ;index massiva
    mov eax,0       ;schetchik chetnych cisel

.loop:
    cmp ebx,15
    jge .end


    mov ecx,[g_int_array+4*ebx]
    test ecx,1
    jnz .not_even

    inc eax

.not_even:
    inc ebx
    jmp .loop
.end:
    mov edi,4
    mov edx,0
    div edi
    neg edx
    mov dword [g_int_outup],edx
    ret


;Vytvořte funkci, která přesune záporná čísla do pole `int g_neg_val_array[15]`.
    global move_negative_numbers
move_negative_numbers:
    mov ebx,0       ;index massiva
    mov eax,0       ;index noveho massiva

.loop:
    cmp ebx,15
    jge .end


    mov ecx,[g_int_array+4*ebx]
    cmp ecx,0
    jge .positive

    mov dword [g_neg_val_array+4*eax],ecx
    inc eax

.positive:
    inc ebx
    jmp .loop
.end:
    mov dword [index],eax
    ret



    global count_vowel
count_vowel:
    mov eax,0 ;index massiva
    mov ebx,0 ;schetchik glasnych

.loop:
    mov cl,[g_char_array+eax]
    cmp cl,0
    je .end

    mov dl,cl
    or dl,32


    cmp dl,'a'
    je .increment_counter
    cmp dl, 'e'
    je .increment_counter
    cmp dl, 'i'
    je .increment_counter
    cmp dl, 'o'
    je .increment_counter
    cmp dl, 'u'

    jmp .next_char

.increment_counter:
    inc ebx

.next_char:
    inc eax
    jmp .loop

.end:
    mov dword [vowel_count],ebx
    ret


    global replace_third_vowel
replace_third_vowel:
    mov eax,0 ;index massiva
    mov ebx,0 ;schetchik glasnych

.loop:
    mov cl,[g_char_array+eax]
    cmp cl,0
    je .end

    mov dl, cl
    or dl, 32  

    cmp dl, 'a'
    je .increment_counter
    cmp dl, 'e'
    je .increment_counter
    cmp dl, 'i'
    je .increment_counter
    cmp dl, 'o'
    je .increment_counter
    cmp dl, 'u'
    je .increment_counter

    jmp .next_char

.increment_counter:
    inc ebx
    cmp ebx,3
    jne .next_char

    mov ebx,0
    mov byte [g_char_array+eax],'3'


.next_char:
    
    inc eax
    jmp .loop

.end:
    ret