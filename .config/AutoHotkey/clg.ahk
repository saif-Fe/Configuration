#Requires AutoHotkey v2.0.2
#SingleInstance

CoordMode "Mouse"
MButton::
{
   hwnd := WinExist("A")
   if hwnd
   {
      WinGetPos(&WinX, &WinY, &WinW, &WinH, hwnd)

      CenterX := WinX + (WinW / 2)
      CenterY := WinY + (WinH / 2)

      MouseMove CenterX, CenterY
   }
}

#^+Tab::
{
hwnd := WinExist("A")
          if hwnd
          {
                  WinSetStyle("^0xC00000", hwnd)
          }
      return
}
F12::
{
id := WinGetID("A")
            WinSetExStyle "^0x80", "A"
}

GetActiveWindowHWND() {
        hwnd := WinActive("A")
              A_Clipboard := String(hwnd)
}
F11::GetActiveWindowHWND()
