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

