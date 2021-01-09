r		IS		$1
m		IS		$2
n		IS		$3

		LOC		#100
		GREG	@
Main	SET		m,1228
		SET		n,96
Start	DIV		m,m,n		# m wird nicht mehr benötigt
		GET		r,rR		
		BZ		r,Fertig
		SET		m,n
		SET		n,r
		GO		$0,Start

Fertig	TRAP	0,Halt,0	# Ergebnis in $3