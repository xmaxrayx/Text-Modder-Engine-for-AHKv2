#Requires AutoHotkey v2.0
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 10:57:45  on 3/12/2023   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
;ver 0.1v [beta]
global notepadStatus := "notOpen"

;=====[how to use]=======
;l:: notepadManger(true, "ahk_exe notepad++.exe",  "C:\Program Files (x86)\Notepad++\notepad++.exe", )
;l::notepadManger(1,)
;========================

notepadManger(enableNotepad,notepadAppEXE?, notepadAppPath?){


     enableNotepad :=  enableNotepad?? 0

    if enableNotepad == 1 {
         global notepadStatus := notepadStatus?? "notOpen"
         notepadAppPath := notepadAppPath?? "notepad" ;"C:\Program Files (x86)\Notepad++\notepad++.exe"
         notepadAppEXE := notepadAppEXE?? "ahk_exe Notepad.exe" ;ahk_exe notepad++.exe"    
        
        
        if (notepadStatus = "opened"){ 
        WinMinimize notepadAppEXE
        global notepadStatus := "minimize"
        return
        }

        else If (notepadStatus == "notOpen"){ 
            Run notepadAppPath
            WinWait notepadAppEXE
            WinMaximize notepadAppEXE
            global notepadStatus := "maximize" 
            return
        }       

        else if (notepadStatus == "maximize"){
            NotepadWindowAction("minimize")
        }
        
        else if (notepadStatus == "minimize"){
            NotepadWindowAction("maximize")

        }
        else{
            NotepadWindowAction("maximize")
            ;global notepadStatus := "notOpen"
        } ;end of notepadStatus
        
    } ;end of enableNotepad =: 1

    else if enableNotepad == 0{
        return
    }
    else{ ;safe code
        enableNotepad := 0
        return
    }

NotepadWindowAction(action){
    if !WinExist(notepadAppEXE){
        Run notepadAppPath
        WinWait notepadAppEXE
        WinMaximize notepadAppEXE
    }
    else{

        if action == "maximize" {
            WinMaximize notepadAppEXE
            global notepadStatus := "maximize"
            return
        }
        else if action == "minimize" {
            WinMinimize notepadAppEXE
            global notepadStatus := "minimize" 
            return
        }
    } 
        
} ;end of func
    
    return
}

