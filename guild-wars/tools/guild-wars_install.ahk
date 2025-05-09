#Warn ; Enable warnings to assist with detecting common errors.

#include "%A_ScriptDir%\..\..\findtext\tools\Lib\FindText.ahk"

SetTitleMatchMode 1 ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0
SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.

programFilesx86 := EnvGet("ProgramFiles(x86)")
programData := EnvGet("ProgramData")

winTitle := "ahk_class ArenaNet_Dialog_Class ahk_exe GwSetup.exe"

; Loading Installer
; Wait until the Guild Wars Installer is found
WinWait(winTitle)

okText := "|<>*119$17.D24n4P39Y2K84wE9cUGNVYFa8FsEs"

; Choose install location
; C:\Program Files (x86)\Guild Wars (Default)
if (FindText(&outputX := "wait", &outputY := -1, 0, 0, 0, 0, 0.4, 0.4, okText)) {
    Sleep 1000
    ControlSend "{Enter}" ; OK
}

; Download windows have the same title as above
; Game window has a different title
winTitle := "ahk_class ArenaNet_Dx_Window_Class ahk_exe Gw.exe"

; Game Window
; This will cause a wait for downloads to finish and for the game window to open
WinWait(winTitle)
if WinExist(winTitle) {
    Sleep 2000
    WinClose
    FileCreateShortcut programFilesx86 "\Guild Wars\Gw.exe", programData "\Microsoft\Windows\Start Menu\Programs\Guild Wars\Guild Wars.lnk"
}

ExitApp