i		IS		$3
cval	IS		$6
max		IS		$7
param	IS		$1
length	IS		$2
raddr	IS		$0
offset	IS		$5
cmp		IS		$4

		LOC		Data_Segment
		GREG	@
OutBuf	OCTA	1,1000,5,17,4,2000,3000

		LOC		#100
		GREG	@
MaxVek	SET		i,0 # das könnte man noch 'inlinen', aber naja.
		SET		max,0
For		CMP		cmp,i,length
		BNN		cmp,Return
		MUL		offset,i,8
		LDO		cval,param,offset
		CMP		cmp,max,cval
		CSN		max,cmp,cval
		ADD		i,i,1
		JMP		For
Return	GO		raddr,raddr,0

Main	LDA		param,OutBuf
		SET		length,6 # nur teil des vektors untersuchen geht.
		GO		raddr,MaxVek
		TRAP	0,Halt,0