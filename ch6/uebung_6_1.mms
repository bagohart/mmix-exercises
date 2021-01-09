Main	SET		$1,5
		SET		$2,7
		XOR		$1,$2,$1
		XOR		$2,$2,$1
		XOR		$1,$2,$1
		TRAP	0,Halt,0