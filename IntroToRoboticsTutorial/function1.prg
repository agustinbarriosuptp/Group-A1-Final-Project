Integer ITEM_TYPE
Integer ITEM_POS
Integer DIRECTION
Integer HEIGHT
Integer C_POS
Integer S_POS
Integer actc
Integer acts
Integer DetectT
Integer DetectB


Function Main
Motor On
Power High
Speed 10
Accel 10, 10
SpeedS 250
AccelS 2000
Tool 1
    Go Start
    HEIGHT = 6
    CheckT()
    CheckB()
    	If actc = 0 Or acts = 0 Then
		PickTray()
		PlaceTray()
	EndIf
	If actc = 0 Then
		For C_POS = DetectT To 0
		ITEM_TYPE = 0
 		 PickT()
 		 AlignT()
 		 PlaceT()
	 	Next
	ElseIf actc = 1 Then
		GoTo Square
	EndIf
 	Square:
 	If acts = 0 Then
 		For S_POS = DetectB To 0
 		ITEM_TYPE = 1
 		PickB()
 		AlignB()
 		PlaceB()
	 	Next
	ElseIf acts = 1 Then
	 	GoTo End
 	EndIf
 	End:
 	Go Start

Fend
Function CheckT
	C_POS = 2
	Go TF +Z(100) CP
 	Go TF +Z(C_POS * HEIGHT) CP
 	On 8
 	Wait 0.5
 	If Sw(16) = On Then
 		DetectT = 2
 		actc = 0
 	ElseIf Sw(16) = Off Then
 		C_POS = 1
 		Go TF +Z(C_POS * HEIGHT) CP
 		Wait 0.5
 		If Sw(16) = On Then
 			DetectT = 1
 			actc = 0
 		ElseIf Sw(16) = Off Then
 			C_POS = 0
 			Go TF +Z(C_POS * HEIGHT) CP
 			Wait 0.5
 			If Sw(16) = On Then
 				DetectT = 0
 				actc = 0
 			ElseIf Sw(16) = Off Then
 				actc = 1
 			EndIf
 		EndIf
 	EndIf
 	Off 8
 	Wait 0.5
 	Move TF +Z(100) CP

Fend
Function CheckB
	S_POS = 2
	Go BF +Z(100)
 	Go BF +Z(S_POS * HEIGHT)
 	On 8
 	Wait 0.5
 	If Sw(16) = On Then
 		DetectB = 2
 		acts = 0
 	ElseIf Sw(16) = Off Then
 		S_POS = 1
        Go BF +Z(S_POS * HEIGHT)
 		Wait 0.5
 		If Sw(16) = On Then
 			DetectB = 1
 			acts = 0
 		ElseIf Sw(16) = Off Then
 			S_POS = 2
 			Go BF +Z(S_POS * HEIGHT)
 			Wait 0.5
 			If Sw(16) = On Then
 				DetectB = 0
 				acts = 0
 			ElseIf Sw(16) = Off Then
 				acts = 1
 			EndIf
 		EndIf
 	EndIf
 	Off 8
 	Wait 0.5
 	Move BF +Z(100) CP
Fend
Function PickTray
	Go TRAY_0 +Z(20) CP
	Go TRAY_0 CP
	On 8
	Wait 1
	Go TRAY_0 +Z(20) CP
Fend
Function PlaceTray
	Go TRAY_1 +Z(20) CP
	Go TRAY_1 CP
	Wait 0.5
	Off 8
	Go TRAY_1 +X(11) +Y(7) CP
	Go TRAY_1 +X(1) +Y(1) +Z(10) CP
	Go TRAY_1 +Z(20) CP
Fend
Function PickT
Go TF +Z(100) +Y(10) CP ' Secure Token Feeder
    Move TF +Z(C_POS * HEIGHT) CP  ' Token Feeder
    On 8
    Wait 0.5
    Move TF +Z(C_POS * HEIGHT) +Z(50) +X(-5) CP ' Secure Token Feeder
 Fend
Function AlignT
Go Ta +Z(100) +Y(5) CP ' Secure Token Aligner
    Move Ta +X(-2) CP
    Off 8
    Move Ta +X(-2) +Z(20) CP ' Token Aligner
    On 10
    Wait 1
    Off 10
    'Go TA +X(10)
    'Go TA +X(10) +Z(10) CP
    Move Ta +Z(20) CP ' Secure Token Aligner
    Move TACP ' Token Aligner
    On 8
    Wait 0.5
    Move Ta +Z(100) CP ' Secure Token Aligner
 Fend
Function PlaceT
Go PT2 +Z(50) +X(C_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(C_POS / 4) CP 'Secure Place

Go PT2 +Z(50) +X(C_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(C_POS / 4) CP

Move PT2 +X(POS_POS * 30) +Y(ITEM_TYPE * 30) +Z(5) CP ' Place
Off 8
Wait 0.5
Go PT2 +Z(100) +X(C_POS * 30) +Y(ITEM_TYPE * 30) CP  ' Secure Place

 Fend
Function PickB
Go BF +Z(100) +Y(10) CP ' Secure Block Feeder
    Move BF +Z(S_POS * HEIGHT) CP ' Block Feeder
    On 8
    Wait 0.5
    Move BF +Z(S_POS * HEIGHT) +Z(50) +X(-5) +Y(2) CP
 Fend
Function AlignB
  Move BA +Z(100) +Y(5) CP  ' Secure Block Aligner
    Move BA +Y(2) +X(-10) CP  '' Block Aligner
    Off 8
    Go BA +X(11) +Y(-7) CP
    Go BA +X(1) +Y(-1) +Z(10) CP
    Move BA +Z(20) CP  ' Secure Block Aligner
    Move BA +X(-0.3) CP  ' Block Aligner
    On 8
    Wait 0.5
    Move BA +Z(100) CP
 Fend
Function PlaceB
 	Go PT2 +Z(50) +X(S_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(S_POS / 4) CP 'Secure Place

Go PT2 +Z(50) +X(S_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(S_POS / 4) CP

Move PT2 +X(S_POS * 30) +Y(ITEM_TYPE * 30) +Z(6)  ' Place
Off 8
Wait 0.5
Go PT2 +Z(100) +X(S_POS * 30) +Y(ITEM_TYPE * 30)  ' Secure Place
 Fend
' Function to pick, align, and place an item
'Function PickAlignPlace

'If ITEM_TYPE = 0 Then
    'Go TF +Z(100) +Y(10) CP ' Secure Token Feeder
    'Move TF +Z(C_POS * HEIGHT)  ' Token Feeder
    'On 8
    'Wait 0.5
    'Move TF +Z(C_POS * HEIGHT) +Z(50) +X(-5) CP ' Secure Token Feeder
    'HEIGHT = HEIGHT - 1
    'Go TA +Z(100) +Y(5) CP ' Secure Token Aligner
    'Move TA +X(-2)
    'Off 8
    'Move TA +X(-2) +Z(20) ' Token Aligner
    'On 10
    'Wait 1
    'Off 10
    'Go TA +X(10)
    'Go TA +X(10) +Z(10) CP
    'Move TA +Z(20) CP ' Secure Token Aligner
   ' Move TA ' Token Aligner
    'On 8
    'Wait 0.5
    'Move TA +Z(100) CP ' Secure Token Aligner
   
'Else ' Block
   
    'Go BF +Z(100) +Y(10) CP ' Secure Block Feeder
    'Move BF +Z(S_POS * HEIGHT)  ' Block Feeder
    'On 8
    'Wait 0.5
    'Move BF +Z(S_POS * HEIGHT) +Z(50) +X(-5) +Y(2) CP
    'HEIGHT = HEIGHT - 1
    'Move BA +Z(100) +Y(5)  ' Secure Block Aligner
    'Move BA +Y(2) +X(-10)  '' Block Aligner
    'off 8
    'Go BA +X(11) +Y(-7)
    'Go BA +X(1) +Y(-1) +Z(10)
    'Move BA +Z(20)  ' Secure Block Aligner
    'Move BA +X(-0.3)  ' Block Aligner
    'On 8
    'Wait 0.5
    'Move BA +Z(100)  ' Secure Block Aligner
   
'EndIf
       
'Go PT2 +Z(50) +X(ITEM_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(ITEM_POS / 4) CP 'Secure Place

'Go PT2 +Z(50) +X(ITEM_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(ITEM_POS / 4) CP

'Move PT2 +X(ITEM_POS * 30) +Y(ITEM_TYPE * 30) +Z(6)  ' Place
'Off 8
'Wait 0.5
'Go PT2 +Z(100) +X(ITEM_POS * 30) +Y(ITEM_TYPE * 30)  ' Secure Place

'end
