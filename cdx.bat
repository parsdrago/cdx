@echo off

if "%1"=="" goto usage
if "%1"=="-l" goto list
if "%1"=="-a" goto add

for /f "tokens=1,2 delims=?" %%a in (%~dp0%setting.txt) do (
  if %%a==%1 (
    cd %%b
    exit /b
  )
)

exit /b

:usage
echo Jump: cdx.bat [label]
echo List: cdx.bat -l
echo Add: cdx.bat -a [label] [path]
echo:
echo Example: cdx.bat -l
echo Example: cdx.bat -a home C:\Users\John
echo Example: cdx.bat -a work C:\Users\John\Work
echo Example: cdx.bat work
echo:
echo Note: The label must be unique.
echo:
exit /b

:list
for /f "tokens=1,2 delims=?" %%a in (%~dp0%setting.txt) do (
  echo %%a  %%b
)
exit /b

:add
if exist %~dp0%setting.txt (
  for /f "tokens=1 delims=?" %%a in (%~dp0%setting.txt) do (
    if %%a==%2 (
      echo %2 already exists.
      exit /b
    )
  )
)
echo %2?%3 >> setting.txt
echo %2?%3 >> %~dp0%setting.txt
exit /b
