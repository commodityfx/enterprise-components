@ECHO OFF
IF NOT EXIST BIN GOTO NOBIN

set EC_SYS_PATH=%CD%

REM  ---- q enviroment ----
set QHOME=%EC_SYS_PATH%\bin\q
set QLIC=%EC_SYS_PATH%\etc

REM ---- ec enviroment ----
set EC_QSL_PATH=%EC_SYS_PATH%/bin/ec/libraries/qsl/
set EC_ETC_PATH=%EC_SYS_PATH%/etc
set EC_SYS_ID=handle_test
set EC_SYS_TYPE="FUNC_TEST"

REM ---- yak enviroment ----
set YAK_PATH=%EC_SYS_PATH%\bin\yak
REM TODO: check interference with the other systems started from the same location
set YAK_OPTS=-c %EC_ETC_PATH%/system.cfg -s %EC_SYS_PATH%/data/test/%EC_SYS_ID%/yak/yak.status -l %EC_SYS_PATH%\log\test\%EC_SYS_ID%\yak\yak.log

REM ---- path ----
set PATH=%QHOME%\w32;%YAK_PATH%;%PATH%

REM ---- print ----
echo env for system %EC_SYS_ID%/%EC_SYS_TYPE% loaded

GOTO END
:NOBIN
ECHO expected bin subdirectory
:END
