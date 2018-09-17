rem This script adds a new context menu for right clicking on a directory or the background of a directory
rem to give a quick way to browse to a git repo in your default browser.

rem cerner_2^5_2018

rem  Running this batch file without any arguments will install the required registry keys. In this case, it will need to be run as administrator.
if "%~1"=="" goto install

rem Running it with -uninstall will do what you expect. But only if you run it as administrator!
if "%~1"=="-uninstall" goto uninstall

rem Running it with (what is hopefully) a directory as the parameter will try to get the git url and launch it in a browser. Set the working directory to the given directory.
cd /d %~1

rem Get the git url and open it in default browser it if it is valid. Requires git and that git is in the PATH environment variable.
for /f "tokens=* usebackq" %%f in (`git ls-remote --get-url`) do (set gitUrl=%%f)
echo %gitUrl% | find /I "http">Nul && ( start %gitUrl%  )
exit

:install
	rem Add registry keys for context menu when right clicking on a directory.
	reg add "HKEY_CLASSES_ROOT\Directory\shell\GitRepoBrowseContextMenu" /ve /t REG_SZ /d "Open Git Repo in "^&"Browser" /f
	reg add "HKEY_CLASSES_ROOT\Directory\shell\GitRepoBrowseContextMenu\command" /ve /t REG_SZ /d "\"%~f0\" \"%%1\"" /f

	rem Add registry keys for context menu when right clicking the background inside a directory.
	reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\GitRepoBrowseContextMenu" /ve /t REG_SZ /d "Open Git Repo in "^&"Browser" /f
	reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\GitRepoBrowseContextMenu\command" /ve /t REG_SZ /d "\"%~f0\" \"%%V\"" /f

	rem Add icon to the menu items if the icon exists.
	if exist %~dp0git_icon.ico (reg add "HKEY_CLASSES_ROOT\Directory\shell\GitRepoBrowseContextMenu" /v icon /t REG_SZ /d "%~dp0git_icon.ico" /f
		reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\GitRepoBrowseContextMenu" /v icon /t REG_SZ /d "%~dp0git_icon.ico" /f)

	rem Create an easy uninstall file rather than manually calling this batch file with -uninstall.
	echo call "%~f0" -uninstall>%~dp0%~n0_Uninstall.bat
	if %errorLevel%==1 goto error
	exit
rem end :install

:uninstall
	reg delete "HKEY_CLASSES_ROOT\Directory\shell\GitRepoBrowseContextMenu" /f
	reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\GitRepoBrowseContextMenu" /f
	if %errorLevel%==1 goto error
	exit
rem end :uninstall

:error
	echo Please ensure you run this as administrator!
	pause
rem end :error
