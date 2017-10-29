#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
    ; List all the files and folders in the desktop directory using the default parameters and return the full path.
    Local $aFileList = _FileListToArray(@MyDocumentsDir & "\MyAutoScripts", "*.au3", Default, True)
    If @error = 1 Then
        MsgBox($MB_SYSTEMMODAL, "", "Path was invalid.")
        Exit
    EndIf
    If @error = 4 Then
        MsgBox($MB_SYSTEMMODAL, "", "No file(s) were found.")
        Exit
    EndIf
    ; Display the results returned by _FileListToArray.
    ;_ArrayDisplay($aFileList, "$aFileList")
	Local $i
	For $i = 1 To $aFileList[0]
	  Local $aArray = FileGetTime($aFileList[$i])
	  ConsoleWrite("File " & $aFileList[$i] & " was create at ")
	  ConsoleWrite($aArray[3] & ":" & $aArray[4] & ":" & $aArray[5] & @CRLF)
	  Next
EndFunc   ;==>Example
