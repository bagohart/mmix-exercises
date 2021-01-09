# Collatz Folge landet irgendwann bei eins. Dann kann ich aufhören.

n0		IS		$0
ni		IS		$1
i		IS		$2
test	IS		$3

Main	SET		i,0
		SET		n0,7
		SET		ni,n0
For		ADD		i,i,1
		CMP		test,ni,1
		BZ		test,Endfor
		BOD		ni,Odd
Even	DIV		ni,ni,2
		JMP		For
Odd		MUL		ni,ni,3
		ADD		ni,ni,1
		JMP 	For
Endfor	TRAP	0,Halt,0