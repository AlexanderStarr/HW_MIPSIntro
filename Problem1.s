         .data
myName:  .asciiz    "Alexander Starr"
         .globl     main
         .text
main:
         li         $v0, 4       # System call code for Print String
         la         $a0, myName  # load address of myName into $a0
         syscall                 # Print the myName message

         li         $v0, 10      # System call code for terminate 
         syscall                 # return control to system