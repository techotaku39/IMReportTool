Menu Tray,NoStandard
Menu Tray,Add,转发
Menu Tray,Add,重启
Menu Tray,Add,退出

Gui New,HwndReportUI +AlwaysOnTop +ToolWindow
Gui Font,s12,Microsoft YaHei UI

Gui Add,Button,x8 Section w122 -Wrap,行为观察 ;Report name
Gui Add,CheckBox,x+5 yp+4

Gui Add,Button,xs y+10 w122 -Wrap,幽灵猎手
Gui Add,CheckBox,x+5 yp+4
Gui Add,Button,xs y+4 w122 -Wrap,码农贼船
Gui Add,CheckBox,x+5 yp+4

Gui Add,Button,xs y+10 w122 -Wrap,一战成硕
Gui Add,CheckBox,x+5 yp+4

Gui Add,Button,xs y+10 w61 -Wrap,清除
Gui Add,Button,x+0 w61 -Wrap,发送

Gui Add,Text,x+5 yp+4,0
return


Button行为观察:
    if WinExist("ahk_exe TIM.exe")
        ReportTIM("56432")          ;Button send
    else
        ReportWeChat("行为观察")    ;Button send
return

Button幽灵猎手:
    if WinExist("ahk_exe TIM.exe")
        ReportTIM("54645")
    else
        ReportWeChat("幽灵猎手")
return
Button码农贼船:
    if WinExist("ahk_exe TIM.exe")
        ReportTIM("86781")
    else
        ReportWeChat("码农贼船")
return

Button一战成硕:
    if WinExist("ahk_exe TIM.exe")
        ReportTIM("45645")
    else
        ReportWeChat("一战成硕")
return


Button清除:
Gui %ReportUI%:Default
Loop 100
{
    CheckName:="Button" A_Index*2
    GuiControl,,%CheckName%,0
}
return

Button发送:
CheckNum:=0
Loop 100
{
    CheckName:="Button" A_Index*2
    ControlGet IsChecked,Checked,,%CheckName%,ahk_id %ReportUI%
    if (IsChecked)
    {
        Sleep 750
        CheckNum++
        if (CheckNum>10)
        {
            MsgBox 0x10,转发,数量上限
            break 1
        }
        ClickName:="Button" A_Index*2-1
        ControlClick %ClickName%,ahk_id %ReportUI%
    }
}
if (CheckNum>=10)
    CheckNum:="F"
GuiControl %ReportUI%:,Static1,%CheckNum%
return


#NoEnv
#SingleInstance Force
ReportTIM(txt)
{
    ControlSend,,{Text}%txt%,转发 ahk_exe TIM.exe
    Sleep 500
    ControlSend,,{Enter},转发 ahk_exe TIM.exe
}
ReportWeChat(txt)
{
    ControlSend,,{Text}%txt%,ahk_class SelectContactWnd ahk_exe WeChat.exe
    Sleep 500
    ControlSend,,{Enter},ahk_class SelectContactWnd ahk_exe WeChat.exe
}

GuiClose:
    Gui Hide
return
转发:
    Gui %ReportUI%:Show,x0 w155,转发
return
重启:
    Reload
退出:
    ExitApp
