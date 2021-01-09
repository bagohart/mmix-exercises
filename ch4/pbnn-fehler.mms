		LOC		#100
z		IS		$0
test	IS		$1

		LOC		#100
		GREG	@
X		BYTE	"X",0
# ^ moved it here to fix the bug.
Main	SET		z,11
#...
		CMP		test,z,10
		BN		test,1F
		SUB		z,z,10
		GREG	@
#X		BYTE	"h",0 # this is interpreted as an instruction because lol.
		LDA		$255,X
		TRAP	0,Fputs,StdOut
1H		JMP		@+12