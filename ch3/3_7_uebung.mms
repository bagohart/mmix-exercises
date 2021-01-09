		LOC #100
		GREG	@
		OCTA	-65536

Main	LDO 	$1,#100
# das war verboten. jetzt so wie erlaubt:
		SET		$1,0
		SET		$2,65535
		SUB		$1,$1,$2
		SUB		$1,$1,1