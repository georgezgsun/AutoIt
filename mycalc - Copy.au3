#include <Constants.au3>

;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon at autoitscript dot com)
;
; Script Function:
;   Plays with the calculator.
;

; Prompt the user to run the script - use a Yes/No prompt with the flag parameter set at 4 (see the help file for more details)
Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "AutoIt Example", "This script will run the calculator and type in 2 x 4 x 8 x 16 and then quit.  Do you want to run it?")

; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox($MB_SYSTEMMODAL, "AutoIt", "OK.  Bye!")
	Exit
EndIf

; Run the calculator
Run("calc.exe")

; Wait for the calculator to become active. The classname "CalcFrame" is monitored instead of the window title
WinWaitActive("[CLASS:ApplicationFrameWindow]")
; Sleep(1000);
ConsoleWrite("Step 1" & @crlf)
Local $mPos = WinGetPos("Calculator")
Local $mTitle = WinGetTitle("ACTIVE")

ControlClick($mTitle,"","ApplicationFrameInputSinkWindow1")

; Now move Mouse to C and click it
MouseClick($MOUSE_CLICK_LEFT,$mPos[0]+80,$mPos[1]+300)
; Now that the calculator window is active type the values 2 x 4 x 8 x 16
; Use AutoItSetOption to slow down the typing speed so we can see it
AutoItSetOption("SendKeyDelay", 400)
Send("2*4*8*16")

MouseClick($MOUSE_CLICK_LEFT,$mPos[0]+420,$mPos[1]+480)
Local $rst = ControlGetText($mTitle,'','ApplicationFrameInputSinkWindow1')
MsgBox($MB_OK, "AutoIt Tester", $rst, 2)

;ControlClick($mTitle,"","ApplicationFrameInputSinkWindow
Sleep(2000)
; Now quit by sending a "close" request to the calculator window using the classname
WinClose("[CLASS:ApplicationFrameWindow]")

; Now wait for the calculator to close before continuing
WinWaitClose("Calculator",10)
MsgBox($MB_OK, "AutoIt Tester", "The testing completed! Bye...", 2)
Exit
; Finished!
