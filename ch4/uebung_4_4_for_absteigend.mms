nFak	IS		$0
i		IS		$1
test	IS		$2
limit	IS		5

# for(int i=limit; i >= 0; i--)
# k�nnte noch k�rzer sein, indem i �bersprungen wird.

Main	SET		i,limit
		SET		nFak,1
For		BZ		i,End
		MULU	nFak,nFak,i
		SUBU	i,i,1
		JMP		For
End		TRAP	0,Halt,0