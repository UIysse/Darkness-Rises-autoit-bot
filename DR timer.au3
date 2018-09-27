#include-once
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
Func TimerFunction ($Minutes) ; Note, this function will only wait a given amount of minutes (not seconds)
FileWriteLine($hFileOpen, "################ Enter Timer function")

Local $60Count = 0, $begin = TimerInit()
While $Minutes > $60Count

    $dif = TimerDiff($begin)
    $dif2 = StringLeft($dif, StringInStr($dif, ".") -1)
    $Count = int($dif/1000)
    $60Count = Int($Count / 60)

    ToolTip("Minutes Required = " & $Minutes & @CRLF & "Minutes Past = " & $60Count & @CRLF & "Seconds Count = " & $Count & @CRLF & "Mili-Seconds Count = " & $dif2, 20, 20, "Time Machine #1", 1)

    Sleep(20)

WEnd

;MsgBox(64, "Time-Up!!", "Your " & $Minutes & " minutes have passed    ")
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave Timer function")
EndFunc