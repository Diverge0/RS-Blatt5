# Verwendung der Register
# $a0 .. Parameter: x
# $a1 .. Parameter: y
# $v0 .. Rueckgabewert: result
# $t0 .. increment
# ... (weitere ergaenzen)

division:
    # Hier MIPS-Code ergaenzen
	add $v0, $zero, $zero #result = 0
	li $t0, 1 #increment = 1
	
	bge $a0, $zero, endif1 #if (x<0)
	nor $t0, $t0, $zero #increment = -increment
	addi $t0, $t0, 1
	nor $a0, $a0, $zero #x = -x
	addi $a0, $a0, 1
endif1:
	bge $a1, $zero, endif2 #if (y<0)
	nor $t0, $t0, $zero #increment = -increment
	addi $t0, $t0, 1
	nor $a1, $a1, $zero #y = -y
	addi $a1, $a1, 1
endif2:
	blt $a0, $a1, endwhile #while (x <=y)
	sub $a0, $a0, $a1 #x = x - y
	add $v0, $v0, $t0 #result = result + increment
	j endif2
endwhile:
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
