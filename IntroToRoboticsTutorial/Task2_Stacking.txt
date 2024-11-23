Integer token
Function Task2 'Task2 is the Stacking task
Motor On
Power Low
Speed 100
Accel 100, 100
SpeedS 1000
AccelS 10000
Move START
For token = 0 To 9
pickblock()
stackblock()
picktoken()
stacktoken()
Next token
Go START
Fend
Function pickblock
Go BF +Z(100)
Move BF +Z(54.2 - token * 6)
On 8
Wait 0.5
Move BF +Z(100) +X(-5) +Y(1.5)
Fend
Function stackblock
Go BA +Z(token * 12 + 50) -X(10) +Y(5)
Move BA +Z(token * 12 + 1) -X(10) +Y(5)
Off 8
Move BA +Z(token * 12 + 50) -X(10) +Y(5)
Fend
Function picktoken
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
