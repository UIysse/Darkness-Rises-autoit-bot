#include-once
#include <OwnImageSearchFunctions.au3>
Func FarmGoldDungeon ()
   FileWriteLine($hFileOpen, "################ Enter FarmGoldDungeon function")
   Local $Var = 0
SearchImgAndClick ('pve.png')
SearchImgAndClick ('golddungeon.png')
Do ;No while loop otherwise takes 5 sec to search cannotrestart whereas we always wanna start this routine
SearchImgAndClick ('begingolddungeon.png')
CombatSearchImgAndClick ('golddungeonrestart.png')
$Var = SearchImgAndClick('cannotrestartgolddungeon.png')
Until $Var = 1
SearchImgAndClick ('changefarmsection.png')
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave FarmGoldDungeon function")
EndFunc