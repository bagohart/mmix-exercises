# Löst nicht das ganze Problem, und nicht alle Spezialfälle. Das wär mir zu doof. lol.

		LOC		Data_Segment
		GREG	@
z0		BYTE	"zero",0
z1		BYTE	"one",0
z2		BYTE	"two",0
z3		BYTE	"three",0
z4		BYTE	"four",0
z5		BYTE	"five",0
z6		BYTE	"six",0
z7		BYTE	"seven",0
z8		BYTE	"eight",0
z9		BYTE	"nine",0
hundred BYTE	"hundred",0
CRLF	BYTE	#a,0
nope	BYTE	"Falsche Zahl!",#a,0
limit	WYDE	999

Adr		IS		$0
Zahl	IS		$1
test	IS		$2
d1		IS		$3
l		IS		$4

		LOC		#100
Main	SET		Zahl,909
		LDW		l,limit
		CMP		test,Zahl,l
		BP		test,fehler
		CMP		test,Zahl,100
		BN		test,Single
		DIV		d1,Zahl,100
		GET		Zahl,rR # für später
		GETA	Adr,table0
		MUL		d1,d1,8
		GO		Adr,Adr,d1
table0	LDA		$255,z0 # das hier wird nie erreicht. naja.
		JMP		out0
		LDA		$255,z1
		JMP		out0
		LDA		$255,z2
		JMP		out0
		LDA		$255,z3
		JMP		out0
		LDA		$255,z4
		JMP		out0
		LDA		$255,z5
		JMP		out0
		LDA		$255,z6
		JMP		out0
		LDA		$255,z7
		JMP		out0
		LDA		$255,z8
		JMP		out0
		LDA		$255,z9
out0	TRAP	0,Fputs,StdOut
		LDA		$255,hundred
		TRAP	0,Fputs,StdOut
#		TRAP	0,Halt,0 # todo
Single	GETA	Adr,table
		MUL		Zahl,Zahl,8
		GO		Adr,Adr,Zahl
table	LDA		$255,z0
		JMP		out
		LDA		$255,z1
		JMP		out
		LDA		$255,z2
		JMP		out
		LDA		$255,z3
		JMP		out
		LDA		$255,z4
		JMP		out
		LDA		$255,z5
		JMP		out
		LDA		$255,z6
		JMP		out
		LDA		$255,z7
		JMP		out
		LDA		$255,z8
		JMP		out
		LDA		$255,z9
out		TRAP	0,Fputs,StdOut
		LDA		$255,CRLF
		TRAP	0,Fputs,StdOut
		TRAP	0,Halt,0
fehler	LDA		$255,nope
		TRAP	0,Fputs,StdOut
		TRAP	0,Halt,0