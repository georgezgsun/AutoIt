Example()

Func Example()
    ; Run Notepad
    Run("notepad.exe")

    ; Wait 10 seconds for the Notepad window to appear.
    Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

    ; Disable the edit control of Notepad using the handle returned by WinWait.
    ControlDisable($hWnd, "", "Edit1")

    ; Wait for 2 seconds.
    Sleep(1000)

    ; Enable the edit control of Notepad using the handle returned by WinWait.
    ControlEnable($hWnd, "", "Edit1")

    ; Send a string of text to the edit control of Notepad. The handle returned by WinWait is used for the "title" parameter of ControlSend.
    ControlSend($hWnd, "", "Edit1", "This is some text by CopTrax")

    ; Wait for 2 seconds.
    Sleep(2000)

    ; Close the Notepad window using the handle returned by WinWait.
    WinClose($hWnd)
   WinWaitActive("[CLASS:#32770]")
   ;Sleep(500)
   ;Send("{TAB}{ENTER}")


   ControlCommand("[CLASS:#32770]", "", "Button2","TabRight", "")
   Sleep(1000)
   Send("{ENTER}")
EndFunc   ;==>Example
