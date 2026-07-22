#!/bin/bash
# Lindaris 0.1.0 auf GitHub veröffentlichen.
# Voraussetzung: `gh auth login` ist einmal gelaufen (siehe README des Ordners).
set -e

cd "$(dirname "$0")"
REPO="Lindaris"
TAG="v0.1.0"
DMG="Lindaris_0.1.0_universal.dmg"

if [ ! -f "$DMG" ]; then
  echo "FEHLER: $DMG fehlt in $(pwd)"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "FEHLER: nicht bei GitHub angemeldet. Zuerst ausführen:  gh auth login"
  exit 1
fi

USER=$(gh api user --jq .login)
echo "Angemeldet als: $USER"

# 1) Repo anlegen (falls es noch nicht existiert) und README hochladen
if gh repo view "$USER/$REPO" >/dev/null 2>&1; then
  echo "Repo $USER/$REPO existiert bereits — überspringe das Anlegen."
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$USER/$REPO.git"
else
  echo "Lege öffentliches Repo $USER/$REPO an …"
  gh repo create "$REPO" --public \
    --description "Audio-Visualizer für macOS — System-Audio visualisieren, Musikvideos bauen und als MP4 exportieren" \
    --source=. --remote=origin
fi

echo "Lade README und Screenshots hoch …"
git push -u origin main

# 2) Release mit der DMG anlegen
if gh release view "$TAG" >/dev/null 2>&1; then
  echo "Release $TAG existiert schon — hänge die DMG an (überschreibt eine vorhandene)."
  gh release upload "$TAG" "$DMG" --clobber
else
  echo "Lege Release $TAG an und lade die DMG hoch (8 MB, dauert kurz) …"
  gh release create "$TAG" "$DMG" \
    --title "Lindaris 0.1.0" \
    --notes-file RELEASE_NOTES_v0.1.0.md
fi

echo
echo "Fertig. Deine Download-Seite:"
echo "  https://github.com/$USER/$REPO/releases/latest"
