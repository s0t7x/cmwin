@ECHO OFF
REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
REM !!! 		UNCOMPILED BATCH ONLY WORKS WITH		!!!
REM !!!   	CORRECT START PARAMETERS OR IN CORRECT DIRECTORY!	!!!
REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
setlocal ENABLEEXTENSIONS
set source=%1
if [%source%] == [] (set source=.)
set buildpath=%2
if [%buildpath%] == [] (set buildpath=build)
set architecture=%3
if [%architecture%] == [] (set architecture=x64)
:cm
cd %source%
if exist CMakeLists.txt (
	del cmwin.log.txt > nul
	rmdir /S /Q %buildpath%\%architecture% > nul
	set KEY_NAME="SOFTWARE\Microsoft\VisualStudio\15.0"
	echo Generating Visual Studio Solution...
	cmake -G "Visual Studio 15 2017" -A %architecture% -S %source% -B %buildpath%\%architecture% > cmwin.log.txt
	if exist %buildpath%\%architecture%\ALL_BUILD.vcxproj (
		echo Deploy to %buildpath%/%architecture%/Release...
		cmake --build %buildpath%\%architecture% --config Release >> cmwin.log.txt
		if exist "%buildpath%\%architecture%\Release\*.exe" (echo Done!
			goto end
		) else (
echo something went wrong while building!
			goto err
		)
	) else (
echo error generating!
		goto err
	)
) else (
echo CMakeLists.txt not found in: %source%
goto end
)
:err
 echo "look into cmwin.log.txt" 12 0
rem PrintReturn
:end
pause > nul