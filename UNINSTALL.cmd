::##############################################################################
:: *DOCUMENTATION*
:: This UNINSTALL.bat uninstalls mine_sweeper off MS Windows

@echo	off

::##############################################################################
:: Uninstall

rmdir	"%ProgramFiles(x86)%\mine-sweeper\"	/s /q
echo	"Clean old installations"
echo	""

::##############################################################################
:: END

echo	on
