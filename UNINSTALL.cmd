::##############################################################################
:: *DOCUMENTATION*
:: This UNINSTALL.bat uninstalls mine-sweeper off MS Windows

@echo	off

::##############################################################################
:: Uninstall

rmdir	"%ProgramFiles(x86)%\mine-sweeper\"			/s /q
rmdir	"%userprofile%\Start Menu\Programs\mine-sweeper\"	/s /q
echo	Clean old installations
echo	

pause

::##############################################################################
:: END

echo	on
