#Requires AutoHotkey v2.0.2
LAlt & ]::Send "{End}"
LAlt & [::Send "{Home}"

NumpadDel::
{
	Send "!{Tab}"
}
CapsLock::{
	Send "{Esc}"
}
