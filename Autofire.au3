#include <C:\Program Files (x86)\AutoIt3\Include\Misc.au3>
#include <C:\Program Files (x86)\AutoIt3\Include\MsgBoxConstants.au3>
Local $hDLL = DllOpen("user32.dll")

$toggle = 0
$thekey = 0
While $thekey = 0
    Sleep(50)
    For $iX = 1 To 254
        If _IsPressed(Hex($iX), $hDLL) and not _IsPressed("01", $hDLL) Then
            ConsoleWrite("0x" & Hex($iX, 2) & @LF)
			$thekey = Hex($iX, 2)
        EndIf
	 Next
	  if Not $thekey = 0 Then
		 MsgBox(0,"","Slected key is 0x" & $thekey)
		 ExitLoop
	  EndIf
 WEnd

while 1
   if  $toggle = 1 and  _IsPressed("01", $hDLL)  Then
   MouseUp("left") ; Set the left mouse button state as up.
;   Sleep(1)
   MouseDown("left") ; Set the left mouse button state as down.
;   MouseClick ("left")
   EndIf
   Sleep(50)
 ;  Sleep(Random(0,100))
   If _IsPressed($thekey, $hDLL) Then

	  if  $toggle = 1 Then
		 $toggle = 0
		 MsgBox(0,"","Off",0.5)
	  Else
		  $toggle = 1
		  MsgBox(0,"","On",0.5)
	   EndIf
	   ConsoleWrite($toggle)
	   Sleep(500)
   EndIf
WEnd
