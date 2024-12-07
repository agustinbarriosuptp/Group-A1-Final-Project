Function Main 'The first function enables the I/O buttons
Do While 1
Wait Sw(0) = On
Do While Sw(0) = On
Task3
GoTo endio
Loop
Loop
endio:
Fend

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


Function Task3 'This function contains the task program
Motor On
Power High
Speed 10
Accel 10, 10
SpeedS 250
AccelS 2000

Go Start
HEIGHT = 6
If Sw(7) = On Then
Wait Sw(1) = On
CheckT()
CheckB()
Else
CheckT()
CheckB()
EndIf
If actc = 0 Or acts = 0 Then
If Sw(7) = On Then
    Wait Sw(1) = On
    PickTray()
PlaceTray()
  Else
    PickTray()
PlaceTray()
    EndIf
EndIf
If actc = 0 Then
If Sw(7) = On Then
    Wait Sw(1) = On
C_POS = DetectT
Do While C_POS >= 0
ITEM_TYPE = 0
PickT()
AlignT()
PlaceT()
  C_POS = C_POS - 1
Loop
Else
C_POS = DetectT
Do While C_POS >= 0
ITEM_TYPE = 0
  PickT()
  AlignT()
  PlaceT()
  C_POS = C_POS - 1
Loop

EndIf
ElseIf actc = 1 Then
GoTo Square
EndIf
  Square:
  If acts = 0 Then
  If Sw(7) = On Then
    Wait Sw(1) = On

  S_POS = DetectB
  Do While S_POS >= 0
ITEM_TYPE = 1
  PickB()
  AlignB()
  PlaceB()
  S_POS = S_POS - 1
Loop
Else
  S_POS = DetectB
  Do While S_POS >= 0
ITEM_TYPE = 1
  PickB()
  AlignB()
  PlaceB()
  S_POS = S_POS - 1
Loop
EndIf
ElseIf acts = 1 Then
GoTo End
  EndIf
 
  End:
  Go Start

Fend
Function CheckT 'This function checks how many tokens are between 0 and 3
HEIGHT = 6
C_POS = 2
Go TF +Z(100) CP
  Move TF +Z(C_POS * HEIGHT) CP
  On 8
  Wait 1
  If Sw(16) = On Then
  DetectT = 2
  actc = 0
  ElseIf Sw(16) = Off Then
  C_POS = 1
  Move TF +Z(C_POS * HEIGHT) CP
  Wait 1
  If Sw(16) = On Then
  DetectT = 1
  actc = 0
  ElseIf Sw(16) = Off Then
  C_POS = 0
  Move TF +Z(C_POS * HEIGHT) CP
  Wait 1
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
Function CheckB 'This function checks how many blocks are, between 0 and 3
HEIGHT = 6
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
  S_POS = 0
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
Function PickTray 'This function contains the program to pick the printed tray
Go TRAY_0 +Z(20) CP
Go TRAY_0 CP
On 8
Wait 1
Go TRAY_0 +Z(20) CP
Fend
Function PlaceTray 'This function contains the program to place the printed tray
Go TRAY_0 +X(-50) +Z(20) CP
Go TRAY_1 +Z(20) CP
Go TRAY_1 CP
Wait 0.5
Off 8
Go TRAY_1 +X(11) +Y(10) CP
Go TRAY_1 +X(1) +Y(1) +Z(10) CP
Go TRAY_1 +Z(20) CP
Fend
Function PickT 'This function contains the program to pick the tokens available
Go TF +Z(100) +Y(10) CP
    Move TF +Z(C_POS * HEIGHT) CP
    On 8
    Wait 0.5
    Move TF +Z(C_POS * HEIGHT) +Z(50) +X(-5) CP
 Fend
Function AlignT 'This function aligns the tokens available
Go TA +Z(100) +Y(5) CP
   
    Move TA +X(-2) CP
    Wait 0.5
    Off 8
    Move TA +Z(20) CP
    On 10 'Align via pneumatic cylinder
    Wait 1
    Off 10
    Move TA CP
    On 8
    Wait 1
    Move TA +Z(100) CP
 Fend
Function PlaceT 'This function places the tokens available
Go PT2 +Z(50) +X(C_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(C_POS / 4) CP

Go PT2 +Z(4) +X(C_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(C_POS / 4) CP
Wait 0.5
Move PT2 +X(C_POS * 30) +Y(ITEM_TYPE * 30) +Z(4) CP
Off 8
Wait 0.5
Go PT2 +Z(100) +X(C_POS * 30) +Y(ITEM_TYPE * 30) CP
Wait 1
 Fend
Function PickB 'This function picks the blocks available
Go BF +Z(100) +Y(10) CP
    Move BF +Z(S_POS * HEIGHT) CP
    On 8
    Wait 0.5
    Move BF +Z(S_POS * HEIGHT) +Z(50) +X(-5) +Y(2) CP
 Fend
Function AlignB 'This function aligns the blocks available
  Move BA +Z(100) +Y(5) CP
    Move BA +Y(3) +X(-2) CP
    Wait 0.5
    Off 8
    Go BA +X(11) +Y(-7) CP
    Go BA +X(1) +Y(-1) +Z(10) CP
    Move BA +Z(20) CP
    Move BA CP
    On 8
    Wait 0.5
    Move BA +Z(100) CP
 Fend
Function PlaceB 'This function places the blocks available
  Go PT2 +Z(50) +X(S_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(S_POS / 4) CP

Go PT2 +Z(6) +X(S_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(S_POS / 4) CP
Wait 0.5
Move PT2 +X(S_POS * 30) +Y(ITEM_TYPE * 30) +Z(6)
Off 8
Wait 0.5
Go PT2 +Z(100) +X(S_POS * 30) +Y(ITEM_TYPE * 30)
Wait 0.5
 Fend
