#Requires AutoHotkey v2.0.2
#SingleInstance

NumpadDel::
{
	Send "!{Tab}"
}
CapsLock::{
	Send "{Esc}"
}

#^+Tab::
{
hwnd := WinExist("A")
          if hwnd
          {
              ; Remove the window title bar and borders
                  WinSetStyle("^0xC00000", hwnd)
          }
      return
}
