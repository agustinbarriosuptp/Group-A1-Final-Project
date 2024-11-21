Function Main
taskio()

Fend
Function taskio
Do While 1
Wait Sw(0) = On
If Sw(7) = On Then
Xqt Task1
Do While Sw(0) = On And Sw(7) = On
If Sw(4) = On Then
Halt Task1
Else
Resume Task1
EndIf
Loop
Quit Task1
ElseIf Sw(7) = Off Then
Xqt Task2
Do While Sw(0) = On And Sw(7) = Off
If Sw(4) = On Then
Halt Task2
Else
Resume Task2
EndIf
Loop
Quit Task2
EndIf
Off 8
Wait 3
Go START
Loop
Fend
Integer ITEM_TYPE
Integer ITEM_POS
Integer DIRECTION
Integer HEIGHT


' Task1
Function Task1
Motor On
Power High
Speed 10
Accel 10, 10
SpeedS 250
AccelS 2000
Tool 1
    Go START

HEIGHT = 2
For ITEM_POS = 0 To 2
    ITEM_TYPE = 0 ' Token
    PickAlignPlace()
Next
HEIGHT = 2
For ITEM_POS = 0 To 2
    ITEM_TYPE = 1 ' Block
    PickAlignPlace()
Next


Go START
Fend

' Function to pick, align, and place an item

Function PickAlignPlace

If ITEM_TYPE = 0 Then
    Go TF +Z(100) +Y(10) CP ' Secure Token Feeder
    Move TF +Z(HEIGHT * 6)  ' Token Feeder
    On 8
    Wait 0.5
    Move TF +Z(HEIGHT * 6) +Z(50) +X(-5) CP ' Secure Token Feeder
    HEIGHT = HEIGHT - 1
    Go TA +Z(100) +Y(5) CP ' Secure Token Aligner
    Move TA +X(-2) ' Token Aligner
    Off 8
    Go TA +X(10)
    Go TA +X(10) +Z(10) CP
    Move TA +Z(20) CP ' Secure Token Aligner
    Move TA ' Token Aligner
    On 8
    Wait 0.5
    Move TA +Z(100) CP ' Secure Token Aligner
   
Else ' Block
   
    Go BF +Z(100) +Y(10) CP ' Secure Block Feeder
    Move BF +Z(HEIGHT * 6)  ' Block Feeder
    On 8
    Wait 0.5
    Move BF +Z(HEIGHT * 6) +Z(50) +X(-5) +Y(2) CP
    HEIGHT = HEIGHT - 1
    Move BA +Z(100) +Y(5)  ' Secure Block Aligner
    Move BA +Y(2) +X(-10)  '' Block Aligner
    Off 8
    Go BA +X(11) +Y(-7)
    Go BA +X(1) +Y(-1) +Z(10)
    Move BA +Z(20)  ' Secure Block Aligner
    Move BA +X(-0.3)  ' Block Aligner
    On 8
    Wait 0.5
    Move BA +Z(100)  ' Secure Block Aligner
   
EndIf
       
Go PT2 +Z(50) +X(ITEM_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(ITEM_POS / 4) CP
''Go PT1 +Z(20) +Y(ITEM_POS * 30.7) +X(-ITEM_TYPE * 29.7) +X(-ITEM_POS / 4) CP ' Secure Place
Go PT2 +Z(50) +X(ITEM_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(ITEM_POS / 4) CP
''Go PT1 +Z(50) +Y(ITEM_POS * 30.7) +X(-ITEM_TYPE * 29.7) +X(-ITEM_POS / 4)
Move PT2 +X(ITEM_POS * 30) +Y(ITEM_TYPE * 30) +Z(6)  ' Place
Off 8
Wait 0.5
Go PT2 +Z(100) +X(ITEM_POS * 30) +Y(ITEM_TYPE * 30)  ' Secure Place

Fend
Integer token
Function Task2
Motor On
Power Low
Speed 100
Accel 100, 100
SpeedS 1000
AccelS 10000
Move START
For token = 0 To 9
pointsquare()
stacksquare()
pointtoken()
stacktoken()
Next token
Go START
Fend
Function pointsquare
Go BF +Z(100)
Move BF +Z(54.2 - token * 6)
On 8
Wait 0.5
Move BF +Z(100) +X(-5) +Y(1.5)
Fend
Function stacksquare
Go BA +Z(token * 12 + 50) -X(10) +Y(5)
Move BA +Z(token * 12 + 1) -X(10) +Y(5)
Off 8
Move BA +Z(token * 12 + 50) -X(10) +Y(5)
Fend
Function pointtoken
Go TF +Z(100)
Move TF +Z(54.2 - token * 6)
On 8
Wait 0.5
Move TF +Z(100) +X(-5)
Fend
Function stacktoken
Go BA +Z(token * 12 + 50) -X(10) +Y(5)
Move BA +Z(token * 12 + 6.5) -X(10) +Y(5)
Off 8
Move BA +Z(token * 12 + 50) -X(10) +Y(5)
Fend
