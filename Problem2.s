         .data
array:   .word      9, 72, 101, 108, 108, 111, 13, 10, 0
nline:   .asciiz    "\n"
         .globl     main
         .text
main:   
         la         $t0, array    # Load address of first element
         lw         $t1, 0($t0)   # Load first element
loop:    beq        $t1, $zero, exit 
         li         $v0, 11       # System call code for print_char
         move       $a0, $t1
         syscall                  # Print the current character
         li         $v0, 4        # System call code for print string
         la         $a0, nline    # Load address of newline character
         syscall
         addi       $t0, $t0, 4   # Advance the address
         lw         $t1, 0($t0)   # Load the new element
         j          loop          # Repeat the loop
exit:    li         $v0, 10       # System call code for terminate 
         syscall                  # return control to system