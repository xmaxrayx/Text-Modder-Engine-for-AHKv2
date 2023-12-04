;@xmaxray @unbreakable-ray (steam_writing_assistant_v2.ahk) orignal file
;@xMaxrayx @Unbreakable-ray   at 22:36:43  on 23/7/2023   (24H Formart)  (UTC +2) (fourms_writing_assistant_v2.ahk) new forked file
;[Laptop HQ] @xMaxrayx @Unbreakable-ray   at 17:07:05  on 2/12/2023   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?} time to say goodbey unbreakable-ray :(
;=================================[app]===========================
textModerEngineVersion := "0.1(beta)"
textModerEngineAouther := "@xMaxrayx @Unbreakable-ray"


appDir := "/fourms_writing_assistant"
;=================================[hotkeys]===========================

insrtKey := "$Enter"
backspaceKey := "$Backspace"
;ListKey := "s"
;=================================[hotkeys to func]===========================

Hotkey backspaceKey, SmartDeleteEngine

;Hotkey ListKey , SmartListEngine

;=================================[call new-global variable with defoult valu]===========================

global textModerCodeStart := "Tell a programmer: didn't recive a new variable `n`nSection : global variable`n`nVariable :textModerCodeStart" ; this for bb code start
global textModerCodeEnd := "Tell a programmer: didn't recive a new variable `n`nSection : global variable `n`nVariable :textModerCodeEnd" ;this for bb code end
global textModerCurserMove := "Null" 
global textModerISThisF1toF24Hotekey := False ;// do this  ;work arround for some hotkeys wont work with 'bind' (use "true" to fix it)
global textModerCodeEndLastChar := "Null" ;Tell a programmer : didn't get/caculate last char ;work around becouse sometime windouus selction may select "["
global isUnDeletionRequire := false 
global dublcateCodeStart := "Tell A programmer : didn't caculate variable `"dublcateCodeStart`""
global dublcateCodeEnd := "Tell A programmer : didn't caculate variable `"dublcateCodeEnd`""

global smartInsertNewline := "{Esc}`n" 
global smartInsert := 0
global smartDelete := 0
global texModderOutput := "Null"
global isAutopasteNotAllowed := false

global horizontalCodeStart := 'Tell A programmer undefined code "horizontalCodeStart"'
global horizontalCodeEnd := 'Tell A programmer undefined code "horizontalCodeEnd"'

;for SmartListEngine()
global ListCodeStart := 'Tell A programmer undefined code "ListCodeStart"'
global ListCodeEnd := 'Tell A programmer undefined code "ListCodeEnd"'
global listCodeNewlineStart := 'Tell A programmer undefined code "listCodeNewlineStart"'
global listCodeNewlineEnd := 'Tell A programmer undefined code "listCodeNewlineEnd"'
global lineSelectHotkey := "{Shift Down}{Home}{Shift Up}" 
global lineSelectHotkeyDouble := "{Shift Down}{Home}{Home}{Shift up}" 

;?
global smartNavigation ;//?



;===============================[start the engine]==========================
smartNavigation := 1 ;For Smart navigation  
modClipbord_God := "" ;clipboread work
modClipbord_Backup := ""






;===============================[Temp engine]==========================
;/*

;notepad ++ for testing
note :=1 ;for note ;temp
#n::
{
    global note  

    If (note=1)
        {
            Run "C:\Program Files (x86)\Notepad++\notepad++.exe"
            WinMaximize "ahk_exe notepad++.exe"
            note := 2
            return
        }
    if (note = 2)
        {
            WinMinimize "ahk_exe notepad++.exe" 
            note := 1
            return
        }
        return

    }

;*/
;===============================[Debug]==========================
;remove and add to display or allow it(;)
+F1:: MsgBox "Navigation mode is     [ " . smartNavigation . " ].", ("Debug window = Navigation" ), "Iconi" ;cheak navigation mode
+F2:: MsgBox "modClipbord_God contains:    [" . modClipbord_God . "] `n `n A-Clipboard contains:    [" . A_Clipboard . "]", ("Debug window = Navigation" ), "Iconi" ;cheak navigation mode



msgInfo_god := "Navigation mode is     [ " . smartNavigation . " ]. `n`n modClipbord_God contains:    [" . modClipbord_God . "] `n`n Clipboard contains (A_Clipboard):    [" . A_Clipboard . "]  `n `n modClipbord_Backup contains:    [" . modClipbord_Backup . "] ."
MSGINFOTEST := "Navigation mode is     [ " . smartNavigation . " ]."
;$F4:: MsgBox ( msgInfo_god) , ("Debug window = God mode" ) ;;bug
$F4:: MsgBox "Navigation mode is     [ " . smartNavigation . " ]. `n`n modClipbord_God contains:    [" . modClipbord_God . "] `n`n Clipboard contains (A_Clipboard):    [" . A_Clipboard . "]  `n `n modClipbord_Backup contains:    [" . modClipbord_Backup . "] ." , ("Debug window = God mode" )

/*
;;varable
msgInfo_smartNavigation := "Navigation mode is     [ " . smartNavigation . " ]."
msgInfo_modClipbord_God :="modClipbord_God contains:    [" . modClipbord_God . "] ."
msgInfo_Clipboard := "A-Clipboard contains:    [" . A_Clipboard . "]"
msgInfo_fileSignature := "Signature status: [" . fileSengture . "]"
msgInfo_modClipbord_Backup := "modClipbord_Backup contains:    [" . modClipbord_Backup . "] ."

F4:: MsgBox ("" . msgInfo_smartNavigation . "`n `n" . msgInfo_modClipbord_God . "" )
*/

;===============================[quote]==========================



;================================[horizontal rule]============================

textModderHorizontalEngineVersion := 1
horizontalFunc()
{ 
    global texModderOutput := (horizontalCodeStart . horizontalCodeEnd)

    global isAutopasteNotAllowed ;to Disable autopaste
    if (isAutopasteNotAllowed == true)
        {
            global isAutopasteNotAllowed := false
            return
        }
    else 
    {
        A_Clipboard := texModderOutput
        send '^v'
        Send ("{Enter}")
    }
    
 }


;================================[code]============================

;================================[navitaction]============================


^Down:: 
{
    Send "^{End}"
}

;================================[Smart navigation]============================
;defult number is 1
^Space::
 {
            global smartNavigation

            
            if ( smartNavigation=1)
                {
                    Send "^{End}"
                    return
                }
                    
            else if (smartNavigation=2)
                {
                    Send ("{Right 4}")
                    SendInput (" ")
                    global smartNavigation :=1
                    return
                }

                else if (smartNavigation=3)
                    {
                        Send "{Right}{Space}"
                        global smartNavigation :=1
                        return
                    }
                else if (smartNavigation=4)
                    {
                    Send "{Left 4}"
                    SendInput " "
                    global smartNavigation := 1
                    return
                   }

               return 
 }
        




;================================[signature]============================
F1::
{
A_Clipboard :=  signature
Send "^v"
return
}


F5:: 
{
    global signature := FileRead(A_MyDocuments . "\SWA.txt" ,"UTF-8") ;update
}

+F5::
{
    
   Run 'notepad.exe ' A_MyDocuments . "\SWA.txt"
   WinWait("ahk_exe notepad.exe")
   SetTimer cheakNotepadExit, 20
   
   
   
   cheakNotepadExit()
    {
        if WinExist("ahk_class Notepad") 
            {
                ;restart
                return
            }
        
                        
        else
            {
            ;Sleep(200)
            global signature := FileRead(A_MyDocuments . "\SWA.txt", "UTF-8") ;update
            SetTimer ,0
            fileSengture := "internal-edited and loaded"
            MsgBox  "Info: New signature louded", ("Steam writing assistant"), "0x40000 Iconi"
            }
            
    }
      
        
    }



    ;Run A_MyDocuments . "\SWA.txt"
    ;WinWait("ahk_exe notepad.exe")




;================================[Auto lower case]============================


$f10::
{
    A_Clipboard := ""
    ;Send "^c" ;dosn't work with f10
   SendInput("{ctrl Down}c{ctrl Up}")    
    if !ClipWait(0.1)
        {
            Msgbox "no text"
        }
    modClipbord_God := (StrLower(A_Clipboard)) 
    A_Clipboard := (modClipbord_God)
    Send("{ctrl Down}v{ctrl Up}")   
    modClipbord_Backup_for_devs := A_Clipboard
    Sleep (50) ;TRY TO FIX
    A_Clipboard := ""
}
;================================[Auto-translate]============================ temp

;dir := A_MyDocuments . "\Steam-writing-assistant\Hotstring\tybo\Autocomb.txt"
;Include "C:\Users\max\Documents\Steam-writing-assistant\Hotstring\tybo\Autocomb.ahk"
;#Include "" . A_MyDocuments . "\Steam-writing-assistant\Hotstring\tybo\Autocomb.ahk"

#Include "%A_MyDocuments%\Steam-writing-assistant\Hotstring\tybo\Autocomb.ahk"


;================================[Auto tybe fix]============================
/*
::im::I'm
::hes::he's
::Hes::He's
::shes::she's
::Shes::She's
::i::I
*/




;test new key




;

/*
a::{
    global ListCodeStart := "[$]"
    global ListCodeEnd :=  "[/$]"
    global listCodeNewlineStart := "[*]"
    global listCodeNewlineEnd := ""
    SmartListEngine()
   
}
*/







;================================           ==============================
;================================[textModer]============================
;================================           ============================

;textModerCodestart
;textModerCodeEnd


textModerFunc()
{ 
   global maxtextModerSmartEngineversion := 3

;=======caling global variable=====
    global smartNavigation
    global textModerCodeStart
    global textModerCodeEnd 
    global textModerCodeEndLastChar 
    global textModerISThisF1toF24Hotekey
    global isUnDeletionRequire
;==============================================
   
 
    if (textModerCurserMove == 0) ;caculate lenght of BB code if it's wont given
            {
            global textModerCurserMove := StrLen(textModerCodeEnd)
            }
        if (textModerCodeEndLastChar == "Null")
            {
                global textModerCodeEndLastChar := SubStr(textModerCodeEnd, -1)
            }
 ;===========[A-1]  part 1     
    if (isUnDeletionRequire == true) ;; For stuf like "quote"
    {
    A_Clipboard := ""
    Send "^c"
        if !ClipWait(0.2,0) ;if there is no text by mose selection
        {                                        
            if (modClipbord_God="") ;start (see if modClipbord_God empty)  //? must add for no backuo quote
            { 
            SetTimer ChangeButtonNames, 20 ;timer to change butten naem
            Result := MsgBox("There is no slected text `n Add Quote [BB] code?", ("Error: No text found" ), "YNC Iconi Default3 0x40000")
            
                if (Result = "Yes")
                {  
                A_Clipboard := (textModerCodestart " " textModerCodeEnd)
                Sleep(50)
                Send "^v"
                Send("{Left 8}")
                return 
                }

                else if (Result = "No")
                {
                global modClipbord_Backup
                A_Clipboard := (modClipbord_Backup)
                Send "^v"
                return  
                }
        
                
                else if (Result ="Cancel")
            
                {
                Sleep(10)
                return 
                }
                            
                ChangeButtonNames() ;change bttens names
                {
                if !WinExist("Error: No text found")
                    return  ; Keep waiting.
                SetTimer , 0
                WinActivate
                ControlSetText "&Yes", "Button1"
                ControlSetText "&Last quoted", "Button2"
                }
                return
            } ;end  of (see if modClipbord_God empty)



            else ;if modClipbord_God has stumodClipbord_Backup {smart auto-paste quote}
                {
                A_Clipboard := modClipbord_God
                Send ("^v")
                global modClipbord_Backup := modClipbord_God
                modClipbord_God := ""
                return
                }    
        

        }
        else ;if text found with (isUnDeletionRequire == true) 
        {    
        global modClipbord_God := (textModerCodestart . A_Clipboard . textModerCodeEnd)
        global modClipbord_Backup := modClipbord_God
        A_Clipboard := modClipbord_God
        return
        }
    }

;==========[A-1] part 2  --> isUnDeletionRequire == false

    else {  
        ;MsgBox "no quote mode"  ;test
        A_Clipboard := "" 
        Send "^c"  ;for mouse selection
        if !ClipWait(0.1) ;if mouse selection was empty go use auto-keyboeard selection (last word)
            {
                if (textModerISThisF1toF24Hotekey == false) ;somehotekesys wont work with '{Blind}' so I made this
                    {
                        Send '{Blind}+{Left}'  ;this won't work with f1-f24 key
                    }
                else
                    {
                        Send("^+{left}") ;for f1-f12 hotkeys
                    }
                Send "^c" ;to copy auto-keyboeard selection
            if !ClipWait(0.1) ;if auto-keyboeard selection was empty
                {
                    send (textModerCodeStart . textModerCodeEnd)
                    send ("{left " . textModerCurserMove . "}")
                    global smartNavigation :=2 
                    return
                }
            modClipbord_God := ""  
            modClipbord_God := A_Clipboard
            modClipbord_God := StrReplace(A_Clipboard, A_Space, "") ;remove space
            modClipbord_God := StrReplace(A_Clipboard, "`r`n", "") ;remove new lines     
            
            if (modClipbord_God == textModerCodeEndLastChar) ;workaround to fix wrong postion with if [bb] [/bb] was last thingon auto-keyboeared selction
            {
                Send ("{Delete}")
                Sleep(10)
                A_Clipboard :=(textModerCodeEndLastChar . textModerCodestart . textModerCodeEnd) 
                Send  "^v"
                Sleep(10)
                Send ("{Left 4}")
                global smartNavigation := 2 ;for Smart navigation
                return
            }             
            else 
            {
                A_Clipboard := (textModerCodeStart . modClipbord_God . textModerCodeEnd)
                Send "^v"
                global smartNavigation := 4 ;for Smart navigation
                return

            }    
    return
                        
                } ;end of bold by keybored
                    
                    
        ;if mouse selection has text
        
        global modClipbord_God := ""  
        global modClipbord_God := A_Clipboard
        global modClipbord_God := StrReplace(A_Clipboard, A_Space, "") ;remove space
        global modClipbord_God := StrReplace(A_Clipboard, "`r`n", "") ;remove new lines   modClipbord_God:= A_Clipboard
        global modClipbord_God := (textModerCodeStart . modClipbord_God . textModerCodeEnd)
        A_Clipboard := modClipbord_God
        Send "^v"
        

        ;End of whole textmoderFunc




            }

        ;================== return global var to defoult      
        global textModerCodeStart := "Tell a programmer : Didn't recive new variable from last Funiction use"
        global textModerCodeEnd := "Tell a programmer : Didn't recive new variable from last Funiction use"
        global textModerCurserMove := 0 
        global textModerISThisF1toF24Hotekey := False
        global textModerCodeEndLastChar  := "Null"
        global isUnDeletionRequire := false
    }


    
DublcationNotBrakcetFunc(){
    local ThisHotkeyString := String(A_ThisHotkey)
    SendInput (ThisHotkeyString . ThisHotkeyString)
    Send ("{Left}")
    global smartNavigation := 3
}


SmartDuplicationFunc(){
global smartNavigation
A_Clipboard := "" 
Send "^c"  
if !ClipWait(0.1) ;Dublcate if the is no text
    {               
    MaxSmartDublcationEngine_Math()
    global modClipbord_God := (dublcateCodeStart . dublcateCodeEnd)
    A_Clipboard := modClipbord_God
    Send "^v"
    Send "{left}"
    global smartNavigation := 3
    
    ;===== Rest global Var=======
    global dublcateCodeStart := "Tell A programmer : didn't caculate variable `"dublcateCodeStart`""
    global dublcateCodeEnd := "Tell A programmer : didn't caculate variable `"dublcateCodeEnd`""
    ;=============================
    return          
    } 

;Dublcate if the is a text by [mouse] selction

MaxSmartDublcationEngine_Math()
global modClipbord_God := ""  
global modClipbord_God := A_Clipboard
global modClipbord_God := StrReplace(modClipbord_God, A_Space, "") ;remove space
global modClipbord_God := StrReplace(modClipbord_God, "`r`n", "") ;remove new lines   modClipbord_God:= A_Clipboard
global modClipbord_God := (dublcateCodeStart . modClipbord_God . dublcateCodeEnd)
A_Clipboard := modClipbord_God
Send "^v"
;Send "{space}"

;===== Rest global Var=======
global smartNavigation := 1
global dublcateCodeStart := "Tell A programmer : didn't caculate variable `"dublcateCodeStart`""
global dublcateCodeEnd := "Tell A programmer : didn't caculate variable `"dublcateCodeEnd`""
;=============================

}

AutoListConverter_Math()
{
global listCodeNewlineStart
global listCodeNewlineEnd 

;MsgBox (listCodeNewlineStart listCodeNewlineEnd)
;MsgBox A_Clipboard

unModedList := A_Clipboard

unModedList := StrReplace(unModedList, "`n" , "")

unModedList := StrReplace(unModedList,"`r" , "`n" . listCodeNewlineStart)

unModedList := listCodeNewlineStart . unModedList
unModedList := StrReplace(unModedList,"`n" , listCodeNewlineEnd . "`n")

unModedList := unModedList . listCodeNewlineEnd

if ( listCodeNewlineEnd != "") 
    {   
        unModedList := StrReplace(unModedList , "`n" . listCodeNewlineStart . listCodeNewlineEnd . "")  ;//bug fixed with empty 
    }
    else 
    {
    ;MsgBox unModedList
    unModedList := StrReplace(unModedList , ( listCodeNewlineStart . "`n"))
    }


global ModedList := (ListCodeStart . "`n" . unModedList . "`n" . ListCodeEnd)

A_Clipboard := ModedList
;MsgBox ModedList
}










;========================list

SmartListEngine()
{ 
    global ListCodeStart
    global ListCodeEnd
    
    global listCodeNewlineStart
    global listCodeNewlineEnd

    global smartNavigation

    global lineSelectHotkey := "{Shift Down}{Home}{Shift Up}" ;//??
    global lineSelectHotkeyDouble := "{Shift Down}{Home}{Home}{Shift up}" ;//?
    
    global smartInsert := 4


    A_Clipboard := "" 
    Send "^x"  
        if !ClipWait(0.1) ;no text 
        { 
        ;MsgBox "no text with normal selcet"
        
        Send lineSelectHotkeyDouble  
        Send '^x'
        
            if !ClipWait(0.1) 
            { ;no text with hotekeysDouble
               ; MsgBox "no text with hoykey selcet level [1]"
                Send lineSelectHotkey
                Send  '^x'

                if !ClipWait(0.1) 
                    {   ;no text with hotekey normal
                       ; MsgBox "no text with hoykey selcet level [2]"
                        modClipbord_God := (ListCodeStart . "`n" . listCodeNewlineStart . listCodeNewlineEnd . "`n" . ListCodeEnd)
                        A_Clipboard := modClipbord_God
                        Send '^v'
                        send "{up}"
                        return

                    }
                ;text found hotekey normal
                ;MsgBox "text found level [2]"
                
                SmartList_Math()

                Send '^v'
                send "{up}"
               ;send "ledt " ;//must

                return
            } ;text found with hotekeysDouble

        SmartList_Math()
        send '^v'
        Send '{up}{End}' ;(left) ;//must
        global smartInsert := 4
        return
                    
      } ;end of bold by keybor

      ;MsgBox (A_Clipboard)
      AutoListConverter_Math()
      Send '^v'
                                
}

SmartInsertEngine()
{   
    global smartInsertNewline
    global smartInsert
    if (smartInsert == 0)
        {
            Send "{Enter}"
        }
    if (smartInsert == 4)
        {
            Send (smartInsertNewline . listCodeNewlineStart . listCodeNewlineEnd)
            Send "{left " .  ((StrLen(listCodeNewlineEnd))) . '}'
            global smartDelete := -4
        }
}                                

SmartList_Math(){
modClipbord_God := LTrim(A_Clipboard , A_Space)
modClipbord_God := (ListCodeStart . "`n" . listCodeNewlineStart . modClipbord_God . listCodeNewlineEnd . "`n" . ListCodeEnd)
A_Clipboard := modClipbord_God
}



SmartDeleteEngine(ThisHotkey){
    global smartDelete
    if smartDelete == 0
        {
            Send "{Backspace}"
        }
    else if(smartDelete == -4)
        {   
            Send "{Backspace " .  ((StrLen(listCodeNewlineStart)) + (StrLen(listCodeNewlineEnd))) . '}'
            global smartDelete := 0
            global smartInsert := 0
        }
}



















;===========================================================
;=========================Math Func=========================
;===========================================================



MaxSmartDublcationEngine_Math(){
;====== global var
    global dublcateCodeStart := "Tell A programmer : didn't caculate variable `"dublcateCodeStart`""
    global dublcateCodeEnd := "Tell A programmer : didn't caculate variable `"dublcateCodeEnd`""
;====================================


    local ThisHotkeyString := A_ThisHotkey
    char := ["\(", "{" , "\[" , "<", "\)" , "}" , "\]" , ">" ]
    i := 0
    isITaBraket := 0
   

    while !(i == char.Capacity) && !(isITaBraket == 1)
        {
            i += 1
            
            ;MsgBox char.Get(i)
            
            isITaBraket := RegExMatch(ThisHotkeyString, char.Get(i))
            
        
        }

    ;MsgBox isITaBraket
    if isITaBraket == true
           
        { ;for double-bracket char
            ;=========left side becaouse its more common
           if  A_ThisHotkey == "("
                {   
                    global dublcateCodeStart := "("
                    global dublcateCodeEnd := ")"
             
                }
            else if  A_ThisHotkey == "{"
                {   
                    global dublcateCodeStart := "{"
                    global dublcateCodeEnd := "}"
                   
                }
            else if  A_ThisHotkey == "["
                {   
                    global dublcateCodeStart := "["
                    global dublcateCodeEnd := "]"
                }
            else if  A_ThisHotkey == "<"
                {
                    global dublcateCodeStart := "<"
                    global dublcateCodeEnd := ">"
                }
            ;============Right side
            ;)}]>
            else if  A_ThisHotkey == ")"
                {
                    global dublcateCodeStart := "("
                    global dublcateCodeEnd := ")"
                }
    
            else if  A_ThisHotkey == "}"
                {
                    global dublcateCodeStart := "{"
                    global dublcateCodeEnd := "}"
                }
            else if  A_ThisHotkey == "]"
                {
                    global dublcateCodeStart := "["
                    global dublcateCodeEnd := "]"
                }
            else if  A_ThisHotkey == ">"
                {
                    global dublcateCodeStart := "<"
                    global dublcateCodeEnd := ">"
                }      
                

        }
    
    else if isITaBraket == false
        {   

            global dublcateCodeStart := A_ThisHotkey
            global dublcateCodeEnd := A_ThisHotkey
            global smartNavigation := 3 
        }
    
    }
