# Prompts for a value of n.  If within the range of the alphabet (1-26),
# then it returns the corresponding letter.  Otherwise, it returns '?'
         .data
prompt:  .asciiz    "Enter the value of n here: "
reply:   .asciiz    "The letter is: "
qmark:   .asciiz    "?"
         .globl     main
         .text
main:
         li         $v0, 4       # System call code for print_string
         la         $a0, prompt  # Load the address of the prompt
         syscall                 # Print the prompt
         li         $v0, 5       # System call code for read_int
         syscall                 # Read the int (result stored in $v0)
         move       $t1, $v0     # Store entered int in $t1
         li         $t2, 27      # Set upper bound
         slt        $t3, $zero, $t1
                                 # If 0 < $t1, then $t4 = 1. Else $t4 = 0
         beq        $t3, $zero, fail
                                 # Go to fail block if $t1 is below range
         slt        $t3, $t1, $t2
                                 # If $t1 < 27, then $t4 = 1. Else $t4 = 0
         beq        $t3, $zero, fail
                                 # Go to fail block if $t1 is above range

success: li         $v0, 4       # System call code for print_string
         la         $a0, reply   # Load the address of the reply
         syscall                 # Print the reply
         addi       $t1, $t1, 64 # Offset $t1 to ASCII alphabet start
         li         $v0, 11      # System call code for print_char
         move       $a0, $t1     # Pass the character code as an arg
         syscall                 # Print the letter
         j          exit         # Skip the failure block

fail:    li         $v0, 4       # System call code for print_string
         la         $a0, qmark   # Load the address of the question mark
         syscall                 # Print the question mark

exit:    li         $v0, 10      # System call code for exit
         syscall                 # Return control to the system