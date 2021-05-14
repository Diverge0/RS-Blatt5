# Verwendung der Register
# $a0 .. Parameter: x
# $a1 .. Parameter: y
# $v0 .. Rückgabewert: result
# ... (weitere ergaenzen)

division:
    # Hier MIPS-Code ergaenzen

	jr   $ra               # return (result in $v0)


#
# Testdaten. Zur Kontrolle: Ergebnis sollte -8 sein.
#
    .data
x:     .word -26
y:     .word 3

#
# main
#
	.text
	.globl main

main:
	lw	$a0, x
	lw	$a1, y

	jal	division		# jump to subroutine

	move	$a0, $v0  
	li	$v0, 1			# print result
	syscall

	li	$v0, 10
	syscall				# exit

#
# end main
#
