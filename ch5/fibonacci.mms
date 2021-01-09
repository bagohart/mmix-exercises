# long fib(long n) {
#	if (n<2) return 1
#	else return fib(n-2) + fib(n-1)
# }
# ohne Optimierung die stumpfe rekursive Lösung.
# im Buch steht * statt + :)

# todo: lokale scopes mit :

BOS		GREG	#3000000000000000
SP		GREG	0

n		IS		$0
test	IS		$1
f		IS		$2
f1		IS		$3
f2		IS		$4
NumLoc	IS		5

		LOC		#100
		GREG	@

Fibo	SUB		SP,SP,8*NumLoc
		STO		$0,SP,0		# Rücksprungadresse und andere Register sichern
		STO		$1,SP,8
		STO		$2,SP,16
		STO		$3,SP,24
		STO		$4,SP,32

		LDO		n,SP,8*NumLoc	# Parameter vom Stack auslesen

		CMP		test,n,2	# Rekursionsende?
		BP		test,Rek
		SET		f,1
		JMP		Ende

Rek		SUB		n,n,1	# f(n-1) berechnen
		SUB		SP,SP,8
		STO		n,SP,0
		GO		$0,Fibo	# Achtung: überschreibt n. (könnte man ändern)
		LDO		f1,SP,0
		ADD		SP,SP,8	# wegoptimierbar

		LDO		n,SP,8*NumLoc
		SUB		n,n,2	# f(n-2) berechnen, ginge auch einfacher
		SUB		SP,SP,8
		STO		n,SP,0
		GO		$0,Fibo
		LDO		f2,SP,0
		ADD		SP,SP,8

		ADD		f,f1,f2
		JMP		Ende	# kann man weglassen

Ende	STO		f,SP,8*NumLoc	# Ergebnis auf den Stack schreiben (über Parameter)
		LDO		$0,SP,0		# Register wiederherstellen
		LDO		$1,SP,8
		LDO		$2,SP,16
		LDO		$3,SP,24
		LDO		$4,SP,32
		ADD		SP,SP,8*NumLoc
		GO		$0,$0,0

					# 1,1,2,3,5,8,13,...
Main	SET		SP,BOS

		SET 	$1,7	# 5 müsste 5 ergeben. für 6 -> 8
		SUB		SP,SP,8
		STO		$1,SP,0
		SET		$1,#23	# zum testen, ob register restore tut
		SET		$2,#42

		GO		$0,Fibo

		LDO		$1,SP,0	# ergebnis vom stack lesen
		ADD		SP,SP,8	# stack verkleinern
		TRAP	0,Halt,0
		
