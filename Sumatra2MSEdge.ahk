; ; not working for getting the file path; need further fix;
; #Requires AutoHotkey v2.0

; ; Define the hotkey (Ctrl+Shift+E in this example)
; ^+e::
; {
;     ; Activate Sumatra PDF window
;     if WinExist("ahk_exe SumatraPDF.exe")
;         WinActivate
;     else
;     {
;         MsgBox("Sumatra PDF is not running.")
;         return
;     }

;     ; Send the keyboard shortcut to open properties in Sumatra PDF
;     Send "^d"
    
;     ; Wait for the properties window to appear
;     if !WinWait("Document Properties",, 3)
;     {
;         MsgBox("Couldn't open document properties.")
;         return
;     }
    
;     ; Copy the file path
;     Send "^c"
    
;     ; Close the properties window
;     Send "{Esc}"
    
;     ; Get the copied text (file path) from the clipboard
;     FileToOpen := A_Clipboard
    
;     ; Open the file in Microsoft Edge
;     Run "msedge.exe " . FileToOpen

; }

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