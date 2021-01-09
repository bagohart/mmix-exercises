# long fib(long n) {
#	if (n<2) return 1
#	else return fib(n-2) + fib(n-1)
# }
# ohne Optimierung die stumpfe rekursive Lösung.
# im Buch steht * statt + :)

# leichte optimierung mit stack trickserei. (ob das was bringt?)
# und register.

# todo: lokale scopes mit :

BOS		GREG	#3000000000000000
SP		GREG	0

n		IS		$0
f1		IS		$1
f2		IS		$2
NumLoc	IS		3
# weitere reduktionen erfordern speicherzugriffe
# -> das wär dann wahrscheinlich kein gewinn mehr.

		LOC		#100
		GREG	@

Fibo	SUB		SP,SP,8*NumLoc
		STO		$0,SP,0		# Rücksprungadresse und andere Register sichern
		STO		$1,SP,8
		STO		$2,SP,16
		
		LDO		n,SP,8*NumLoc	# Parameter vom Stack auslesen

		CMP		f1,n,2	# Rekursionsende?
		BP		f1,Rek
		SET		n,1
		JMP		Ende

Rek		SUB		n,n,1	# f(n-1) berechnen
		SUB		SP,SP,8
		STO		n,SP,0
		GO		$0,Fibo	# Achtung: überschreibt n. (könnte man ändern)
		LDO		f1,SP,0
		
		LDO		n,SP,8*NumLoc+8 # achtung: optimiertrick
		SUB		n,n,2	# f(n-2) berechnen, ginge auch einfacher
		STO		n,SP,0	# benutzt Rückgabeplatz von oben (trick)
		GO		$0,Fibo
		LDO		f2,SP,0
		ADD		SP,SP,8

		ADD		n,f1,f2

Ende	STO		n,SP,8*NumLoc	# Ergebnis auf den Stack schreiben (über Parameter)
		LDO		$0,SP,0		# Register wiederherstellen
		LDO		$1,SP,8
		LDO		$2,SP,16
		ADD		SP,SP,8*NumLoc
		GO		$0,$0,0

					
Main	SET		SP,BOS

		SET 	$1,7	# 1,1,2,3,5,8,13,...
		SUB		SP,SP,8
		STO		$1,SP,0
		SET		$1,#23	# zum testen, ob register restore tut
		SET		$2,#42
		SET		$3,#7
		SET		$4,#101

		GO		$0,Fibo

		LDO		$1,SP,0	# ergebnis vom stack lesen
		ADD		SP,SP,8	# stack verkleinern
		TRAP	0,Halt,0
		
