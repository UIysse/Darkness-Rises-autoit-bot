#requireadmin
#include <GuiConstants.au3>
#include <GuiEdit.au3>
#include <MyFile.au3>
#include <DR duo dungeons.au3>
#include <DR gold dungeons.au3>
#include <DR infinity tower.au3>
#include <DR daily dungeon.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <DR raids.au3>
#include <DR ranked.au3>
#include <DR timer.au3>
#include <ChangeCharacter.au3>
; To do : auto buy guild instant tickets / auto donate to guild. Daily dungeon. Daily wheel of fate
Global $hFileOpen = OpenMyFile() ; ugly global definition but somehow all other files can see it without including this main script file #shitcodinglanguage
Global $bDoDuoDungeons = 0
Global $bDoGoldDungeons = 0
Global $bDoRaids = 0
Global $bDoInfinityTower = 0
Global $bDoDailyDungeon = 0
Global $bDoAllCharacters = 0
Global $bDoRanked = 0
Global $EditBox;
RunMyGui()

Func MainFarm ()
   $TimeToWait = _GUICtrlEdit_GetLine($EditBox, 0)
   TimerFunction($TimeToWait)
   Local $CharacterNumber = 0
   FileWriteLine($hFileOpen, "################ Start MainFarm function")
   While $CharacterNumber < 4
If $bDoDuoDungeons Then
   FarmDuo ()
EndIf
If $bDoGoldDungeons Then
   FarmGoldDungeon ()
EndIf
If $bDoRaids Then
   Farmraids ()
EndIf
If $bDoInfinityTower Then
   FarmInfinityTower ()
EndIf
If $bDoDailyDungeon Then
   FarmDailyDungeon ()
EndIf
If $bDoRanked Then
   FarmRanked ()
EndIf
$CharacterNumber += 1
If $bDoAllCharacters = 0 Then
   $CharacterNumber = 4
Else
ChangeCharacter($CharacterNumber)
If $CharacterNumber = 4 Then ; added after to loop farm 09.10.18
   $CharacterNumber = 0
EndIf
EndIf
WEnd
FileWriteLine($hFileOpen, "!!!!!!!!!!!!!!!! End MainFarm function")
EndFunc


Func _IsChecked($idControlID)
    Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked
Func RunMyGui()
    ; Create a GUI with various controls.
	;GUICreate ( "title" [, width [, height [, left = -1 [, top = -1 [, style = -1 [, exStyle = -1 [, parent = 0]]]]]]] )
    Local $hGUI = GUICreate("NUlysse", 190, 260, 0, 0)
	;GUICtrlCreateButton ( "text", left, top [, width [, height [, style = -1 [, exStyle = -1]]]] )
	;Start Farm button ; Note : Default Style
	$EditBox = GUICtrlCreateEdit("Timer", 30, 190, 150, 25, $ES_MULTILINE+$ES_AUTOVSCROLL+$WS_VSCROLL )
	;_GUICtrlEdit_InsertText ($EditBox, "Minutes", 0)
    Local $idStartFarm = GUICtrlCreateButton("Start Farm", 60, 230, 85, 25)
	;Checkboxes ; Note : style = 0x02
    Local $idDuoDungeons = GUICtrlCreateCheckbox("Duo Dungeons", 30, 10, 150, 25)
	Local $idGoldDungeons = GUICtrlCreateCheckbox("Gold Dungeons", 30, 35, 150, 25)
    Local $idRaids = GUICtrlCreateCheckbox("Raids", 30, 60, 150, 25)
	Local $idInfinityTower = GUICtrlCreateCheckbox("Infinity Tower", 30, 85, 150, 25)
	Local $idDailyDungeon = GUICtrlCreateCheckbox("Daily Dungeon", 30, 110, 150, 25)
    Local $idRanked = GUICtrlCreateCheckbox("Ranked", 30, 135, 150, 25)
	Local $idAllCharacters = GUICtrlCreateCheckbox("On all characters", 30, 160, 150, 25)
    ; Display the GUI.
    GUISetState(@SW_SHOW, $hGUI)

    ; Loop until the user exits.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE ;##
                ExitLoop
			 Case $EditBox ;##

			 Case $idDuoDungeons ;##
			   If _IsChecked($idDuoDungeons) Then
                $bDoDuoDungeons = 1
			 Else
				$bDoDuoDungeons = 0
			EndIf
			 Case $idGoldDungeons ;##
			   If _IsChecked($idGoldDungeons) Then
                $bDoGoldDungeons = 1
			 Else
				$bDoGoldDungeons = 0
			 EndIf
			 Case $idRaids ;##
			   If _IsChecked($idRaids) Then
                $bDoRaids = 1
			 Else
				$bDoRaids = 0
			 EndIf
			 Case $idInfinityTower ;##
			   If _IsChecked($idInfinityTower) Then
                $bDoInfinityTower = 1
			 Else
				$bDoInfinityTower = 0
			 EndIf
			 Case $idRanked ;##
			   If _IsChecked($idRanked) Then
                $bDoRanked = 1
			 Else
				$bDoRanked = 0
			 EndIf
			   Case $idDailyDungeon ;##
			   If _IsChecked($idDailyDungeon) Then
                $bDoDailyDungeon = 1
			 Else
				$bDoDailyDungeon = 0
			 EndIf
			 Case $idAllCharacters ;##
			   If _IsChecked($idAllCharacters) Then
                $bDoAllCharacters = 1
			 Else
				$bDoAllCharacters = 0
			 EndIf
		  Case $idStartFarm ;##
			 MainFarm ()
        EndSwitch
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)
EndFunc   ;==>Example