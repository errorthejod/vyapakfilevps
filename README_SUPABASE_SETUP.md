# Vyapak Billing — Supabase Connected Setup

This package is configured to use your Supabase project as the primary database. Local JSON mode is disabled.

## First run (Windows laptop)

1. Extract the ZIP into a permanent folder.
2. Preserve your existing `.env` when updating an existing install. For a fresh install, copy `.env.example` to `.env` and set the project URL, publishable key, and server-only Secret key.
3. In Supabase → Project Settings → API Keys, create a **new Secret key** (rotate the one previously shared in chat) and paste it into `SUPABASE_SERVICE_ROLE_KEY` in `.env`. Do not put it in any `VITE_` variable or share the `.env` file.
4. Run `start-local.bat`.
5. If the check reports missing database tables, it will open the Supabase SQL Editor and `supabase/INSTALL_ALL.sql`. Copy the whole SQL file into SQL Editor and press **Run** once, then run `start-local.bat` again.

The SQL script is idempotent and uses `CREATE TABLE IF NOT EXISTS` / `ADD COLUMN IF NOT EXISTS`; it does not delete existing accounts. Apply it only to project `fgmkgvohvuyqnuazkjvi`.

## Email notifications

Purchase notification emails require a Resend API key and a verified sender domain:

```env
RESEND_API_KEY="your_resend_api_key"
RESEND_FROM="Vyapak Billing <billing@vyapakbilling.store>"
RESEND_REPLY_TO="vyapakbilling2026@gmail.com"
```

`RESEND_REPLY_TO` makes buyer replies go to your Gmail. Email API keys remain server-side.

## Security

- `.env` contains server-only configuration and must not be committed/shared.
- The old Supabase Secret key was shared in chat; rotate it and use the new one.
- The publishable key is intended for browser use; the Secret key is not.
- Back up your Supabase project and uploaded proof files as appropriate.
