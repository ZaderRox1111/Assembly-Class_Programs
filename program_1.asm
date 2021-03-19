.data
num1:	.word	0	#creating the empty labels for num1, num2, and max
num2:	.word	0
max:	.word	0

msg:	.asciiz "Enter an integer"	#Creating the messages
msg2:	.asciiz "The bigger value is"

.text

.globl main
main:

li		$v0,4			#printing out the first message
la		$a0,msg
syscall

li		$v0,5			#reading in an integer value then storing it into num1
syscall
sw		$v0,num1

li		$v0,4			#printing out the message again
la		$a0,msg
syscall

li		$v0,5			#reading in an integer then storing it in num2
syscall
sw		$v0,num2

lw		$s1,num1		#loading the num values
lw		$s2,num2
ble		$s1,$s2,else	#Jump to else if num1 <= num2, otherwise continue
sw		$s1,max			#store num1 value into max
j		endif			#leave the if statement, skip over else

else:
sw		$s2,max			#else statement

endif:

li		$v0,4			#printing out the second message
la		$a0,msg2
syscall

lw		$s3,max			#loading in the max into a register
li		$v0,1			#print out the max value
move	$a0,$s3
syscall

li		$v0,10
syscall
