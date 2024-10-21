; Mouse event
RAlt::Click "left"
; SCE038::Click "left"
; g::Click "left"

; Force CapsLock state to be off at all times
SetCapsLockState "AlwaysOff"

; Remap CapsLock + hjkl for navigation
CapsLock & h::Send "{Left}"
CapsLock & j::Send "{Down}"
CapsLock & k::Send "{Up}"
CapsLock & l::Send "{Right}"

; Disable CapsLock's default behavior to prevent toggling the light
CapsLock::Return


; after copy the file path of current tab, Ctrl+Shift+e to open current tab in MS Edge
^+e::
{
    if !WinExist("ahk_exe SumatraPDF.exe")
    {
        MsgBox("Sumatra PDF is not running.")
        return
    }


    FileToOpen := A_Clipboard

    if FileToOpen = ""
    {
        MsgBox("Failed to get file path. Clipboard is empty.")
        return
    }

    if !FileExist(FileToOpen)
    {
        MsgBox("File does not exist: " . FileToOpen)
        return
    }

    try
    {
        Run "msedge.exe " . FileToOpen
        ; MsgBox("Opened in Edge: " . FileToOpen)
    }
    catch as err
    {
        MsgBox("Error opening file: " . err.Message)
    }
}



; Edge PDF Viewer Quick Click
; #HotIf WinActive("ahk_class Chrome_WidgetWin_1")  ; Correct condition for v2.0
; ; Highlight
; F3::
; {
;     Click(117, 52)  ; Click at the coordinates (120, 50)
; }
; ; Draw
; F4::
; {
;     Click(193, 52)  ; Click at the coordinates (120, 50)
; }
; ; Text
; F5::
; {
;     Click(335, 60)  ; Click at the coordinates (120, 50)
; }


