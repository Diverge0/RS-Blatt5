# Verwendung der Register
# $a0 .. Parameter: Adresse des Arrays im Speicher
# $a1 .. Parameter: i
# $a2 .. Parameter: j
# ... (weitere ergaenzen)

swap:
    # Hier MIPS-Code ergaenzen

    jr   $ra              # return


#
# Testdaten. Zur Kontrolle: Ergebnis sollte 0623451789 sein.
#
    .data
array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
n:     .word 10
i:     .word 1
j:     .word 6

#
# main
#
	.text
	.globl main

main:
	la	$a0, array		# load array and n as arguments
	lw	$a1, i		  
	lw	$a2, j		  

	jal	swap			# jump to subroutine

	move	$a2, $a0
	lw	$a1, n		  
	
	add	$t0,$zero,$zero
main_for:
	bge	$t0,$a1,end_mfor
	sll	$t1,$t0,2
	add	$t1,$t1,$a2
	lw	$a0, 0($t1)
	li	$v0, 1			# print result
	syscall
	addi	$t0,$t0,1
	j	main_for

end_mfor:
	li	$v0, 10
	syscall				# exit

#
# end main
#
