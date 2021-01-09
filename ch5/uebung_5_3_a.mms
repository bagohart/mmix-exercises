i		IS		$3
cval	IS		$6
max		IS		$7
block	IS		$1
length	IS		$2
raddr	IS		$0
offset	IS		$5
cmp		IS		$4
vecbeg	IS		$8

		LOC		Data_Segment
		GREG	@
Data1	OCTA	6
		OCTA	1,1000,5,17,4,2000,3000

Data2	OCTA	9
		OCTA	3,2,17,1,9,24,13,12,10

		LOC		#100
		GREG	@
MaxVek	LDO		length,block
		LDA		vecbeg,block,8	# Anfang des Vektors explizit abspeichern, (inlinebar)
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

Main	LDA		block,Data1
		GO		raddr,MaxVek
		LDA		block,Data2
		GO		raddr,MaxVek
		TRAP	0,Halt,0