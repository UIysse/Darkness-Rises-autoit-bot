#include-once
#include <OwnImageSearchFunctions.au3>
Func FarmDailyDungeon ()
FileWriteLine($hFileOpen, "################ Enter DailyDungeonFarm function")
SearchImgAndClick ('pve.png')
SearchImgAndClick ('dailydungeon.png')
SearchImgAndClick ('begindailydungeon.png') ; same images as for gold dungeon dailydungeonrestart
CombatSearchImgAndClick ('dailydungeonrestart.png')
Sleep(150)
SearchImgAndClick ('changefarmsection.png')
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave DailyDungeonFarm function")
EndFunc