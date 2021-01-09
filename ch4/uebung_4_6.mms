z		IS		$0
test	IS		$1
		LOC		Data_Segment
		GREG	@
String	BYTE	0,#A,0

		LOC		#100
Main	SETL	z,9
		CMP		test,z,10
		BN		test,Number
		SUB		z,z,10
		ADD		z,z,'A'
		JMP		Store
Number	ADD		z,z,'0'
Store	STB		z,String
		LDA		$255,String
		TRAP	0,Fputs,StdOut
		TRAP	0,Halt,0