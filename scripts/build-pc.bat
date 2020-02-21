@echo off
echo COMPILING PC...
SET PROJECT_DIR=%~dp0..

SET OUTPUT_DIR=%PROJECT_DIR%\igeLibs\SDL

SET OUTPUT_HEADER=%OUTPUT_DIR%\include
SET OUTPUT_LIBS_DEBUG=%OUTPUT_DIR%\libs\Debug\pc
SET OUTPUT_LIBS_RELEASE=%OUTPUT_DIR%\libs\Release\pc

echo Fetching include headers
xcopy /q /e /y include\* %OUTPUT_HEADER%\

cd %PROJECT_DIR%
echo Compiling x86
if not exist build\x86 (
	mkdir build\x86
)
cd build\x86
echo Generating x86 CMAKE project ...
cmake ..\.. -A Win32
if errorlevel 1 goto ERROR

echo Compiling x86 - Debug...
cmake --build . --config Debug -- -m
if errorlevel 1 goto ERROR
xcopy /q /e /y Debug\* %OUTPUT_LIBS_DEBUG%\x86\

echo Compiling x86 - Release...
cmake --build . --config Release -- -m
if errorlevel 1 goto ERROR
xcopy /q /e /y Release\* %OUTPUT_LIBS_RELEASE%\x86\
echo Compiling x86 DONE

cd %PROJECT_DIR%
echo Compiling x64...
if not exist build\x64 (
	mkdir build\x64
)
echo Generating x64 CMAKE project ...
cd build\x64
cmake ..\.. -A x64 
if errorlevel 1 goto ERROR

echo Compiling x64 - Debug...
cmake --build . --config Debug -- -m
if errorlevel 1 goto ERROR
xcopy /q /e /y Debug\* %OUTPUT_LIBS_DEBUG%\x64\

echo Compiling x64 - Release...
cmake --build . --config Release -- -m
if errorlevel 1 goto ERROR
xcopy /q /e /y Release\* %OUTPUT_LIBS_RELEASE%\x64\
echo Compiling x64 DONE
goto ALL_DONE

:ERROR
	echo ERROR OCCURED DURING COMPILING PC

:ALL_DONE
	cd %PROJECT_DIR%
	echo COMPILING PC DONE!