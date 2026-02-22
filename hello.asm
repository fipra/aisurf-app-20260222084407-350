section .data
    msg db 'Hello, World!', 0xa  ; El mensaje con un salto de línea (0xa)
    len equ $ - msg             ; Cálculo de la longitud del mensaje

section .text
    global _start               ; Punto de entrada para el enlazador

_start:
    ; Escribir el mensaje en stdout (sys_write)
    mov rax, 1                  ; número de llamada al sistema para sys_write
    mov rdi, 1                  ; descriptor de archivo 1 es stdout
    mov rsi, msg                ; puntero al mensaje
    mov rdx, len                ; longitud del mensaje
    syscall                     ; llamada al kernel

    ; Salir del programa (sys_exit)
    mov rax, 60                 ; número de llamada al sistema para sys_exit
    xor rdi, rdi                ; código de salida 0
    syscall                     ; llamada al kernel