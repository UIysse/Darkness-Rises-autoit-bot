#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <OwnImageSearchFunctions.au3>
#include <ImageSearch.au3>

Func FarmRanked ()
FileWriteLine($hFileOpen, "################ Enter FarmRanked function")
Local $FinRaid = 0
Local $Ximg, $Yimg
SearchImgAndClickNearby("coop.png", 125, 0)
SearchImgAndClick ('ranked.png')
Sleep (2500)
;FileWriteLine($hFileOpen, "Cherche le paytostart")
$FinRaid = _ImageSearch("rankedpaytostart.png",1 ,$Ximg, $Yimg, 75)
If $FinRaid = 0 Then
      Do ;No while loop otherwise takes 5 sec to search cannotrestart whereas we always wanna start this routine
	  ;$FinRaid = _ImageSearch("paytostart.png",1 ,$Ximg, $Yimg, 75)
  ; FileWriteLine($hFileOpen, "paytostart pas trouvé")
		local $sucessimg = _ImageSearchArea('rankedChoseEnnemy.png', 1, 1466,889, 1723,934, $Ximg, $Yimg, 75)
		If $sucessimg = 1 Then
		 MouseClick( "left", $Ximg, $Yimg, 1)
		 ;SearchImgAndClick ('rankedChoseEnnemy.png')
		 RankedSearchImgAndClick ("raidstart.png", "rankedGoLobby.png")
		 Sleep (9000)
	  EndIf
	  $FinRaid = _ImageSearch("rankedpaytostart.png",1 ,$Ximg, $Yimg, 75)
   Until $FinRaid = 1
Else
   FileWriteLine($hFileOpen, "paytostart trouvé")
EndIf
SearchImgAndClick ('changefarmsection.png')
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave FarmRanked function")
EndFunc