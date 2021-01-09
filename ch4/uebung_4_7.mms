x1		IS		$1
x2		IS		$2
x3		IS		$3
h		IS		$0

# ich glaub, das ist insertionsort unrolled ^_^

Main	SET		x1,5
		SET		x2,7
		SET		x3,1
Cmp12	CMP		h,x1,x2
		BNP		h,Cmp13
		SET		h,x1
		SET		x1,x2
		SET		x2,h
Cmp13	CMP		h,x1,x3
		BNP		h,Cmp23
		SET		h,x1
		SET		x1,x3
		SET		x3,h
Cmp23	CMP		h,x2,x3
		BNP		h,Fertig
		SET		h,x2
		SET		x2,x3
		SET		x3,h
Fertig	TRAP	0,Halt,0