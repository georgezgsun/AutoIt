#include <array.au3>

_ArrayDisplay(_GetTaskList()) ; Pass the target computer name for remote clients

Func _GetTaskList($strComputer = @ComputerName)

    If Not Ping($strComputer) Then Return SetError(1, 0, "")
    Local $usr = "", $pass = ""; set this only if different from current user

    ; https://msdn.microsoft.com/en-us/library/aa394372(v=vs.85).aspx
    Local $objWMILocator = ObjCreate("WbemScripting.SWbemLocator")
    Local $objWMIService = $objWMILocator.ConnectServer($strComputer, "\root\cimv2", $usr, $pass, "", "", "&H80")

    Local $colProcesses = $objWMIService.ExecQuery("SELECT * FROM Win32_Process")
    If Not IsObj($colProcesses) Then Return SetError(2, 0, "")

    Local $aProcesses[$colProcesses.count + 1][2] = [[$colProcesses.count, 0]]
    Local $i = 0

    For $objProces In $colProcesses
        $i += 1
        $aProcesses[$i][0] = $objProces.name
        $aProcesses[$i][1] = $objProces.ProcessID
    Next

    Return SetError(0, 0, $aProcesses)
EndFunc	; ==>_GetTaskList