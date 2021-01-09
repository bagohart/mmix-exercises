		LOC		Data_Segment
		GREG	@

String	BYTE	"Text",#A,0

		LOC		#100
Main	LDA		$255,String		Adresse String nach $255
		TRAP	0,Fputs,StdOut	Ausgabe der Zeichenkette
		TRAP	0,Halt,0