;; based on https://github.com/fenwar/ahk-caps-ctrl-esc/blob/master/AutoHotkey.ahk
;; modified because I already map capslock to ctrl using windows registry
;; here I'm ONLY adding behaviour that LControl tap results in esc
*LControl::
    Send {Blind}{LControl down}
    return
 
*LControl up::
    Send {Blind}{LControl Up}
    ;; send Esc only when it was LControl by itself
    if A_PRIORKEY = LControl
    {
        Send {Esc}
    }
    Return
