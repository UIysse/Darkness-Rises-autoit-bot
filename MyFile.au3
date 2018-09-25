#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#requireadmin
Func OpenMyFile ()
 Local $hFileOpen = FileOpen(@WorkingDir & "\logs.txt", $FO_READ + $FO_OVERWRITE)
 FileWriteLine($hFileOpen, "File Open")
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
        ;Return False
	 Else
		;MsgBox($MB_SYSTEMMODAL, "", "All good.")
		Return $hFileOpen
    EndIf
 EndFunc
