::##############################################################################
:: *DOCUMENTATION*
:: This SETUP.bat installs mine-sweeper in MS Windows

::##############################################################################
:: Uninstall previous installations

call	"%~dp0\UNINSTALL.cmd"

::##############################################################################
:: Install

@echo	off

mkdir	"%ProgramFiles(x86)%\mine-sweeper\"
echo	"Create %ProgramFiles(x86)%/mine-sweeper/"
mkdir	"%ProgramFiles(x86)%\mine-sweeper\bin\"
echo	"Create %ProgramFiles(x86)%/mine-sweeper/bin/"
mkdir	"%ProgramFiles(x86)%\mine-sweeper\share\"
echo	"Create %ProgramFiles(x86)%/mine-sweeper/share/"
mkdir	"%ProgramFiles(x86)%\mine-sweeper\var\"
echo	"Create %ProgramFiles(x86)%/mine-sweeper/var/"
echo	""

copy	"%~dp0\UNINSTALL.cmd"		"%ProgramFiles(x86)%\mine-sweeper"
echo	"Copy UNINSTALL.cmd"
copy	"%~dp0\COPYING.txt"		"%ProgramFiles(x86)%\mine-sweeper"
echo	"Copy COPYING.txt"
copy	"%~dp0\README.txt"		"%ProgramFiles(x86)%\mine-sweeper"
echo	"Copy README.txt"
robocopy	"%~dp0\share"		"%ProgramFiles(x86)%\mine-sweeper\share"	/e
echo	"Copy share/*"
robocopy	"%~dp0\var"		"%ProgramFiles(x86)%\mine-sweeper\var"		/e
echo	"Copy var/*"
copy	"%~dp0\bin\mine-sweeper.exe"	"%ProgramFiles(x86)%\mine-sweeper\bin"
echo	"Copy bin/mine-sweeper.exe"
echo	""

mkdir	"%userprofile%\Start Menu\Programs\mine-sweeper\"
mklink	"%userprofile%\Start Menu\Programs\mine-sweeper\mine-sweeper"	"%ProgramFiles(x86)%\mine-sweeper\bin\mine-sweeper.exe"
mklink	"%userprofile%\Start Menu\Programs\mine-sweeper\UNINSTALL"	"%ProgramFiles(x86)%\mine-sweeper\UNINSTALL.cmd"
mklink	"%userprofile%\Start Menu\Programs\mine-sweeper\README"		"%ProgramFiles(x86)%\mine-sweeper\README.txt"
mklink	"%userprofile%\Start Menu\Programs\mine-sweeper\COPYING"	"%ProgramFiles(x86)%\mine-sweeper\COPYING.txt"
echo	"Create start menu shortcuts"
echo	""

echo	"Done"
echo	""

pause

::##############################################################################
:: END

echo	on
