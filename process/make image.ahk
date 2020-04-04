#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force ;only one instance of this script may run at a time!

;---- Configuration Section: Customize the size of the on-screen keyboard and
; other options here.

; Changing this font size will make the entire on-screen keyboard get
; larger or smaller:
k_FontSize = 8
k_FontName = Verdana  ; This can be blank to use the system's default font.
k_FontStyle = Bold    ; Example of an alternative: Italic Underline

; Names for the tray menu items:
k_MenuItemHide = Hide on-screen &keyboard
k_MenuItemShow = Show on-screen &keyboard

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
Gui, Font, s%k_FontSize% %k_FontStyle%, %k_FontName%
Gui, -Caption +E0x200 +ToolWindow
TransColor = F1ECED
Gui, Color, %TransColor%  ; This color will be made transparent later below.

;---- Add a button for each key. Position the first button with absolute
; coordinates so that all other buttons can be positioned relative to it:
;Gui, Add, Button,LeftSection %k_KeySize% xm+%k_KeyWidth%, ``
;Gui, Add, Button,Left xm+%k_KeyWidthHalf% y+%k_KeyMargin% %k_KeySize%, `` 

k_KeyHeight0 := k_KeyHeight * 0.75
k_KeyWidth0 := (14.5*k_KeyWidth + 13*k_KeyMargin -15*k_KeyMargin) / 16
k_KeyWidth00 := 14*k_KeyWidth + 14*k_KeyMargin + k_BreakLength +0.5*k_KeyWidth



Gui, Add, Button,Left xm ym w%k_KeyWidth0% h%k_KeyHeight0%, Esc`n`n`n ;Button0
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F1`n`n`n ;Button1
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F2`n`n`n ;Button2
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F3`n`n`n ;Button3
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F4`n`n`n ;Button4
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F5`n`n`n ;Button5
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F6`n`n`n ;Button6
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F7`n`n`n ;Button7
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F8`n`n`n ;Button8
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F9`n`n`n ;Button9
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F10`n`n`n ;Button10
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F11`n`n`n ;Button11
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, F12`n`n`n ;Button12
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, PrtScr`n`n`n ;Button13
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, Insert`n`n`n ;Button14
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth0%, Delete`n`n`n ;Button15

Gui, Add, Button,Left xm y+-%k_KeyHeight0% h%k_KeyHeight0% x%k_KeyWidth00% w%k_KeyWidth%, PgUp`n`n`n ;Button16
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth%, PgDn`n`n`n ;Button17
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth%, Home`n`n`n ;Button18
Gui, Add, Button,Left h%k_KeyHeight0% x+%k_KeyMargin% w%k_KeyWidth%, End`n`n`n ;Button19

k_KeyWidth1 := k_KeyWidth + k_KeyWidth*0.5

Gui, Add, Button,Left xm y+%k_KeyMargin% w%k_KeyWidth% h%k_KeyHeight%, ```n`n`n`n ;Button20
Gui, Add, Button,Left %k_Position%, 1`n`n`n`n ;Button21
Gui, Add, Button,Left %k_Position%, 2`n`n`n`n ;Button22
Gui, Add, Button,Left %k_Position%, 3`n`n`n`n ;Button23
Gui, Add, Button,Left %k_Position%, 4`n`n`n`n ;Button24
Gui, Add, Button,Left %k_Position%, 5`n`n`n`n ;Button25
Gui, Add, Button,Left %k_Position%, 6`n`n`n`n ;Button26
Gui, Add, Button,Left %k_Position%, 7`n`n`n`n ;Button27
Gui, Add, Button,Left %k_Position%, 8`n`n`n`n ;Button28
Gui, Add, Button,Left %k_Position%, 9`n`n`n`n ;Button29
Gui, Add, Button,Left %k_Position%, 0`n`n`n`n ;Button30
Gui, Add, Button,Left %k_Position%, -`n`n`n`n ;Button31
Gui, Add, Button,Left %k_Position%, =`n`n`n`n ;Button32
Gui, Add, Button,Left %k_Position% w%k_KeyWidth1%, Backspace`n`n`n`n ;Button33

Gui, Add, Button,Left xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%, Num`n`n`n`n ;Button34
Gui, Add, Button,Left %k_Position%, /`n`n`n`n ;Button35
Gui, Add, Button,Left %k_Position%, *`n`n`n`n ;Button36
Gui, Add, Button,Left %k_Position%, -`n`n`n`n ;Button37


Gui, Add, Button,Left xm y+%k_KeyMargin% h%k_KeyHeight% w%k_KeyWidth1%, Tab`n`n`n`n ;Button38
Gui, Add, Button,Left %k_Position%, Q`n`n`n`n ;Button39
Gui, Add, Button,Left %k_Position%, W`n`n`n`n ;Button40
Gui, Add, Button,Left %k_Position%, E`n`n`n`n ;Button41
Gui, Add, Button,Left %k_Position%, R`n`n`n`n ;Button42
Gui, Add, Button,Left %k_Position%, T`n`n`n`n ;Button43
Gui, Add, Button,Left %k_Position%, Y`n`n`n`n ;Button44
Gui, Add, Button,Left %k_Position%, U`n`n`n`n ;Button45
Gui, Add, Button,Left %k_Position%, I`n`n`n`n ;Button46
Gui, Add, Button,Left %k_Position%, O`n`n`n`n ;Button47
Gui, Add, Button,Left %k_Position%, P`n`n`n`n ;Button48
Gui, Add, Button,Left %k_Position%, [`n`n`n`n ;Button49
Gui, Add, Button,Left %k_Position%, ]`n`n`n`n ;Button50
Gui, Add, Button,Left %k_Position%, \`n`n`n`n ;Button51

Gui, Add, Button,Left xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%, 7`n`n`n`n ;Button52
Gui, Add, Button,Left %k_Position%, 8`n`n`n`n ;Button53
Gui, Add, Button,Left %k_Position%, 9`n`n`n`n ;Button54

k_KeyWidth2 := k_KeyWidth1 + k_KeyMargin + (k_KeyWidth/4)
k_KeyWidth3 := k_KeyWidth * 2 - (k_KeyWidth/4)
k_KeyHeight5 := k_KeyHeight *2 + k_KeyMargin

Gui, Add, Button,Left xm y+%k_KeyMargin% h%k_KeyHeight% w%k_KeyWidth2%  , CapsLock`n`n`n`n ;Button55
Gui, Add, Button,Left %k_Position%, A`n`n`n`n ;Button56
Gui, Add, Button,Left %k_Position%, S`n`n`n`n ;Button57
Gui, Add, Button,Left %k_Position%, D`n`n`n`n ;Button58
Gui, Add, Button,Left %k_Position%, F`n`n`n`n ;Button59
Gui, Add, Button,Left %k_Position%, G`n`n`n`n ;Button60
Gui, Add, Button,Left %k_Position%, H`n`n`n`n ;Button61
Gui, Add, Button,Left %k_Position%, J`n`n`n`n ;Button62
Gui, Add, Button,Left %k_Position%, K`n`n`n`n ;Button63
Gui, Add, Button,Left %k_Position%, L`n`n`n`n ;Button64
Gui, Add, Button,Left %k_Position%, `;`n`n`n`n ;Button65
Gui, Add, Button,Left %k_Position%, '`n`n`n`n ;Button66
Gui, Add, Button,Left %k_Position% w%k_KeyWidth3%, Enter`n`n`n`n ;Button67  

Gui, Add, Button,Left xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%, 4`n`n`n`n ;Button68
Gui, Add, Button,Left %k_Position%, 5`n`n`n`n ;Button69
Gui, Add, Button,Left %k_Position%, 6`n`n`n`n ;Button70
Gui, Add, Button,Left h%k_KeyHeight5% w%k_KeyWidth% x+%k_KeyMargin% y+-%k_KeyHeight5%, +`n`n`n`n`n`n`n`n`n   ;Button71

k_KeyWidth4 := k_KeyWidth2 + k_KeyWidth*0.5        
k_KeyWidth5 := k_KeyWidth3 + k_KeyWidth*0.5 + k_KeyMargin    

; The first button below adds %A_Space% at the end to widen it a little,
; making the layout of keys next to it more accurately reflect a real keyboard:
Gui, Add, Button,Left xm y+%k_KeyMargin% h%k_KeyHeight% w%k_KeyWidth4%, Shift`n`n`n`n ;Button72
Gui, Add, Button,Left %k_Position%, Z`n`n`n`n ;Button73
Gui, Add, Button,Left %k_Position%, X`n`n`n`n ;Button74
Gui, Add, Button,Left %k_Position%, C`n`n`n`n ;Button75
Gui, Add, Button,Left %k_Position%, V`n`n`n`n ;Button76
Gui, Add, Button,Left %k_Position%, B`n`n`n`n ;Button77
Gui, Add, Button,Left %k_Position%, N`n`n`n`n ;Button78
Gui, Add, Button,Left %k_Position%, M`n`n`n`n ;Button79
Gui, Add, Button,Left %k_Position%, `,`n`n`n`n ;Button80
Gui, Add, Button,Left %k_Position%, .`n`n`n`n ;Button81
Gui, Add, Button,Left %k_Position%, /`n`n`n`n ;Button82
Gui, Add, Button,Left %k_Position% w%k_KeyWidth5%, Shift`n`n`n`n ;Button83

Gui, Add, Button,Left xm y+-%k_KeyHeight% h%k_KeyHeight% x%k_KeyWidth00% w%k_KeyWidth%, 1`n`n`n`n ;Button84
Gui, Add, Button,Left %k_Position%, 2`n`n`n`n ;Button85
Gui, Add, Button,Left %k_Position%, 3`n`n`n`n ;Button86

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

Gui, Add, Button,Left xm y+%k_KeyMargin% h%k_KeyHeight1% w%k_KeyWidth6%, Ctrl`n`n`n`n`n ;Button87
Gui, Add, Button,Left h%k_KeyHeight1% w%k_KeyWidth6% x+%k_KeyMargin%, Fn`n`n`n`n`n ;Button88
Gui, Add, Button,Left h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%, Win`n`n`n`n`n ;Button89
Gui, Add, Button,Left h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%, Alt`n`n`n`n`n ;Button90
Gui, Add, Button,Left h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth7%, Space`n`n`n`n`n ;Button91
Gui, Add, Button,Left h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%, Alt`n`n`n`n`n ;Button92
Gui, Add, Button,Left h%k_KeyHeight1% x+%k_KeyMargin% w%k_KeyWidth%, Ctrl`n`n`n`n`n ;Button93

Gui, Add, Button, h%k_KeyHeight2% x+%k_KeyMargin% w%k_KeyWidth9% y+-%k_KeyHeight2%, `< ;Button94
Gui, Add, Button, h%k_KeyHeight2% x+%k_KeyMargin% w%k_KeyWidth9%, ˅ ;Button95
Gui, Add, Button, h%k_KeyHeight2% x+-%k_KeyWidth9% w%k_KeyWidth9% y+-%k_KeyHeight6%  , ˄ ;Button96
Gui, Add, Button, h%k_KeyHeight2% x+%k_KeyMargin% w%k_KeyWidth9% y+%k_KeyMargin1%, `> ;Button97

Gui, Add, Button,Left xm y+-%k_KeyHeight1% h%k_KeyHeight1% x%k_KeyWidth00% w%k_KeyWidth8%, 0`n`n`n`n`n ;Button98
Gui, Add, Button,Left h%k_KeyHeight1% w%k_KeyWidth% x+%k_KeyMargin%, .`n`n`n`n`n ;Button99
Gui, Add, Button,Left h%k_KeyHeight3% w%k_KeyWidth% x+%k_KeyMargin% y+-%k_KeyHeight3%, Enter`n`n`n`n`n`n`n`n`n`n ;Button100


;---- Show the window:
Gui, Show,,k_Keyboard made by gokul
k_IsVisible = y

WinGet, k_ID, ID, A   ; Get its window ID.
WinGetPos,,, k_WindowWidth, k_WindowHeight, A

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

WinMove, A,, %k_WindowX%, %k_WindowY%
WinSet, AlwaysOnTop, On, ahk_id %k_ID%
WinSet, TransColor, %TransColor% 220, ahk_id %k_ID%


k_ShowHide:
if k_IsVisible = y
{
    Gui, Cancel
    Menu, Tray, Rename, %k_MenuItemHide%, %k_MenuItemShow%
    k_IsVisible = n
}
else
{
    Gui, Show
    Menu, Tray, Rename, %k_MenuItemShow%, %k_MenuItemHide%
    k_IsVisible = y
}
return


GuiClose:
k_MenuExit:
ExitApp