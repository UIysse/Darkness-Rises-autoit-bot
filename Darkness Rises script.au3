#include <ImageSearch.au3>
#include <MsgBoxConstants.au3>
#include <OwnImageSearchFunctions.au3>
#requireadmin
Global Const $_RageSkill = 0x01
;/////////////////////////////////////////////////////////////////////////////////
WinActivate("BlueStacks")
Do ;No while loop otherwise takes 5 sec to search cannotrestart whereas we always wanna start this routine
SearchImgAndClick ('coop.png')
SearchImgAndClick ('coop2.png')
SearchImgAndClick ('joincoop.png')
CombatSearchImgAndClick('restartduo.png') ; fight over when we find this button
Sleep(150)
Until SearchImgAndClick('cannotrestart.png') = 0