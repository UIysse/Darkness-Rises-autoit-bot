#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <OwnImageSearchFunctions.au3>
#include <ImageSearch.au3>

Func FarmRaids ()
FileWriteLine($hFileOpen, "################ Enter FarmRaid function")
Local $FinRaid = 0
Local $Ximg, $Yimg
SearchImgAndClick ('coop.png')
SearchImgAndClick ('raid.png')
Sleep (2500)
FileWriteLine($hFileOpen, "Cherche le paytostart")
$FinRaid = _ImageSearch("paytostart.png",1 ,$Ximg, $Yimg, 75)
If $FinRaid = 0 Then
   FileWriteLine($hFileOpen, "paytostart pas trouvé")
   _ImageSearch ("raid2.png", 1, $Ximg, $Yimg, 75)
   $Ximg = $Ximg - 50
   $Yimg = $Yimg + 130
   MouseMove ($Ximg, $Yimg, 10)
   MouseDown ("left")
   MouseMove ($Ximg + 600 , $Yimg , 5)
   MouseUp ("left")
   MouseMove ($Ximg, $Yimg, 10)
   MouseDown ("left")
   MouseMove ($Ximg + 600 , $Yimg , 5)
   MouseUp ("left")
   MouseMove ($Ximg, $Yimg, 10)
   MouseDown ("left")
   MouseMove ($Ximg + 600 , $Yimg , 5)
   MouseUp ("left")
   MouseMove ($Ximg, $Yimg, 10)
   MouseDown ("left")
   MouseMove ($Ximg + 600 , $Yimg , 5)
   MouseUp ("left")
   MouseMove ($Ximg, $Yimg, 10)
   MouseDown ("left")
   MouseMove ($Ximg + 600 , $Yimg , 5)
   MouseUp ("left")
   MouseMove ($Ximg, $Yimg, 10)
   MouseDown ("left")
   MouseMove ($Ximg + 600 , $Yimg , 5)
   MouseUp ("left")
   MouseMove ($Ximg + 150 , $Yimg, 20)
   MouseClick ("left")
   Sleep (3000)
   SearchImgAndClick ('joincoopraid.png')
   SearchImgAndClick ('raidstartsolo.png')
   RaidSearchImgAndClick ("raidstart.png", "raidrestart.png")
   Sleep (9000) ; fckg loading time, comme tu dirais :p
   Do ;No while loop otherwise takes 5 sec to search cannotrestart whereas we always wanna start this routine
	  $FinRaid = _ImageSearch("paytostart.png",1 ,$Ximg, $Yimg, 75)
	  If $FinRaid = 0 Then
		 FileWriteLine($hFileOpen, "N'a pas trouvé cannot restart, recommence le raid")
		 SearchImgAndClick ('joincoopraid.png')
		 SearchImgAndClick ('raidstartsolo.png')
		 RaidSearchImgAndClick ("raidstart.png", "raidrestart.png")
		 Sleep (9000)
	  Else
		 FileWriteLine($hFileOpen, "A trouvé paytostart, sort du raid")
	  EndIf
   Until $FinRaid = 1
Else
   FileWriteLine($hFileOpen, "paytostart trouvé")
EndIf
SearchImgAndClick ('changefarmsection.png')
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!!! Leave FarmRaid function")
EndFunc