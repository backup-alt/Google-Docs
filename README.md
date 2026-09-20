# Google Docs (Offline Clone)

A familiar document workspace for writing, formatting, and organizing your ideas — a lightweight, offline, single-page clone of Google Docs. No sign-in, no backend; everything is saved on your device.

## Live demo

**Hosted: https://backup-alt.github.io/Google-Docs/**

## Features

- Rich text editing (bold, italic, underline, colors, highlights)
- Font, font size (with per-cursor and selection support), and paragraph styling
- Undo / redo (keyboard shortcuts and toolbar buttons)
- Images inserted at the cursor (downscaled, persisted)
- Multiple documents / tabs with autosave to your browser (localStorage)
- Page setup, styles, and pageless mode
- Comments, version history, viewing mode, find & replace, and more
- Responsive layout for desktop and mobile

## Run locally

Static app (no build step needed):

```sh
# serve the dist/ folder
npm start        # or: node server.cjs
# then open http://localhost:3000
```

Or open `dist/index.html` directly in a browser.

## Deploying

The app is a static site living in `dist/` (relative asset paths, safe for any subpath or CDN). GitHub Pages deploys from the `gh-pages` branch (contents of `dist/`). Push a new release with:

```sh
git subtree push --prefix dist origin gh-pages
```

## Tests

```sh
node scripts/smoke.cjs   # end-to-end smoke suite (needs the server on :3000)
```

## Attribution

- Google Material Symbols and Roboto fonts are bundled for offline use (see `ASSET_SOURCES.md`).
- Brand/logos are used for desktop-app-style navigation only.