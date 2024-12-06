#Requires AutoHotkey v2.0.2
#SingleInstance

MButton::
{
        Send "{ScrollLock}"
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
