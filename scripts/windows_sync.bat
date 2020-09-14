@echo off

rem Переменные
set DATADIR=%1
set GITDIR=%2
set LOGFILE="%DATADIR%/scripts/windows_sync.log"

rem Вступление
echo " ">>%LOGFILE%
call :log "==============================================="
call :log "Changes from Windows"

rem Выполнение команд
rem call :log "Command 'cd %GITDIR%'"
cd /d %GITDIR%

call :log "Command 'git diff'"
git diff --name-status >>%LOGFILE% 2>>&1

call :log "Command 'git add .'"
git add . >>%LOGFILE% 2>>&1

call :log "Command 'git commit'"
git commit -a -m "Changes from Windows - %date% %time%" >>%LOGFILE% 2>>&1

call :log "Command 'git pull'"
git pull origin >>%LOGFILE% 2>>&1

call :log "Command 'git push'"
git push origin master >>%LOGFILE% 2>>&1

rem Функции
:log
    set MES=%date% %time% === %1
	echo %MES%
    echo %MES%>>%LOGFILE% 2>>&1
exit /b
