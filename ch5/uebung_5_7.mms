		LOC		Data_Segment
		GREG	@
OutBuf	BYTE	0,0

		LOC		#100
		GREG	@

		PREFIX	PutChr:

:PutChr	LDA		$255,:OutBuf
		STB		$1,$255,0
		TRAP	0,:Fputs,:StdOut
		GO		$0,$0,0

		PREFIX	:

Newline	IS		10

Main	SET		$1,Newline
		GO		$0,PutChr
		TRAP	0,Halt,0