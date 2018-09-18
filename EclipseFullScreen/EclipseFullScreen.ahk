; This combines two eclipse short cuts into one to simulate a better full screen.

; cerner_2^5_2018

﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2

; When user presses Ctrl + Shift + F11, do some magic.
^+F11::
	WinActivate, Eclipse IDE
	IfWinActive, Eclipse IDE
	{
		; Alt + F11 followed by Ctrl + F8
		Send, !{F11}
		Send, ^{F8}
	}
return
