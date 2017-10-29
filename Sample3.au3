#RequireAdmin
#include <File.au3>
#include <Array.au3>
#include <FileConstants.au3>

Find()

Func Find()

    DirCreate(@ScriptDir & "\_RestoredFiles")

    Local $aFinal[1][2]
    $aFinal[0][0] = "File"
    $aFinal[0][1] = "Time"

    $aFileList = _FileListToArrayRec(@ScriptDir, "*", $FLTAR_FILES, $FLTAR_RECUR, $FLTAR_SORT, $FLTAR_RELPATH)

    For $a = 1 To $aFileList[0]
        _ArrayAdd($aFinal, $aFileList[$a] & "|" & FileGetTime(@ScriptDir & "\" & $aFileList[$a], $FT_CREATED, $FT_STRING))
    Next

    _FileWriteFromArray(@ScriptDir & "\_RestoredFiles\_FileList.csv", $aFinal)

    For $i = 1 To UBound($aFinal) - 1
        If $aFinal[$i][1] > "20140101050099" Then
            ;MsgBox(0, "", @ScriptDir & "\" & $aFinal[$i][0]) ;Debug
            ;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') cmd:' & @ComSpec & ' /c copy "' & @ScriptDir & "\" & $aFinal[$i][0] & '"' & " " & '"' & "C:\Temp\_Move\" & '"' & @CRLF & '>Error code: ' & @error & @CRLF) ;Debug Console
            RunWait(@ComSpec & ' /c copy "' & @ScriptDir & "\" & $aFinal[$i][0] & '"' & " " & '"' & @ScriptDir & "\_RestoredFiles" & '"', "", @SW_HIDE)
            FileWriteLine(@ScriptDir & "\_RestoredFiles\_FilesCopied.csv", $aFinal[$i][0])
        EndIf
    Next

    MsgBox(0, "", "File search done!")

    ;Debug to see array
    ;_ArrayDisplay($aFinal)

EndFunc   ;==>Find