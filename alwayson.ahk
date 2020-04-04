;numpad on left side 
	XButton1 & e:: send 9
	XButton1 & w:: send 8 
	XButton1 & q:: send 7 
	XButton1 & d:: send 6
	XButton1 & s:: send 5 
	XButton1 & a:: send 4 
	XButton1 & c:: send 3
	XButton1 & x:: send 2
	XButton1 & z:: send 1
	XButton1 & Alt:: send 0
	XButton1 & Shift:: send .
	XButton1 & space:: send {enter}

; keypad on left side 
	XButton2 & w:: send {up}
	XButton2 & s:: send {down}
	XButton2 & a:: send {left}
	XButton2 & d:: send {right}


; left snap mouse
	~` & LButton:: 
	CoordMode, Mouse  
	MouseGetPos, winMove_MouseStartX, winMove_MouseStartY, winMove_MouseWin
	WinActivate, ahk_id %winMove_MouseWin%
	send {Rwin down} {Left} {Rwin up}
	hideGui()
	return 

; left snap
	~` & Left::  
	send {Rwin down} {Left} {Rwin up}
	hideGui()
	return 

; right snap 
	~` & Right::  
	send {Rwin down} {Right} {Rwin up}
	hideGui()
	return 

; right snap mouse 
	~` & RButton::   
	CoordMode, Mouse  
	MouseGetPos, winMove_MouseStartX, winMove_MouseStartY, winMove_MouseWin
	WinActivate, ahk_id %winMove_MouseWin% 
	send {Rwin down} {Right} {Rwin up}
	hideGui()
	return 

; maximize restore 
	~` & UP::  
	WinGet, active_id, ID, A
	WinGet, winMaxMin_WinStateKey, MinMax, ahk_id %active_id%
	if winMaxMin_WinStateKey = 1
		WinRestore, ahk_id %active_id%
	else if winMaxMin_WinStateKey = 0
		WinMaximize, ahk_id %active_id%
	hideGui()
	return 

; minimize
	~` & Down::  
	send {Rwin down} {down} {Rwin up}
	hideGui()
	return 

; minimize maximize window 
	~` & MButton::
	CoordMode, Mouse  
	MouseGetPos, winMaxMin_MouseStartX, winMaxMin_MouseStartY, winMaxMin_MouseWin
	WinActivate, ahk_id %winMaxMin_MouseWin%
	WinGet, winMaxMin_WinState, MinMax, ahk_id %winMaxMin_MouseWin%
	if winMaxMin_WinState = 1
		WinRestore, ahk_id %winMaxMin_MouseWin%
	else if winMaxMin_WinState = 0
		WinMaximize, ahk_id %winMaxMin_MouseWin%
	hideGui()
	return 

; toggle height
	~` & XButton1::
	CoordMode, Mouse  ; Switch to screen/absolute coordinates.
	MouseGetPos, HMax_MouseStartX, HMax_MouseStartY, HMax_MouseWin
	WinGet, WM_WindowID, ID, ahk_id %HMax_MouseWin%
	WinGet, HMax_WinState, MinMax, ahk_id %HMax_MouseWin% 
	WinGetPos, WM_X, WM_Y, WM_Width, WM_Height, ahk_id %HMax_MouseWin%

	 if HMax_WinState = 1  ;if maximized 
	  {
		hideGui()
		WinRestore, ahk_id %HMax_MouseWin% 
		return
	  }

	  If ( WM_Height <> A_ScreenHeight ){
			; save values for resize
		; WM_WindowY%WM_WindowID%      = %WM_Y%    ; this if you want to save it and resize it for later \
		; WM_WindowHeight%WM_WindowID% = %WM_Height%   ; same as the above line 
			; maximize height
		hideGui()
		WinMove, ahk_id %HMax_MouseWin%,, %WM_X%, 0, %WM_Width%, %A_ScreenHeight%
	  }
	  
	  Else ; If WM_WindowHeight%WM_WindowID% 
	  {
		; height was maximized, so resize it
		; WinMove, ahk_id %HMax_MouseWin%, , %WM_X%,  WM_WindowY%WM_WindowID%, %WM_Width%, WM_WindowHeight%WM_WindowID%
		hideGui()
		WinMove, ahk_id %HMax_MouseWin%, , %WM_X%,  150, %WM_Width%, 750
		
		
		; reset variables
		; WM_WindowHeight%WM_WindowID% =
		; WM_WindowY%WM_WindowID%      = 
	  }
	return  

; alt tab with mouse wheel 
	~` & WheelDown::AltTab
	~` & WheelUp::ShiftAltTab

; alt tab with mouse wheel dependency 
	~` up::
		if(GetKeyState("Alt","P"))
		send {Alt up}
	else 
		Return 
