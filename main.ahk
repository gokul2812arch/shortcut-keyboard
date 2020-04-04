SetWorkingDir, C:\AHK\003_keyboard
Menu, Tray, Icon, shell32.dll, 283 ;tray icon is now a little keyboard, or piece of paper or something


global guiName = "k_Keyboard made by gokul"
global mouseInMonitorIndex = 0

;DEFAULT STATES
SetCapsLockState, off
SetNumLockState, on
 
;include __________________________________________________________________________________

#Include GUI.ahk   ; gui should be included in first 
;include __________________________________________________________________________________

;setup __________________________________________________________________________________

#NoEnv
SendMode Input
#InstallKeybdHook
#InstallMouseHook
#UseHook On
#SingleInstance force ;only one instance may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;this may prevent taskbar flashing.
detecthiddenwindows, on

;setup close________________________________________________________________________________________



modifierTextDefault(){
	
	; fn keys 
		GuiControl, Text, Static3,`n`nF1		
		GuiControl, Text, Static4,`n`nF2
		GuiControl, Text, Static5,`n`nF3
		GuiControl, Text, Static6,`n`nF4
		GuiControl, Text, Static7,`n`nF5
		GuiControl, Text, Static8,`n`nF6
		GuiControl, Text, Static9,`n`nF7
		GuiControl, Text, Static10,`n`nF8
		GuiControl, Text, Static11,`n`nF9
		GuiControl, Text, Static12,`n`nF10
		GuiControl, Text, Static13,`n`nF11
		GuiControl, Text, Static14,`n`nF12
		
	; numbers 
		GuiControl, Text, Static23,`n`n1
		GuiControl, Text, Static24,`n`n2
		GuiControl, Text, Static25,`n`n3
		GuiControl, Text, Static26,`n`n4
		GuiControl, Text, Static27,`n`n5
		GuiControl, Text, Static28,`n`n6
		GuiControl, Text, Static29,`n`n7
		GuiControl, Text, Static30,`n`n8
		GuiControl, Text, Static31,`n`n9
		GuiControl, Text, Static32,`n`n0	
	
	; letters 
		;first row 
			GuiControl, Text, Static41,`n`nQ
			GuiControl, Text, Static42,`n`nW
			GuiControl, Text, Static43,`n`nE
			GuiControl, Text, Static44,`n`nR
			GuiControl, Text, Static45,`n`nT
			GuiControl, Text, Static46,`n`nY
			GuiControl, Text, Static47,`n`nU
			GuiControl, Text, Static48,`n`nI
			GuiControl, Text, Static49,`n`nO
			GuiControl, Text, Static50,`n`nP
		;second row 
			GuiControl, Text, Static58,`n`nA
			GuiControl, Text, Static59,`n`nS
			GuiControl, Text, Static60,`n`nD
			GuiControl, Text, Static61,`n`nF
			GuiControl, Text, Static62,`n`nG
			GuiControl, Text, Static63,`n`nH
			GuiControl, Text, Static64,`n`nJ
			GuiControl, Text, Static65,`n`nK
			GuiControl, Text, Static66,`n`nL
		;third row 
			GuiControl, Text, Static75,`n`nZ
			GuiControl, Text, Static76,`n`nX
			GuiControl, Text, Static77,`n`nC
			GuiControl, Text, Static78,`n`nV
			GuiControl, Text, Static79,`n`nB
			GuiControl, Text, Static80,`n`nN
			GuiControl, Text, Static81,`n`nM
			
	; first row 
		GuiControl, Text, Static2,`n`nEsc
		GuiControl, Text, Static15,`n`nPrtScr
		GuiControl, Text, Static16,`n`nInsert
		GuiControl, Text, Static17,`n`nDelete
		
	; second row 
		GuiControl, Text, Static22,`n`n``
		GuiControl, Text, Static33,`n`n-
		GuiControl, Text, Static34,`n`n=
		GuiControl, Text, Static35,`n`nBackspace
		
	; third row 
		GuiControl, Text, Static40,`n`nTab
		GuiControl, Text, Static51,`n`n[
		GuiControl, Text, Static52,`n`n]
		GuiControl, Text, Static53,`n`n\
		
	; fourth row 
		GuiControl, Text, Static57,`n`nCapsLock
		GuiControl, Text, Static67,`n`n`;
		GuiControl, Text, Static68,`n`n'
		GuiControl, Text, Static69,`n`nEnter 
		
	; fifth row 
		GuiControl, Text, Static74,`n`nShift
		GuiControl, Text, Static82,`n`n,
		GuiControl, Text, Static83,`n`n.
		GuiControl, Text, Static84,`n`n/
		GuiControl, Text, Static85,`n`nShift 
	
	;sixth row 
		GuiControl, Text, Static89,`n`nCtrl
		GuiControl, Text, Static90,`n`nfn 
		GuiControl, Text, Static91,`n`nWin 
		GuiControl, Text, Static92,`n`nAlt
		GuiControl, Text, Static93,`n`nSpace
		GuiControl, Text, Static94,`n`nAlt
		GuiControl, Text, Static95,`n`nCtrl
		
	; numpad 
		; numbers 
			GuiControl, Text, Static96,`n`n0
			GuiControl, Text, Static86,`n`n1
			GuiControl, Text, Static87,`n`n2
			GuiControl, Text, Static88,`n`n3
			GuiControl, Text, Static70,`n`n4
			GuiControl, Text, Static71,`n`n5
			GuiControl, Text, Static72,`n`n6
			GuiControl, Text, Static54,`n`n7
			GuiControl, Text, Static55,`n`n8
			GuiControl, Text, Static56,`n`n9
		
		; first row 
			GuiControl, Text, Static18,`n`nPgUp
			GuiControl, Text, Static19,`n`nPgDn
			GuiControl, Text, Static20,`n`nHome
			GuiControl, Text, Static21,`n`nEnd
			
		; Second row 
			GuiControl, Text, Static36,`n`nNum
			GuiControl, Text, Static37,`n`n/
			GuiControl, Text, Static38,`n`n*
			GuiControl, Text, Static39,`n`n-
		
		; last 
			GuiControl, Text, Static73,`n`n+
			GuiControl, Text, Static98,`n`nEnter
			GuiControl, Text, Static97,`n`n.
}

disableTextDefault(){
GuiControl, Disable, Static2
GuiControl, Disable, Static3 		
GuiControl, Disable, Static4 
GuiControl, Disable, Static5 
GuiControl, Disable, Static6 
GuiControl, Disable, Static7 
GuiControl, Disable, Static8 
GuiControl, Disable, Static9 
GuiControl, Disable, Static10 
GuiControl, Disable, Static11 
GuiControl, Disable, Static12 
GuiControl, Disable, Static13 
GuiControl, Disable, Static14 
GuiControl, Disable, Static23 
GuiControl, Disable, Static24 
GuiControl, Disable, Static25 
GuiControl, Disable, Static26 
GuiControl, Disable, Static27 
GuiControl, Disable, Static28 
GuiControl, Disable, Static29 
GuiControl, Disable, Static30 
GuiControl, Disable, Static31 
GuiControl, Disable, Static32 	
GuiControl, Disable, Static41 
GuiControl, Disable, Static42 
GuiControl, Disable, Static43 
GuiControl, Disable, Static44 
GuiControl, Disable, Static45 
GuiControl, Disable, Static46 
GuiControl, Disable, Static47 
GuiControl, Disable, Static48 
GuiControl, Disable, Static49 
GuiControl, Disable, Static50 
GuiControl, Disable, Static58 
GuiControl, Disable, Static59 
GuiControl, Disable, Static60 
GuiControl, Disable, Static61 
GuiControl, Disable, Static62 
GuiControl, Disable, Static63 
GuiControl, Disable, Static64 
GuiControl, Disable, Static65 
GuiControl, Disable, Static66 
GuiControl, Disable, Static75 
GuiControl, Disable, Static76 
GuiControl, Disable, Static77 
GuiControl, Disable, Static78 
GuiControl, Disable, Static79 
GuiControl, Disable, Static80 
GuiControl, Disable, Static81 
GuiControl, Disable, Static2 
GuiControl, Disable, Static15 
GuiControl, Disable, Static16 
GuiControl, Disable, Static17 
GuiControl, Disable, Static22 
GuiControl, Disable, Static33 
GuiControl, Disable, Static34 
GuiControl, Disable, Static35 
GuiControl, Disable, Static40 
GuiControl, Disable, Static51 
GuiControl, Disable, Static52 
GuiControl, Disable, Static53 
GuiControl, Disable, Static57 
GuiControl, Disable, Static67 
GuiControl, Disable, Static68 
GuiControl, Disable, Static69  
GuiControl, Disable, Static74 
GuiControl, Disable, Static82 
GuiControl, Disable, Static83 
GuiControl, Disable, Static84 
GuiControl, Disable, Static85  
GuiControl, Disable, Static89 
GuiControl, Disable, Static90  
GuiControl, Disable, Static91  
GuiControl, Disable, Static92 
GuiControl, Disable, Static93 
GuiControl, Disable, Static94 
GuiControl, Disable, Static95 
GuiControl, Disable, Static96 
GuiControl, Disable, Static86 
GuiControl, Disable, Static87 
GuiControl, Disable, Static88 
GuiControl, Disable, Static70 
GuiControl, Disable, Static71 
GuiControl, Disable, Static72 
GuiControl, Disable, Static54 
GuiControl, Disable, Static55 
GuiControl, Disable, Static56 
GuiControl, Disable, Static18 
GuiControl, Disable, Static19 
GuiControl, Disable, Static20 
GuiControl, Disable, Static21 
GuiControl, Disable, Static36 
GuiControl, Disable, Static37 
GuiControl, Disable, Static38 
GuiControl, Disable, Static39 
GuiControl, Disable, Static73 
GuiControl, Disable, Static98 
GuiControl, Disable, Static97 	
}

OPENCOMMAND(){
	modifierTextDefault()
	disableTextDefault()
}

EXITCOMMAND(){
	hideGui()
	Return 
}
	
showHideGeneralgui(){
	if WinExist("guiNameGeneralUser"){
		EXITCOMMAND()	
	}
	Else{
		OPENCOMMAND()
		showGui("guiNameGeneralUser")
		GeneralKeyModifierText()
		Return 
	}
}

longPressToggleKey(){
	KeyWait, ``, T0.3
	if (ErrorLevel){ ;long click
		
		if winactive("ahk_class Chrome_WidgetWin_1"){
			OPENCOMMAND()
			GoogleChromeKeyModifierTextTitle()
			showGui("guiNameGoogleChromeTitle")
		}

		if winactive("ahk_exe acad.exe"){
			OPENCOMMAND()
			AutocadKeyModifierTextTitle()
			showGui("guiNameAutocadUserTitle")
		}

	}
		
	else {  ; if already exists close 
	
		if WinExist("guiNameGoogleChromeTitle"){
		EXITCOMMAND()
		return 
		}
		if WinExist("guiNameAutocadUserTitle"){
		EXITCOMMAND()
		return 
		}
		if WinExist("guiNameGeneralUser"){
		EXITCOMMAND()
		return 
		}
		
		else {  ; if doesnt exist open 
		
		return 
		
		}
		return 
	}
	KeyWait, ``
	EXITCOMMAND()
}

; default 
	pgup::SendRaw, ``																						
	+Pgup::SendRaw, ~
	NumLock::Return
	
`::longPressToggleKey()
<+`::showHideGeneralgui()



; scripts that are always on 
	#Include alwayson.ahk

; specific title key hold 
	#Include GoogleChromeTitle.ahk ;#Ifwinactive, ahk_class Chrome_WidgetWin_1
	#Include AutocadTitle.ahk    ;#Ifwinactive, ahk_class AfxMDIFrame140u

; on when keyboard on 
#Include general.ahk   ; #IfWinActive, guiNameGeneralUser








