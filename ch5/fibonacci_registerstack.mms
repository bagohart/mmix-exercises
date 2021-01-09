# long fib(long n) {
#	if (n<2) return 1
#	else return fib(n-2) + fib(n-1)
# }
# ohne Optimierung die stumpfe rekursive Lösung.
# im Buch steht * statt + :)

# wie die erste Variante, aber mit Registerstack
# statt normalem stack für den unterprogrammaufruf

n		IS		$0
test	IS		$1
f		IS		$2
f1		IS		$3
f2		IS		$4
retadd	IS		$5
NumLoc	IS		6
arg		IS		$7
res		IS		$6

		LOC		#100
		GREG	@

Fibo	GET		retadd,rJ
		CMP		test,n,2	# Rekursionsende?
		BP		test,Rek
		SET		f,1
		JMP		Ende

Rek		SUB		arg,n,1	# f(n-1) berechnen
		PUSHJ	$NumLoc,Fibo	# Achtung: überschreibt n. (könnte man ändern)
		SET		f1,res

		SUB		arg,n,2	# f(n-2) berechnen, ginge auch einfacher
		PUSHJ	$NumLoc,Fibo
		SET		f2,res

		ADD		f,f1,f2
		PUT		rJ,retadd
		JMP		Ende	# kann man weglassen

Ende	SET		$0,f
		POP		1,0		# nur 1 Rückgabewert, den ich vorher in $0s chreiben muss
					# 1,1,2,3,5,8,13,...
Main	SET 	$1,7	# 5 -> 5, 6 -> 8, 7 -> 13
		
		PUSHJ	$0,Fibo

		SET		$3,$0	# Ergebnis auslesen

		TRAP	0,Halt,0
		
