nFak	IS		$0
i		IS		$1
test	IS		$2
limit	IS		5

# for(int i=limit; i >= 0; i--)
# könnte noch kürzer sein, indem i übersprungen wird.

Main	SET		i,limit
		SET		nFak,1
For		BZ		i,End
		MULU	nFak,nFak,i
		SUBU	i,i,1
		JMP		For
End		TRAP	0,Halt,0