@echo off
setlocal
cd /d "%~dp0"
set "LOCAL_DB=false"
set "VITE_LOCAL_DB_MODE=false"
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js is not installed. Install Node.js 22 LTS from https://nodejs.org/ and run this file again.
  pause
  exit /b 1
)
if not exist ".env" (
  copy ".env.example" ".env" >nul
)
if not exist "node_modules" (
  echo Installing app dependencies. This needs internet access...
  call npm install
  if errorlevel 1 (
    echo Dependency installation failed. Check internet access and npm output above.
    pause
    exit /b 1
  )
)
node scripts\prepare-supabase-env.mjs
if errorlevel 1 (
  echo.
  echo Open .env and paste a NEW Supabase Secret key at SUPABASE_SERVICE_ROLE_KEY.
  start "" "https://supabase.com/dashboard/project/fgmkgvohvuyqnuazkjvi/settings/api-keys"
  start "" notepad.exe "%~dp0.env"
  pause
  exit /b 1
)
node scripts\check-env.mjs
if errorlevel 1 (
  start "" notepad.exe "%~dp0.env"
  pause
  exit /b 1
)
node scripts\check-database.mjs
if errorlevel 1 (
  echo.
  echo Supabase tables are missing or incomplete. Run supabase\INSTALL_ALL.sql once in Supabase SQL Editor.
  start "" "https://supabase.com/dashboard/project/fgmkgvohvuyqnuazkjvi/sql/new"
  start "" notepad.exe "%~dp0supabase\INSTALL_ALL.sql"
  pause
  exit /b 1
)
echo.
echo Starting Vyapak Billing connected to Supabase project fgmkgvohvuyqnuazkjvi.
echo Keep this window open while using the app.
call npm run dev -- --host 0.0.0.0
pause
