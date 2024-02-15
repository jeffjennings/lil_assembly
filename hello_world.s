# hello_world assembly routine on linux

# step 0 - install assembler 'as' and linker 'ld' to compile 
# assembly code into machine code:
# sudo apt install gcc
# step 1 - assemble this script via: 
# as hello_world.s -o hello_world.o
# step 2 - compile this script 
# (invoke linker to convert *.o into an executable ELF) via:
# gcc -o hello_world hello_world.o -nostdlib -static
# step 3 - run via:
# hello_world
# step 4 - check output via:
# echo $?
# ===================

#  expose symbol 'start' to the linker to tell it 
# where the code starts
.global _start
.intel_syntax noprefix

_start:
    # move the value 128 into the rdi register
    mov rdi, 128
    # move the value in the rsi register into the rdi register
    mov rsi, rdi

    # must put appropriate value in registers for given syscall
    # (https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/).
    # e.g., to invoke 'sys_exit', rax must have 60 and rdi must have error code
    # we want processor to return on exit
    mov rax, 60
    mov rdi, 99
    syscall 

# load: move object from memory into register
# (treating the object in rsi as a pointer)
    # mov rdi, qword ptr [rsi]
# store: move object in register into memory
    # mov qword ptr [rsi], rdi