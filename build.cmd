SET CLANGPATH=\src\v8\v8\third_party\llvm-build\Release+Asserts\bin\clang-cl.exe

if "%1"=="clang" goto clang

:msvc
SET COMPILER=cl.exe
SET NOEXPINLINE=-d1noexpinl
::SET NOEXPINLINE=
goto build

:clang
SET COMPILER=%CLANGPATH%
SET NOEXPINLINE=/Zc:dllexportInlines-

:build
:: Build the exporting DLL
%COMPILER% /DBUILDING_DLL /Od /GS- %NOEXPINLINE% myclass.cc /link /dll /noentry /nodefaultlib

:: Build the consumer as a DLL
%COMPILER% /Od /GS- %NOEXPINLINE% mybin.cc /link /dll /noentry /nodefaultlib myclass.lib

:: Build the consumer as an EXE
%COMPILER% /Od /GS- %NOEXPINLINE% mybin.cc /link /subsystem:console /entry:main /nodefaultlib myclass.lib
