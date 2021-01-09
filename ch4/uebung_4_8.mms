# Primfaktoren einer Zahl finden. etwa so:
# for (i = 1; i<sqrt(n); i++) {
#	if i is prim
#		if n teilt i
#			add n
# aber sqrt kommt erst später, also einfach i^2<n testen. ist halt langsamer.

		LOC		Data_Segment
		GREG	@
RES		OCTA	0
		LOC		Data_Segment+8*100 # Raum für 100 Primfaktoren reicht hoffentlich :)

n		IS		$0
i		IS		$1
test	IS		$2
rz		IS		$3
ra		IS		$4

		LOC		#100
Main	SET		n,12
		SET		i,1
		SET		rz,0
		SET		ra,RES # das geht nicht. ich weiß, aber auch nicht, wie es anders geht. denke, das wird später im kapitel über arrays erklärt. lassen wir das erstmal.
For		MUL		test,i,i
		CMP		test,i,n
		PBN		test,Endfor
		DIV		test,n,i
		GET		test,rR
		PBNZ	test,For
		
		ADD		test,i,ra
		STO		i,test
		
		
Endfor