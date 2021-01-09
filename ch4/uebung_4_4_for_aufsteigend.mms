nFak	IS		$0
i		IS		$1
test	IS		$2
limit	IS		5

# fakultät. aufwärts zählen, for schleife
# for (i = 1; i <= limit; i++)

Main	SET		i,0
		SET		nFak,1
For		ADDU	i,i,1
		SUB		test,i,limit
		BP		test,End
		MUL		nFak,nFak,i
		JMP		For
End		TRAP	0,Halt,0
		