#include <MsgBoxConstants.au3>
#RequireAdmin

If IsAdmin() Then
    MsgBox($MB_SYSTEMMODAL, "", "IsAdmin" & @CRLF & "Admin rights are detected.")
EndIf
