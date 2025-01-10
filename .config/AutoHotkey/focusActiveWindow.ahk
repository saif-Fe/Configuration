#Requires AutoHotkey v2.0.2
#SingleInstance

CoordMode "Mouse"
ScrollLock::
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
