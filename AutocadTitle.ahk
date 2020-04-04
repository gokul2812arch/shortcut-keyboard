AutocadKeyModifierTextTitle(){

GuiControl, Text, Static75,`n`nFreeze
GuiControl, Enable, Static75

GuiControl, Text, Static76,`n`nUn Freeze
GuiControl, Enable, Static76



GuiControl, Text, Static23,`n`nLayoff
GuiControl, Enable, Static23

GuiControl, Text, Static24,`n`nLayon
GuiControl, Enable, Static24

GuiControl, Text, Static25,`n`nLay ALL ON
GuiControl, Enable, Static25



GuiControl, Text, Static41,`n`nLayiso 
GuiControl, Enable, Static41

GuiControl, Text, Static42,`n`nLayuniso 
GuiControl, Enable, Static42

GuiControl, Text, Static43,`n`nOFF layiso
GuiControl, Enable, Static43

GuiControl, Text, Static44,`n`nLOCK layiso 
GuiControl, Enable, Static44



GuiControl, Text, Static58,`n`nmake current 
GuiControl, Enable, Static58

GuiControl, Text, Static59,`n`nmatch pro
GuiControl, Enable, Static59

GuiControl, Text, Static3,`n`nPicsty 0
GuiControl, Enable, Static3

GuiControl, Text, Static4,`n`nPicsty 1
GuiControl, Enable, Static4


}

#Ifwinactive, ahk_exe acad.exe


~` & 1::send,{ESC}{ESC}{ESC}layoff{Space}  ; off 
~` & 2::send,{ESC}{ESC}{ESC}layon{Space}   ; on 

; on unthaw unlock 
	~` & 3::    
	send,{ESC}{ESC}{ESC}layon{Space}laythw{space}
	send {Ctrl down}  {Shift down}  1  {Ctrl up}  {Shift up}      ; set "-layer;unlock;*;;" macro triggred by control+shift+alt+1  in autocad 
	return   

~` & q::send,{ESC}{ESC}{ESC}layiso{Space}   ; isolate
~` & w::send,{ESC}{ESC}{ESC}layuniso{Space}  ; unisolate

~` & e::send,{ESC}{ESC}{ESC}layiso{Space}s{Space}o{space}{Space}   ; isolate setting off 
~` & r::send,{ESC}{ESC}{ESC}layiso{Space}s{Space}l{space}{Space}   ; isolate setting lock 

~` & a::send,{ESC}{ESC}{ESC}laymcur{Space}   ; layer make current 
~` & s::send,{ESC}{ESC}{ESC}ma{Space}   ; match property 

~` & z::send,{ESC}{ESC}{ESC}layfrz{Space}  ; freexe
~` & x::send,{ESC}{ESC}{ESC}laythw{Space}  ; thaw 


~` & f1::send,{ESC}{ESC}{ESC}pickstyle{Space}0{Space} ; pickstyle 0  
~` & f2::send,{ESC}{ESC}{ESC}pickstyle{Space}1{Space} ; pickstyle 0  