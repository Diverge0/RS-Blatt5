# By Mahjoub, Robert, Henning
# $a0 .. Parameter Adresse des Arrays im Speicher
# $a1 .. Parameter Anzahl der Elemente im Array
# $t0 .. i
# $t1 .. j
# $t7 .. temporary storage for array values
# $s0 .. temp
# $s2 .. &a[i]
# $s3 .. $a[j]

foo:
    add $t0, $zero, $zero # i = 0
fori:
    bge $t0, $a1, endfori
    add $s0, $zero, $zero # temp = 0
    move $t1, $t0 # j = i
forj: 
    bge $t1, $a1, endforj
    sll $s3, $t1, 2
    add $s3, $s3, $a0 # s3 = &a[j]
    lw $t7, 0($s3) # load value of a[j]
    add $s0, $s0, $t7 # temp += a[j]
    addi $t1, $t1, 1 # j++
    j forj
endforj:
    sll $s2, $t0, 2
    add $s2, $s2, $a0 # s2 = &a[i]
    sw $s0, 0($s2) # a[i] = temp
    addi $t0, $t0, 1 # i++
    j fori
endfori:
    jr    $ra            # return (j=n in $v0)

#
# Testdaten. Zur Kontrolle: Ergebnis sollte 55425914819 sein.
#
    .data
array: .word 0, 1, 2, -3, -4, -5, 6, 7, -8, 9
n:     .word 10


#
# main
#
    .text
    .globl main

main:
    la     $a0, array      # load array and n as arguments
    lw     $a1, n          

    jal    foo             # jump to subroutine
    
    move   $a2, $a0
    
    add    $t0,$zero,$zero
main_for:
    bge    $t0,$a1,end_mfor
    sll    $t1,$t0,2
    add    $t1,$t1,$a2
    lw     $a0, 0($t1)
    li     $v0, 1          # print result
    syscall
    addi   $t0,$t0,1
    j      main_for
end_mfor:
    li $v0, 10
    syscall                # exit

#
# end main
#
