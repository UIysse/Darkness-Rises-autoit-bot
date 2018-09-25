#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <OwnImageSearchFunctions.au3>

Func FarmDuo ()
FileWriteLine($hFileOpen, "################ Enter FarmDuo function")
Local $SimpleVariable = 0
Local $Ximg, $Yimg
SearchImgAndClick ('coop.png')
SearchImgAndClick ('coop2.png')
Sleep (1500)
$SimpleVariable = _ImageSearch("paytostart.png",1 ,$Ximg, $Yimg, 75)
If $SimpleVariable = 0 Then
   FileWriteLine($hFileOpen, "paytostart pas trouvé")
   SearchImgAndClick ('joincoop.png')
   Do ;No while loop otherwise takes 5 sec to search cannotrestart whereas we always wanna start this routine
   CombatSearchImgAndClick('restartduo.png') ; fight over when we find this button
   $SimpleVariable = SearchImgAndClick('cannotrestart.png')
   FileWriteLine($hFileOpen, "$SimpleVariable value is " & $SimpleVariable)
   Until $SimpleVariable = 1
Else
   FileWriteLine($hFileOpen, "paytostart trouvé")
   EndIf
SearchImgAndClick ('changefarmsection.png')
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave FarmDuo function")
EndFunc