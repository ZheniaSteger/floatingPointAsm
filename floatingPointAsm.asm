# Zhenia Steger
# Floating Point Operations
# Cal State San Marcos

.data
str: .asciiz "Welcome!\n"
str2: .asciiz "Please input a value in Celcius: \n"
str3: .asciiz "The temperature in Farenheight is: "
nine: .float 9.0	# 9 float
five: .float 5.0	# 5 float
thirtytwo: .float 32.0	# 32 float
.text

# Start of main code
main:
# Ask for the number
li $v0, 4
la $a0, str
syscall
la $a0, str2
syscall
# Get Number
li $v0, 5
syscall
# Move to CoProcessor
mtc1 $v0, $f1

# Convert to Floating
cvt.s.w $f1, $f1
l.s $f3, nine
l.s $f4, five
l.s $f5, thirtytwo
# Conversion takes place here:
mul.s $f1, $f1, $f3
div.s $f1, $f1, $f4
add.s $f1, $f1, $f5

# Moving from FPU
li $v0, 4
la $a0, str3
syscall

# Moving back to processor
li $v0, 2
mov.s $f12, $f1

syscall

#li $v0, 2
#mov.s $f12, $f0
#syscall

# Exits correctly
li $v0, 10
syscall
