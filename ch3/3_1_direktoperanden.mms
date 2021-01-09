		LOC 	#100

Main	SET		$1,4
		SET		$2,2
		MUL		$3,$2,40
		ADD		$3,$3,$1
		SUB		$2,$1,$2
		DIV		$1,$3,$2
		TRAP	0,Halt,0