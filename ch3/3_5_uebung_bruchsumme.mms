# m/n = e/b + c/d = ad+cb / bd

		LOC		Data_Segment
		GREG	@
Xa		OCTA	35
Xb		OCTA	12
Xc		OCTA	79
Xd		OCTA	8
Xm		OCTA	0
Xn		OCTA	0

		LOC		#100
Main	LDO		$1,Xa
		LDO		$2,Xb
		LDO		$3,Xc
		LDO		$4,Xd
		MUL		$5,$1,$4
		MUL		$6,$3,$2
		ADD		$7,$5,$6
		STO		$7,Xm
		MUL		$8,$2,$4
		STO		$8,Xn
		DIV		$9,$7,$8	# Ganzzahldivision.
		TRAP	0,Halt,0