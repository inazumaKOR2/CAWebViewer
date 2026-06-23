@echo off
setlocal

cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is required.
  exit /b 1
)

where npx.cmd >nul 2>nul
if errorlevel 1 (
  echo npx.cmd is required.
  exit /b 1
)

if exist dist rmdir /s /q dist
mkdir dist

set "SOURCE_APP=app.js"
if exist "..\app.js" set "SOURCE_APP=..\app.js"

copy /y index.html dist\index.html >nul
copy /y styles.css dist\styles.css >nul
copy /y README.md dist\README.md >nul
copy /y serve.bat dist\serve.bat >nul
copy /y .nojekyll dist\.nojekyll >nul

echo Source app:
echo %SOURCE_APP%

call npx.cmd --yes javascript-obfuscator@4.1.1 "%SOURCE_APP%" --output dist\app.js --compact true --rename-globals false --identifier-names-generator hexadecimal --string-array true --string-array-encoding base64 --string-array-threshold 0.55 --split-strings true --split-strings-chunk-length 8 --unicode-escape-sequence false --transform-object-keys false --control-flow-flattening false --dead-code-injection false --debug-protection false --self-defending false --source-map false
if errorlevel 1 exit /b 1

node --check dist\app.js
if errorlevel 1 exit /b 1

if /I "%~1"=="--root" (
  copy /y dist\app.js app.js >nul
  node --check app.js
  if errorlevel 1 exit /b 1
  echo Root app.js updated with obfuscated build.
)

echo.
echo Release ready:
echo %CD%\dist
