#Requires AutoHotkey v2.0.2
#SingleInstance

NumpadDel::
{
	Send "!{Tab}"
}
CapsLock::{
	Send "{Esc}"
}

ih := InputHook("B L1 T1", "{Esc}")

*Esc::
{
	ih.Start()
	reason := ih.Wait()
	if (reason = "Stopped") {
		Send "{Esc}"
	} else if (reason = "Max") {
		Send "{Blind}{Ctrl down}" ih.Input
	}
}

*Esc up::
{
	if (ih.InProgress) {
		ih.Stop()
	} else {
		Send "{Ctrl up}"
	}
}
