# lil_assembly
A lil' bit of assembly (some assembly scripts to do very basic things)

Quickstart
==========
To run any of the _.s_ scripts, it's just a few steps:
- Step 0: install assembler 'as' and linker 'ld' to compile the assembly code into machine code  
`sudo apt install gcc`

Then (each time you update the code), for `hello_world.s` for example,
- Step 1: assemble this script 
- Step 2: compile it (invoke the linker to convert `hello_world.o` into an executable ELF)
- Step 3: run!
- Step 4 (optional): check return value (e.g. an error code)

`as hello_world.s -o hello_world.o`  
`gcc -o hello_world hello_world.o -nostdlib -static`  
`./hello_world`  
`echo $?`  
