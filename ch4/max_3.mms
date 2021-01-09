max		IS		$0
test	IS		$4

		LOC		#100
Main	SET		$1,27
		SET		$2,44
		SET		$3,13
Start	SET		max,$1
		CMP		test,max,$2
		CSN		max,test,$2
		CMP		test,max,$3
		CSN		max,test,$3
Fertig	TRAP	0,Halt,0