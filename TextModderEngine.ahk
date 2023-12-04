#Requires AutoHotkey v2.0
#SingleInstance Force

;[Laptop HQ] @xMaxrayx @Unbreakable-ray   at 17:10:03  on 2/12/2023   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?} (lets goo and re born :3) (this project was under my other username unbreakable-ray :3)

#Include "%A_ScriptDir%\MaxAHK-v2-Lib\notepadMangerv1.ahk"

;============
InstallKeybdHook(true,true)



;===============================[Temp engine]==========================
;/*

;notepad ++ for testing
enableNotepad :=1 ;for note ;temp

LWin & n::
{
    notepadManger(true, "ahk_exe notepad++.exe",  "C:\Program Files (x86)\Notepad++\notepad++.exe", )
}


;===============================[Debug]==========================