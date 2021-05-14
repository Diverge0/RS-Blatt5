# Verwendung der Register:
# $a0: Array-Adresse (Parameter a)
# $a1: Array-Laenge (Paramter n)
# $v0: Rueckgabewert
# ... (weitere ergaenzen)

minimum:
    # Hier MIPS-Code ergaenzen
        
    jr    $ra                # return


#
# Testdaten. Zur Kontrolle: Ergebnis sollte -574 sein.
#
    .data
array: .word -5, -17, -3, 22, 120, -1, 14, -254, -574, 0, 7, -97
n:     .word 12


#
# main
#
    .text
    .globl main

main:
    la    $a0, array      # load array and n as arguments
    lw    $a1, n          

    jal   minimum         # jump to subroutine

    move  $a0, $v0        # copy result

    li    $v0, 1          # print result
    syscall

    li $v0, 10
    syscall               # exit

#
# end main
#
