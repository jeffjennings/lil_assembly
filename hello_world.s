# hello_world assembly routine on linux
# follows https://www.youtube.com/watch?v=6S5KRJv-7RU&ab_channel=LowLevelLearning, 
# with some additions

# expose symbol 'start' to the linker to tell it 
# where the code starts
.global _start
.intel_syntax noprefix

_start:
    # move the value 128 into the rdi register
    mov rdi, 128
    # move the value in the rsi register into the rdi register
    mov rsi, rdi

    # load: move object from memory into register
    # (treating the object in rsi as a pointer)
    # mov rdi, qword ptr [rsi]
    # store: move object in register into memory
    # mov qword ptr [rsi], rdi

    # put appropriate value in registers for given syscall
    # (https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
    # and https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit).
    # e.g., invoke 'sys_write' to print 'Hello world':
    mov rax, 1
    # file descriptor 1
    mov rdi, 1 
    # load effective address (lea) of buffer containing string
    lea rsi, [hw_buff]
    # length of buffer string "Hello, World!\n"
    mov rdx, 14
    syscall

    mov rax, 0 
    mov rdi, 1


    # to invoke 'sys_exit', rax should store 60 and rdi should store a user-chosen error code
    # returned on exit
    mov rax, 60
    mov rdi, 99
    syscall 

# define hello world buffer
hw_buff:
    .asciz "Hello, World!\n"
