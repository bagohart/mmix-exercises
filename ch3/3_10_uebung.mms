		LOC		Data_Segment
		GREG	@
Buffer	BYTE	0
		LOC		Buffer+80	Puffer anlegen
Arg		OCTA	Buffer
		OCTA	80			Puffergröße

		LOC		#100
Main	LDA		$255,Arg	$255 <- #2000000000000050
		TRAP	0,Fgets,StdIn	Einlesen
#		TRAP	0,Halt,0

# jetzt wieder ausgeben
		LDA		$255,Buffer
		TRAP	0,Fputs,StdOut
		TRAP	0,Halt,0