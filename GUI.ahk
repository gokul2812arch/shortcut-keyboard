#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ;only one instance of this script may run at a time!

global guiName := "main_gui"  ;"k_Keyboard made by gokul"


; Changing this font size will make the entire on-screen keyboard get
; larger or smaller:
k_FontSize = 7
k_FontName = Verdana  ; This can be blank to use the system's default font.
;k_FontStyle = Bold    ; Example of an alternative: Italic Underline

; To have the keyboard appear on a monitor other than the primary, specify
; a number such as 2 for the following variable.  Leave it blank to use
; the primary:
k_Monitor = 

;---- End of configuration section.  Don't change anything below this point
; unless you want to alter the basic nature of the script.


;---- Alter the tray icon menu:
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
Menu, Tray, Add, %k_MenuItemHide%, k_ShowHide
Menu, Tray, Add, &Exit, k_MenuExit
Menu, Tray, Default, %k_MenuItemHide%
;Menu, Tray, NoStandard

;---- Calculate object dimensions based on chosen font size:
k_KeyRecSize = 20

k_KeyWidth := k_KeyRecSize * 3.5
k_KeyHeight := k_KeyRecSize * 3
k_KeyMargin := k_KeyRecSize / 6
k_KeyWidthHalf := k_KeyRecSize / 2
k_BreakLength := k_KeyMargin *3

k_KeySize = w%k_KeyWidth% h%k_KeyHeight%
k_Position = x+%k_KeyMargin% %k_KeySize%

;---- Create a GUI window for the on-screen keyboard:
Gui, +LastFound +AlwaysOnTop +E0x08000000 ; keeps focus off gui this was added later 
Gui, Font, s%k_FontSize% %k_FontStyle%, %k_FontName%
Gui, -Caption +E0x200 +ToolWindow
Gui, Color, %TransColor%  ; This color will be made transparent later below.

TransColor = F1ECED
;---- Add a button for each key. Position the first button with absolute
; coordinates so that all other buttons can be positioned relative to it:
;Gui, Add, Text,Center BackgroundTransSection %k_KeySize% xm+%k_KeyWidth%, ``
;Gui, Add, Text,Center BackgroundTrans xm+%k_KeyWidthHalf% y+%k_KeyMargin% %k_KeySize%, `` 

k_KeyHeight0 := k_KeyHeight * 0.75
k_KeyWidth0 := (14.5*k_KeyWidth + 13*k_KeyMargin -15*k_KeyMargin) / 16
k_KeyWidth00 := 14*k_KeyWidth + 14*k_KeyMargin + k_BreakLength +0.5*k_KeyWidth

Gui, Add, Picture, , gui.png

Gui, Add, Text,Center BackgroundTrans xm ym w%k_KeyWidth0% h%k_KeyHeight0%,`n`nEsc ;Button0
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF1 ;Button1
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF2 ;Button2
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF3 ;Button3
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF4 ;Button4
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF5 ;Button5
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF6 ;Button6
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF7 ;Button7
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF8 ;Button8
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF9 ;Button9
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF10 ;Button10
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF11 ;Button11
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nF12 ;Button12
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nPrtScr ;Button13
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nInsert ;Button14
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%,`n`nDelete ;Button15

Gui, Add, Text,Center BackgroundTrans xm y+-%k_KeyHeight0% h%k_KeyHeight0% x%k_KeyWidth00% w%k_KeyWidth%,`n`nPgUp ;Button16
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth%,`n`nPgDn ;Button17
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth%,`n`nHome ;Button18
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth%,`n`nEnd ;Button19

k_KeyWidth1 := k_KeyWidth + k_KeyWidth*0.5

Gui, Add, Text,Center BackgroundTrans xm y+%k_KeyMargin% w%k_KeyWidth% h%k_KeyHeight%,`n`n`` ;Button20
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n1 ;Button21
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n2 ;Button22
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n3 ;Button23
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n4 ;Button24
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n5 ;Button25
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n6 ;Button26
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n7 ;Button27
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n8 ;Button28
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n9 ;Button29
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n0 ;Button30
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n- ;Button31
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n= ;Button32
Gui, Add, Text,Center BackgroundTrans %k_Position% w%k_KeyWidth1%, `n `nBackspace ;Button33

Gui, Add, Text,Center BackgroundTrans xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%,`n`nNum ;Button34
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n/ ;Button35
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n* ;Button36
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n- ;Button37


Gui, Add, Text,Center BackgroundTrans xm y+%k_KeyMargin% h%k_KeyHeight% w%k_KeyWidth1%,`n`nTab ;Button38
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nQ ;Button39
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nW ;Button40
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nE ;Button41
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nR ;Button42
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nT ;Button43
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nY ;Button44
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nU ;Button45
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nI ;Button46
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nO ;Button47
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nP ;Button48
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n[ ;Button49
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n] ;Button50
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n\ ;Button51

Gui, Add, Text,Center BackgroundTrans xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%,`n`n7 ;Button52
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n8 ;Button53
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n9 ;Button54

k_KeyWidth2 := k_KeyWidth1 + k_KeyMargin + (k_KeyWidth/4)
k_KeyWidth3 := k_KeyWidth * 2 - (k_KeyWidth/4)
k_KeyHeight5 := k_KeyHeight *2 + k_KeyMargin

Gui, Add, Text,Center BackgroundTrans xm y+%k_KeyMargin% h%k_KeyHeight% w%k_KeyWidth2%  ,`n`nCapsLock ;Button55
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nA ;Button56
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nS ;Button57
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nD ;Button58
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nF ;Button59
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nG ;Button60
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nH ;Button61
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nJ ;Button62
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nK ;Button63
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nL ;Button64
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n`; ;Button65
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n' ;Button66
Gui, Add, Text,Center BackgroundTrans %k_Position% w%k_KeyWidth3%,`n`nEnter ;Button67  

Gui, Add, Text,Center BackgroundTrans xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%,`n`n4 ;Button68
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n5 ;Button69
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n6 ;Button70
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight5% w%k_KeyWidth% x+%k_KeyMargin% y+-%k_KeyHeight5%,`n`n+ ;Button71

k_KeyWidth4 := k_KeyWidth2 + k_KeyWidth*0.5        
k_KeyWidth5 := k_KeyWidth3 + k_KeyWidth*0.5 + k_KeyMargin    

; The first button below adds %A_Space% at the end to widen it a little,
; making the layout of keys next to it more accurately reflect a real keyboard:
Gui, Add, Text,Center BackgroundTrans xm y+%k_KeyMargin% h%k_KeyHeight% w%k_KeyWidth4%,`n`nShift ;Button72
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nZ ;Button73
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nX ;Button74
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nC ;Button75
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nV ;Button76
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nB ;Button77
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nN ;Button78
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`nM ;Button79
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n`, ;Button80
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n. ;Button81
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n/ ;Button82
Gui, Add, Text,Center BackgroundTrans %k_Position% w%k_KeyWidth5%,`n`nShift ;Button83

Gui, Add, Text,Center BackgroundTrans xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%,`n`n1 ;Button84
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n2 ;Button85
Gui, Add, Text,Center BackgroundTrans %k_Position%,`n`n3 ;Button86

k_KeyWidth6 := (k_KeyWidth4 - k_KeyMargin)/2 
k_KeyWidth7 := 5*k_KeyWidth + 4*k_KeyMargin
k_KeyWidth8 := k_KeyWidth*2 + k_KeyMargin
k_KeyHeight1 := k_KeyHeight * 1.25 
k_Keyheight2 := k_KeyHeight1 /2 - k_KeyMargin 
k_KeyWidth9 := (k_KeyWidth3 + k_KeyWidth*0.5 + k_KeyMargin + k_KeyWidth + k_KeyMargin - k_KeyMargin*2 )/3
k_BreakLength1 := k_KeyMargin *3
k_KeyHeight3 :=  k_KeyHeight1 + k_KeyHeight + k_KeyMargin
k_KeyHeight4 := k_KeyHeight + k_KeyMargin
k_KeyHeight5 := k_KeyHeight *2 + k_KeyMargin
k_KeyHeight6 := k_KeyHeight2 *2 + k_KeyMargin
k_KeyMargin1 := 1 * k_KeyMargin

Gui, Add, Text,Center BackgroundTrans xm y+%k_KeyMargin% h%k_KeyHeight1% w%k_KeyWidth6%,`n`nCtrl ;Button87
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% w%k_KeyWidth6% x+%k_KeyMargin%,`n`nFn ;Button88
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%,`n`nWin ;Button89
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%,`n`nAlt ;Button90
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth7%,`n`nSpace ;Button91
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%,`n`nAlt ;Button92
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%,`n`nCtrl ;Button93

;Gui, Add, Button, h%k_KeyHeight2% x+%k_KeyMargin% w%k_KeyWidth9% y+-%k_KeyHeight2%, `< ;Button94
;Gui, Add, Button, h%k_KeyHeight2% x+%k_KeyMargin% w%k_KeyWidth9%, ˅ ;Button95
;Gui, Add, Button, h%k_KeyHeight2% x+-%k_KeyWidth9% w%k_KeyWidth9% y+-%k_KeyHeight6%  , ˄ ;Button96
;Gui, Add, Button, h%k_KeyHeight2% x+%k_KeyMargin% w%k_KeyWidth9% y+%k_KeyMargin1%, `> ;Button97

Gui, Add, Text,Center BackgroundTrans xm y+-%k_KeyHeight1% h%k_KeyHeight1% x%k_KeyWidth00% w%k_KeyWidth8%,`n`n0 ;Button98
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight1% w%k_KeyWidth% x+%k_KeyMargin%,`n`n. ;Button99
Gui, Add, Text,Center BackgroundTrans h%k_KeyHeight3% w%k_KeyWidth% x+%k_KeyMargin% y+-%k_KeyHeight3%,`n`nEnter ;Button100


;---- Show the window:
Gui, Show,NoActivate,%guiName%


WinGet, k_ID, ID, %guiName%   ; Get its window ID.
WinGetPos,,, k_WindowWidth, k_WindowHeight, %guiName%
;---- Position the keyboard at the bottom of the screen (taking into account
; the position of the taskbar):
SysGet, k_WorkArea, MonitorWorkArea, %k_Monitor%

; Calculate window's X-position:
k_WindowX = %k_WorkAreaRight%
k_WindowX -= %k_WorkAreaLeft%  ; Now k_WindowX contains the width of this monitor.
k_WindowX -= %k_WindowWidth%
k_WindowX /= 2  ; Calculate position to center it horizontally.
; The following is done in case the window will be on a non-primary monitor
; or if the taskbar is anchored on the left side of the screen:
k_WindowX += %k_WorkAreaLeft%

; Calculate window's Y-position:
k_WindowY = %k_WorkAreaBottom%
k_WindowY -= %k_WindowHeight%

WinMove, %guiName%,, %k_WindowX%, %k_WindowY%
WinSet, AlwaysOnTop, On, ahk_id %k_ID%
WinSet, TransColor, %TransColor% 220, ahk_id %k_ID%
Gui, Cancel

showGui(newName)
{
	Gui -caption +toolwindow +AlwaysOnTop
    Gui, Show, NoActivate, %guiName%
	WinWait, %guiName%
	winsettitle,%guiName%,,%newName%
	
}

hideGui()
{
    Gui, Cancel
}
return


GuiClose:
k_MenuExit:
ExitApp