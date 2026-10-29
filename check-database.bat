@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js is not installed. Install Node.js 22 LTS and try again.
  pause
  exit /b 1
)
if not exist ".env" (
  echo Missing .env. Copy .env.example to .env and configure your Supabase values.
  pause
  exit /b 1
)
node scripts\check-database.mjs
pause
