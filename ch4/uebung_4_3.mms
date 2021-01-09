sum		IS		$1
i		IS		$2
test	IS		$3
limit	IS		5

Main	SET		sum,0
		SET		i,0
Start	ADDU	i,i,1
		ADDU	sum,sum,i
		SUBU	test,i,limit
		PBNZ	test,Start
Fertig	TRAP	0,Halt,0