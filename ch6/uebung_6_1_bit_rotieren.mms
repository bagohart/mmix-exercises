# Aus Fragen zur Lernkontrolle:
# Wie können Sie ein Bitmuster rotieren,
# d.h. die links (rechts) rausgeschobenen
# Bits wieder hereinziehen, anstatt mit
# Nullen aufzufüllen?

# Lösungsidee:
# rauszuschiebende bits erst nach rechts schieben,
# separat abspeichern, am ende draufaddieren

# links rausschieben implementiert

		@Data_Segment
anz		IS		8
val		IS		$1
numBit	IS		$2
raus	IS		$3
rechts	IS		$4
shval	IS		$5

Main	SET		numBit,64
		SETL	val,#7788
		INCML	val,#5566
		INCMH	val,#3344
		INCH	val,#1122

		SUB		rechts,numBit,anz
		SR		raus,val,rechts
		SL		shval,val,anz
		ADD		shval,shval,raus
		TRAP	0,Halt,0
		
		