; I noticed that my mouse's back/forward navigation buttons did not function in the Microsoft Yammer 
; windows desktop application, so I created an AutoHotKey script to make them work. It simply 
; intercepts the back/forward buttons from the mouse only when yammer is active, and sends the
; correct back/forward hot keys to Yammer.

; cerner_2^5_2018

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe yammer.exe
	XButton1::Send ^[
	XButton2::Send ^]
#IfWinActive