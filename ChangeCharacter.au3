#include-once
#include <ImageSearch.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>


Func ChangeCharacter ( $CharNumber)
   $sString = "changecharacter1.png"
   FileWriteLine($hFileOpen, "Start searching for " & $sString)
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso
   While $perso = 0 And $Inf3 <80 ; 20 sec waiting because long loading can get fucked up by too low timing and mess whole loop
		 $Inf3 += 1
		 Sleep(250)
		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, 75)
   WEnd
   If $perso = 1 Then
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  			FileWriteLine($hFileOpen, "we found " & $sString)
   ElseIf $perso = 0 Then
			FileWriteLine($hFileOpen, "did not find " & $sString)
			return 0
   Else
			FileWriteLine($hFileOpen, "you should never see this line")
			return 0
		 EndIf
		 Sleep(500);else clicks too fast
		 Switch $CharNumber
		 Case 1
			FileWriteLine($hFileOpen, "Switching to character " & $CharNumber)
			MouseClick( "left", $Xperso + 110, $Yperso, 1)
		 Case 2
						FileWriteLine($hFileOpen, "Switching to character " & $CharNumber)
			MouseClick( "left", $Xperso + 220, $Yperso, 1)
		 Case 3
						FileWriteLine($hFileOpen, "Switching to character " & $CharNumber)
			MouseClick( "left", $Xperso + 330, $Yperso, 1)
		 EndSwitch
		 SearchImgAndClick ('changecharacter2.png')
		 return 1
EndFunc

