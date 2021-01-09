		LOC 	#100

Main	SET		$1,4
		SET		$2,2
		SET		$3,40
		MUL		$4,$2,$3
		ADD		$5,$4,$1
		SUB		$6,$1,$2
		DIV		$7,$5,$6
		TRAP	0,Halt,0