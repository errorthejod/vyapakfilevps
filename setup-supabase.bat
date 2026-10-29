@echo off
cd /d "%~dp0"
echo Opening the Supabase project settings and one-time database setup files...
start "" "https://supabase.com/dashboard/project/fgmkgvohvuyqnuazkjvi/settings/api-keys"
start "" "https://supabase.com/dashboard/project/fgmkgvohvuyqnuazkjvi/sql/new"
start "" notepad.exe "%~dp0.env"
start "" notepad.exe "%~dp0supabase\INSTALL_ALL.sql"
echo.
echo 1. Paste a NEW rotated Secret key into SUPABASE_SERVICE_ROLE_KEY in .env.
echo 2. Copy all of INSTALL_ALL.sql into Supabase SQL Editor and click Run once.
echo 3. Save .env and run start-local.bat.
echo Do not share .env or publish it to GitHub.
pause
