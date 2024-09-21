#Requires AutoHotkey v2.0.2
#SingleInstance

:*:usrr::admin@admin.com
:*:pwdr::12345678
:*:pwdw::local.taf@123$$
::lorem::
{
SendInput "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vehicula orci eu lorem faucibus blandit congue ac erat. Proin at arcu dictum, condimentum eros nec, dapibus massa. Aliquam sollicitudin convallis eros eget ornare. Nulla facilisi. Fusce gravida vulputate eros, et dapibus sem maximus vitae. Aenean sollicitudin lacus nec urna volutpat maximus."
}
::dxd::{
Send FormatTime(DateAdd(A_Now, 0, "days"))
}
