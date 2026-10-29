# Vyapak Billing — Settings refresh

This update reorganizes Settings into focused, responsive sections:

- Business Profile — business name, address, phone, email and optional trade/tax number.
- GST & Tax — GSTIN, registration type, PAN, state code, default GST rate and tax split, new-invoice GST/Credit defaults.
- Bank Details — bank, account, IFSC, branch and jurisdiction.
- Invoice Branding — logo, authorised signature and stamp uploads, with image type/size checks.
- Terms & Conditions — editable printed terms.
- CA Access — existing CA access manager.
- Bill Templates — explanation of centrally managed templates.

There is one sticky Save Settings bar, Discard changes, responsive navigation, unsaved-change state, and read-only behavior when the account is restricted. GSTIN placeholders do not contain a real sample GSTIN.

The trial duration remains 7 days. Email notification code now loads `.env` on the server and the purchase form surfaces safe delivery failure reasons (for example, missing API key, unverified sender, or provider rejection).

## Important

The ZIP deliberately does not include `.env`, because it contains server secrets. Preserve your own `.env` when updating an existing installation. For a fresh install, copy `.env.example` to `.env` and fill in your configuration. Never share or commit `.env`.

A full production build could not be verified in this environment because dependency installation timed out. All 172 TypeScript/TSX source files passed syntax parsing.


## User Print Settings

Settings now includes **Print Settings** with separate **Regular Printer** and **Thermal Printer** profiles. Each user's preferences are stored with their business settings, including layout/color, paper size/orientation, header fields, logo visibility, text size, copy label/count preference, top PDF spacing, item-table columns, and thermal roll width (58mm/80mm). The preview uses the built-in renderer so layout/color changes are visible immediately. Imported admin HTML templates retain their custom internal design; generic paper-width and print layout are applied around them.
