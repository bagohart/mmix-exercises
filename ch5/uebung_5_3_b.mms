i		IS		$3
cval	IS		$6
max		IS		$7
block	IS		$1
length	IS		$2
raddr	IS		$0
offset	IS		$5
cmp		IS		$4
vecbeg	IS		$8
vecba	IS		$9

		LOC		Data_Segment
		GREG	@
Data1	OCTA	6
		OCTA	Vek1
Data2	OCTA	9
		OCTA	Vek2
Vek1	OCTA	1,1000,5,17,4,2000,3000
Vek2	OCTA	3,2,17,1,9,24,13,12,10

		LOC		#100
		GREG	@
MaxVek	LDO		length,block
		LDA		vecba,block,8	# vecba enthält jetzt Adresse auf Adresse des Vektors
		LDO		vecbeg,vecba	# das ist der unterschied zu 5.3.a
		SET		i,0 # das könnte man noch 'inlinen', aber naja.
		SET		max,0
For		CMP		cmp,i,length
		BNN		cmp,Return
		MUL		offset,i,8
		LDO		cval,vecbeg,offset
		CMP		cmp,max,cval
		CSN		max,cmp,cval
		ADD		i,i,1
		JMP		For
Return	GO		raddr,raddr,0
# max in den block zu schreiben ist einfacher, wenn nicht der
# ganze vektor direkt im block steht!

Main	LDA		block,Data1
		GO		raddr,MaxVek
		LDA		block,Data2
		GO		raddr,MaxVek
		TRAP	0,Halt,0