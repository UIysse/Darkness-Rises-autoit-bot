#include-once
#include <ImageSearch.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
Global $ImageSearchTolerance = 0
Global Const $_RageSkill = 0x01 ; change this according to your rage skill emulator button
Global Const $_Skill1 = 0x04
Global Const $_Skill2 = 0x06
Global Const $_Skill3 = 0x04
Global Const $_SKillUlt = 0x05
Global Const $_AutoAtk = 0x05
Func SearchImgAndClickNearby ($sString, $Xvalue, $Yvalue)
   Local $Ximg, $Yimg
      Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso, $perso1, $perso2, $test
   $ImageSearchTolerance = 0
      While $perso = 0 And $Inf3 <40 ; 10 sec waiting because long loading can get fucked up by too low timing and mess whole loop
		 $Inf3 += 1
		 Sleep(250)
 		 $perso = _ImageSearch ("coop.png", 1, $Ximg, $Yimg, $ImageSearchTolerance)
		 If $ImageSearchTolerance < 95 Then
		 $ImageSearchTolerance += 5
		 EndIf
		 If $Inf3 > 32 Then
			PubSearchImgAndClick ($sString)
		 EndIf
   WEnd
   $Ximg = $Ximg - $Xvalue
   $Yimg = $Yimg - $Yvalue
   MouseClick( "left", $Ximg, $Yimg, 1)
EndFunc
Func SearchImgAndClick ($sString) ; chercher image et click dessus ; 10 sec sans trouver quitte la fonction
   FileWriteLine($hFileOpen, "Start searching for " & $sString)
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso, $perso1, $perso2, $test
   $ImageSearchTolerance = 0
   While $perso = 0 And $Inf3 <40 ; 10 sec waiting because long loading can get fucked up by too low timing and mess whole loop
		 $Inf3 += 1
		 Sleep(250)
 		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, $ImageSearchTolerance)
		 If $ImageSearchTolerance < 95 Then
		 $ImageSearchTolerance += 5
		 EndIf
		 If $perso = 0 Then
			If $sString = "cannotrestartgolddungeon.png" Then
			   $perso1 = _ImageSearch("cannotrestartgolddungeon1.png", 1, $Xperso, $Yperso, $ImageSearchTolerance)
			   $perso2 = _ImageSearch("cannotrestartgolddungeon2.png", 1, $Xperso, $Yperso, $ImageSearchTolerance)
			   $test = $perso1 + $perso2
			   If $test = 1 Then
				  Return 0;Ok so if we see 1 instead of 0 remaining run, we act like we did not find 0 so we return 0, this is done to win time and not search 0 run for 5 min
			   EndIf
			EndIf
		 EndIf
		 If $Inf3 > 32 Then
			PubSearchImgAndClick ($sString)
		 EndIf
   WEnd
   If $perso = 1 Then
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  			FileWriteLine($hFileOpen, "we found " & $sString)
				return 1
   ElseIf $perso = 0 Then
			FileWriteLine($hFileOpen, "did not find " & $sString)
			return 0
   Else
			FileWriteLine($hFileOpen, "you should never see this line")
			return 0
   EndIf
EndFunc
Func CombatSearchImgAndClick ($sString) ; chercher image et click dessus ; 10 sec sans trouver quitte la fonction
   FileWriteLine($hFileOpen, "Start searching for " & $sString)
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso
   While $perso = 0; And
		 $Inf3 += 1;we assume we will find the img sooner or later
		 Sleep(250)
		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, 85)
		 If $Inf3 <700 Then; 500 ie 4 x 120 (x250 ms) loop iteration ie 2 minutes spent here we stop spamming 1 to prevent gui interference to future img detection // change me later
		 Send($_RageSkill)
		 EndIf
   WEnd
   If $perso = 1 Then
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  FileWriteLine($hFileOpen, "we found " & $sString)
	  return 1
   ElseIf $perso = 0 Then
			FileWriteLine($hFileOpen, "did not find " & $sString)
			return 0
   Else
			FileWriteLine($hFileOpen, "you should never see this line")
			return 0
   EndIf
EndFunc
Func RankedSearchImgAndClick ($sString, $sString2) ; chercher image et click dessus ; 10 sec sans trouver quitte la fonction
   FileWriteLine($hFileOpen, "Start searching for " & $sString)
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso
   While $perso = 0; And
		 $Inf3 += 1;we assume we will find the img sooner or later
		 Sleep(250)
		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, 50)
   WEnd
FileWriteLine($hFileOpen, "we found " & $sString)
Sleep (12500) ; combat qui ult, puis skills 1, 2, 3 et enfin loop autoatk jusqu'à image de fin
Local $i = 0
$Inf3 = 0
$perso = 0
   While $perso = 0; And
		 $Inf3 += 1;we assume we will find the img sooner or later
		    Send("{NUMPADENTER}")
			   Send ($_SKill2)
			      Send($_SKill1)
		 Sleep(25)
		 $perso = _ImageSearch($sString2, 1, $Xperso, $Yperso, 50)
		 If $Inf3 <1200 Then; 30s loop iteration spent here we stop spamming autoatk to prevent gui interference to future img detection // change me later
		 Send($_AutoAtk)
		 EndIf
	  WEnd
   If $perso = 1 Then
	  Sleep (3000)
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  FileWriteLine($hFileOpen, "we found " & $sString2)
	  return 1
   ElseIf $perso = 0 Then
			FileWriteLine($hFileOpen, "did not find " & $sString2)
			return 0
   Else
			FileWriteLine($hFileOpen, "you should never see this line")
			return 0
   EndIf
EndFunc
Func RaidSearchImgAndClick ($sString, $sString2) ; chercher image et click dessus ; 10 sec sans trouver quitte la fonction
   FileWriteLine($hFileOpen, "Start searching for " & $sString)
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso
   While $perso = 0; And
		 $Inf3 += 1;we assume we will find the img sooner or later
		 Sleep(250)
		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, 50)
   WEnd
FileWriteLine($hFileOpen, "we found " & $sString)
Sleep (1000) ; combat qui ult, puis skills 1, 2, 3 et enfin loop autoatk jusqu'à image de fin
Send("{z down}")
Sleep(2000)
Send("{z up}")
Send("{SPACE}")
Local $i = 0
$Inf3 = 0
$perso = 0
   While $perso = 0; And
		 $Inf3 += 1;we assume we will find the img sooner or later
		    Send("{NUMPADENTER}")
			   Send ($_SKill2)
			      Send($_SKill1)
		 Sleep(25)
		 $perso = _ImageSearch($sString2, 1, $Xperso, $Yperso, 50)
		 If $Inf3 <1200 Then; 30s loop iteration spent here we stop spamming autoatk to prevent gui interference to future img detection // change me later
		 Send($_AutoAtk)
		 EndIf
	  WEnd
   If $perso = 1 Then
	  Sleep (3000)
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  FileWriteLine($hFileOpen, "we found " & $sString2)
	  return 1
   ElseIf $perso = 0 Then
			FileWriteLine($hFileOpen, "did not find " & $sString2)
			return 0
   Else
			FileWriteLine($hFileOpen, "you should never see this line")
			return 0
   EndIf
EndFunc
Func PubSearchImgAndClick ($sString) ; chercher image et click dessus ; 10 sec sans trouver quitte la fonction
   $sString = "closepub1.png"
   $sString2 = "closepub2.png"
   FileWriteLine($hFileOpen, "Start searching for " & $sString)
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso
		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, 25)
		 If $perso = 0 Then
			$sString = $sString2;so that we see found right picture in logs
		$perso = _ImageSearch($sString2, 1, $Xperso, $Yperso, 25)
		 EndIf
   If $perso = 1 Then
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  			FileWriteLine($hFileOpen, "we found " & $sString)
				return 1
   ElseIf $perso = 0 Then
			FileWriteLine($hFileOpen, "did not find " & $sString)
			return 0
   Else
			FileWriteLine($hFileOpen, "you should never see this line")
			return 0
   EndIf
EndFunc
Func NakedSearchImgAndClick ($sString) ; chercher image et click dessus ; 10 sec sans trouver quitte la fonction
   $sString = "closepub1.png"
   Local $Inf3 = 0
   Local $perso = 0
   Local $Xperso, $Yperso
   While $perso = 0 And $Inf3 <40 ; 10 sec waiting because long loading can get fucked up by too low timing and mess whole loop
		 $Inf3 += 1
		 Sleep(250)
		 $perso = _ImageSearch($sString, 1, $Xperso, $Yperso, 25)
   WEnd
   If $perso = 1 Then
	  MouseClick( "left", $Xperso, $Yperso, 1)
	  			FileWriteLine($hFileOpen, "we found " & $sString)
				return 1
   EndIf
EndFunc