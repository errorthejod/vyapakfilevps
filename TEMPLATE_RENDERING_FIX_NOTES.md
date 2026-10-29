# Uploaded invoice template rendering fix

This update removes the global A4/flex rules that forced every uploaded invoice into a flex column and stretched the item table to fill the page. That behavior caused single item rows to become extremely tall and obscured the lower parts of the selected bill template.

Changed files:
- `src/components/InvoiceTemplate.tsx`
- `src/lib/renderGlobalTemplate.ts`
- `src/lib/printInvoice.ts`

What changed:
- Preserve uploaded HTML template sizing, display mode, section spacing, and table row heights.
- Keep only safe max-width rules for the page, tables, and images.
- Print and PDF no longer force global templates or item tables to a page-sized flex layout.
- Existing 7-day trial patch is included.

Installation:
- Extract this project over the existing project folder, allowing source files to overwrite.
- KEEP your existing `.env` file; it is intentionally not included in this ZIP.
- No database migration is required for this renderer fix.
