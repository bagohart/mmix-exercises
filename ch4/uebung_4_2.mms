n		IS		$1
r		IS		$2
zero	IS		$0

		LOC		#100
Main	SET		n,5
		SET		zero,0
Start	BOD		n,Odd
		SET		r,1
		JMP		Fertig
Odd		SUB		r,zero,1
Fertig	TRAP	0,Halt,0