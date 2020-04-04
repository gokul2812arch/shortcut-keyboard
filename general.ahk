GeneralKeyModifierText(){

	GuiControl, Text, Static3,`n`nDeskIcons
	GuiControl, Enable, Static3
	
	GuiControl, Text, Static3,`n`nDesktop
	GuiControl, Enable, Static3
	
	GuiControl, Text, Static23,`n`nDesktop
	GuiControl, Enable, Static23
	
	GuiControl, Text, Static24,`n`nOpen Data
	GuiControl, Enable, Static24

	GuiControl, Text, Static25,`n`nWork
	GuiControl, Enable, Static25

	GuiControl, Text, Static26,`n`nCollege
	GuiControl, Enable, Static26
	
	GuiControl, Text, Static27,`n`nDownloads
	GuiControl, Enable, Static27
	
	GuiControl, Text, Static41,`n`nwin on top
	GuiControl, Enable, Static41

	GuiControl, Text, Static42,`n`nwhatsapp
	GuiControl, Enable, Static42

	GuiControl, Text, Static44,`n`nRhino 3D
	GuiControl, Enable, Static44

	GuiControl, Text, Static49,`n`nOBS Studio
	GuiControl, Enable, Static49
	
	GuiControl, Text, Static50,`n`nPsiphon
	GuiControl, Enable, Static50

	GuiControl, Text, Static58,`n`nAutocad
	GuiControl, Enable, Static58

	GuiControl, Text, Static59,`n`nSearch
	GuiControl, Enable, Static59

	GuiControl, Text, Static62,`n`nChrome
	GuiControl, Enable, Static62

	GuiControl, Text, Static77,`n`nSnipping Tool
	GuiControl, Enable, Static77

	GuiControl, Text, Static31,`n`nCopy Path
	GuiControl, Enable, Static31

	GuiControl, Text, Static32,`n`nmsg box creator
	GuiControl, Enable, Static32
	
	

	GuiControl, Text, Static33,`n`nWin Spy
	GuiControl, Enable, Static33

	GuiControl, Text, Static34,`n`nEdit Script
	GuiControl, Enable, Static34

	GuiControl, Text, Static35,`n`nReload Script
	GuiControl, Enable, Static35		

}

GeneralRunCommand(Path){

	Run %Path%
	EXITCOMMAND()
}

GeneralEditScript(){
	Run, "C:\AHK\003_keyboard"		
	EXITCOMMAND()
}

GeneralOpenSnippingTool(){

EXITCOMMAND() 
send {Lwin down} {shift down} s {lwin up} {shift up}
}

GeneralCopyPath(){


clipboard := ""                ; empty clipboard
Send, ^c                       ; copy the selected file
ClipWait, 1                    ; wait for the clipboard to contain data
if (!ErrorLevel)               ; If NOT ErrorLevel clipwait found data on the clipboard
clipboard := clipboard         ; convert to text (= copy the path)
EXITCOMMAND() 

}




#IfWinExist, guiNameGeneralUser

; window on top 
	q::
	hideGui()
	WinGetTitle, winTitle, A
	Winset, Alwaysontop, , A ; always on top
	return 

; run commands 
	w::GeneralRunCommand("C:\AHK\003_keyboard\dependency\WhatsApp Desktop.lnk")
	r::GeneralRunCommand("C:\Program Files\Rhinoceros 5 (64-bit)\System\Rhino.exe")
	o::GeneralRunCommand("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\OBS Studio (64bit)")
	p::GeneralRunCommand("E:\Setup\Psiphon\psiphon3.exe")

	a::GeneralRunCommand("C:\Program Files\Autodesk\AutoCAD 2018\acad.exe")
	s::GeneralRunCommand("C:\Users\gokulPC\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Everything\Search Everything.lnk")
	g::GeneralRunCommand("https://www.google.co.in/")

	c::GeneralOpenSnippingTool()

	f1::
	hideGui()
	ControlGet, HWND, Hwnd,, SysListView321, ahk_class WorkerW
	If DllCall("IsWindowVisible", UInt, HWND)
	{
		WinHide, ahk_id %HWND%
	}
	Else
	{
		WinShow, ahk_id %HWND%
	}
	return
	
	f2::
	hideGui()
	send {Rwin down} {d} {Rwin up}
	return
	
	1::GeneralRunCommand("D:\Users\Desktop")
	2::GeneralRunCommand("D:\")
	3::GeneralRunCommand("D:\College\011_WORK")
	4::GeneralRunCommand("D:\College\010_TENTH_SEMESTER")
	5::GeneralRunCommand("D:\Users\Downloads")
	9::GeneralCopyPath()
	0::GeneralRunCommand("C:\AHK\001 message box creator\MsgBox Creator for Notepad++.ahk")
	-::GeneralRunCommand("C:\Program Files\AutoHotkey\WindowSpy.ahk")
	=::GeneralEditScript()
	Backspace::GeneralRunCommand("C:\AHK\003_keyboard\MAIN.ahk")



