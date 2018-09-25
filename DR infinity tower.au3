#include-once
#include <OwnImageSearchFunctions.au3>
Func FarmInfinityTower ()
Local $Done, $X, $Y
$Done = 0
FileWriteLine($hFileOpen, "################ Enter FarmInfinityTower function")
SearchImgAndClick ('pve.png')
SearchImgAndClick ('infinity.png')
Sleep (1000)
$Done = _ImageSearch ("towerdone.png", 1, $X, $Y, 50)
If $Done = 0 Then
   FileWriteLine($hFileOpen, "Tower not done")
   SearchImgAndClick ('instantclear.png')
   SearchImgAndClick ('instantclear2.png')
   CombatSearchImgAndClick ('instantclearok.png')
Else
      FileWriteLine($hFileOpen, "Tower already done")
EndIf
SearchImgAndClick ('changefarmsection.png')
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave FarmInfinityTower function")
EndFunc