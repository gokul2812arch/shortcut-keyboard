GoogleChromeKeyModifierTextTitle(){
	GuiControl, Text, Static59,`n`nSearch Bar
	GuiControl, Enable, Static59

	GuiControl, Text, Static79,`n`nBookmark
	GuiControl, Enable, Static79

	GuiControl, Text, Static44,`n`nReopen
	GuiControl, Enable, Static44
	
	GuiControl, Text, Static23,`n`nBack
	GuiControl, Enable, Static23
	
	GuiControl, Text, Static24,`n`nForward
	GuiControl, Enable, Static24

	GuiControl, Text, Static25,`n`nNew Tab
	GuiControl, Enable, Static25

	GuiControl, Text, Static42,`n`nClose Tab
	GuiControl, Enable, Static42
}

#Ifwinactive, ahk_class Chrome_WidgetWin_1

~` & 1::Send ^+{tab}   ; backward 
~` & 2::Send ^{tab}    ; forward 
~` & 3::Send {Ctrl down}  t  {Ctrl up}  ; new tab 
~` & w::Send {Ctrl down}  w  {Ctrl up}  ; close tab 
~` & r::send {Ctrl down}  {Shift down}  t  {Ctrl up}  {Shift up}  ; reopen closed
~` & b::send {Ctrl down}  d  {Ctrl up}   ; book mark 
~` & s::send {Ctrl down}  l  {Ctrl up}  ; search bar 
