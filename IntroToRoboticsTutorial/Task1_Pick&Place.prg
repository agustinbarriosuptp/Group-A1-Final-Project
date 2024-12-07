Integer ITEM_TYPE
Integer ITEM_POS
Integer DIRECTION
Integer HEIGHT


' Task1 is the Pick&Place task
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
    Go TF +Z(100) +Y(10) CP 
    Move TF +Z(HEIGHT * 6)  
    On 8
    Wait 0.5
    Move TF +Z(HEIGHT * 6) +Z(50) +X(-5) CP 
    HEIGHT = HEIGHT - 1
    Go TA +Z(100) +Y(5) CP 
    Move TA +X(-2) 
    Off 8
    Go TA +X(10)
    Go TA +X(10) +Z(10) CP
    Move TA +Z(20) CP 
    Move TA 
    On 8
    Wait 0.5
    Move TA +Z(100) CP 
   
Else ' Block
   
    Go BF +Z(100) +Y(10) CP 
    Move BF +Z(HEIGHT * 6)  
    On 8
    Wait 0.5
    Move BF +Z(HEIGHT * 6) +Z(50) +X(-5) +Y(2) CP
    HEIGHT = HEIGHT - 1
    Move BA +Z(100) +Y(5)  
    Move BA +Y(2) +X(-10)  
    Off 8
    Go BA +X(11) +Y(-7)
    Go BA +X(1) +Y(-1) +Z(10)
    Move BA +Z(20)  
    Move BA +X(-0.3)  
    On 8
    Wait 0.5
    Move BA +Z(100)  
   
EndIf
       
Go PT2 +Z(50) +X(ITEM_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(ITEM_POS / 4) CP 

Go PT2 +Z(50) +X(ITEM_POS * 29.5) +Y(ITEM_TYPE * 30) +Y(ITEM_POS / 4) CP

Move PT2 +X(ITEM_POS * 30) +Y(ITEM_TYPE * 30) +Z(6)  
Off 8
Wait 0.5
Go PT2 +Z(100) +X(ITEM_POS * 30) +Y(ITEM_TYPE * 30)  

Fend
