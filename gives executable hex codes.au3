Example()

Func Example()
WinActivate("Sans titre - Bloc-notes")
Sleep(100)
Local $vVariable = 0
   send ("0x")
while($vVariable < 30)
   $vVariable = $vVariable+1
   send ("{RIGHT}")
      send ("{RIGHT}")
         send ("{RIGHT}")
		 send("{BACKSPACE}")
		    send (", 0x")
		 Sleep(1)
   WEnd
    ; Close the Notepad window using the handle returned by WinWait.
    WinClose($hWnd)

    ; Now a screen will pop up and ask to save the changes, the classname of the window is called
    ; "#32770" and simulating the "TAB" key to move to the second button in which the "ENTER" is simulated to not "save the file"
    WinWaitActive("[CLASS:#32770]")
    Sleep(500)
    Send("{TAB}{ENTER}")
EndFunc   ;==>Example