# Vyapak Billing — Laptop / Self-Hosted Build

This version is configured for **local database mode by default**, so you can launch the app without manually creating Supabase tables or pasting a service-role key. Login/signup, account records, trial/plan data, CA requests, user settings, saved bills, and payment requests use a persistent JSON database in the project `data` folder.

## Start on Windows

1. Extract this ZIP into a permanent folder, for example `C:\Vyapak-Billing`.
2. Install Node.js 22 LTS if needed: https://nodejs.org/
3. Double-click **`start-local.bat`**.
4. On first start, it installs dependencies and creates the local database automatically.
5. Open the local URL printed in the terminal (use the exact port shown).
6. Keep the terminal window open while using the website; press Ctrl+C to stop it.

No Supabase SQL Editor steps or Supabase Secret key are required for this local mode.

## Local data and backups

- Database: `data\vyapak-local.json`
- Payment proof uploads: `data\storage\payment-proofs\`
- Back up the whole `data` folder to preserve accounts and records.
- Do not delete the `data` folder if you want to keep your records.

The built-in local store is intended for a **single application instance** (laptop or one VPS). Do not run multiple server replicas against this JSON file. If you later need multi-instance production hosting, migrate the app to PostgreSQL/Supabase.

## Admin and demo login

- Admin panel password: value of `ADMIN_PASSWORD` in `.env` (starter default: `delhi5932`). Change this before exposing the app to any network.
- A demo user is seeded on first use: ID `BB001`, password/PIN `1234`. Create your own account through Signup for normal use, and change/remove demo access before public deployment.

## Optional email notifications

Email delivery requires a valid Resend API key and a sender address verified with that provider. Configure these values in `.env`:

```env
RESEND_API_KEY="your_resend_api_key"
RESEND_FROM="Vyapak Billing <your-verified-sender@your-domain.com>"
RESEND_REPLY_TO="vyapakbilling2026@gmail.com"
```

Replies to purchase, buyer-confirmation, and decision emails are directed to `vyapakbilling2026@gmail.com` by default. Email notifications are not delivered until valid credentials are configured; the rest of local functionality does not depend on them.

## Supabase mode (optional)

The current `.env` sets `LOCAL_DB=true`. To use remote Supabase instead, set `LOCAL_DB=false`, configure a server-only `SUPABASE_SERVICE_ROLE_KEY`, and apply the migrations in `supabase/migrations/` plus `supabase/FIX_ACCOUNT_CREATION.sql` to that database. Never use a `VITE_` prefix for the service-role key.

The secret key previously pasted in the conversation should be rotated in Supabase before using that project again. This local-mode ZIP does not include that secret.

## Build

```bat
npm install
npm run build
```

## Template/import notes

- Admin-managed global bill templates remain centrally managed by the app, and selected templates are rendered through the invoice template renderer.
- HTML is the reliable format for dynamic invoice templates. PDF and image imports are visual references and do not automatically become editable dynamic HTML.
