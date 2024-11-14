#Requires AutoHotkey v2.0

GetActiveWindowHWND() {
        hwnd := WinActive("A")
              A_Clipboard := String(hwnd)
}
F1::GetActiveWindowHWND()
