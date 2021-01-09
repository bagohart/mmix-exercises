		LOC #100
		OCTA #0123456789ABCDEF
		LOC #108
		OCTA #FFFFFFFFFFFF0000

Main	SET		$2,#100
		SET		$3,2
		LDB		$1,$2,$3
		LDW		$1,$2,$3
		LDT		$1,$2,$3
		LDO		$1,$2,$3

		SET		$2,#100
		SET		$3,5
		LDB		$1,$2,$3
		LDW		$1,$2,$3
		LDT		$1,$2,$3
		LDO		$1,$2,$3

		SET		$2,#100
		SET		$3,5
		LDBU	$1,$2,$3
		LDWU	$1,$2,$3
		LDTU	$1,$2,$3
		LDOU	$1,$2,$3

		SET		$2,#100   Die storebefehle verifizieren ist schwieriger.
		SET		$3,8
		LDOU	$1,$2,$3
		STB		$1,$2,16
		LDB		$1,$2,16
		LDOU	$1,$2,$3
		STW		$1,$2,16
		LDW		$1,$2,16
		LDOU	$1,$2,$3
		STT		$1,$2,16
		LDT		$1,$2,16
		LDOU	$1,$2,$3
		STO		$1,$2,16
		LDO		$1,$2,16