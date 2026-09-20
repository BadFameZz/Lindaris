#!/bin/bash
# Eine Lindaris-Version auf GitHub veröffentlichen.
#
#   ./veroeffentlichen.sh 0.1.2     — diese Version veröffentlichen
#   ./veroeffentlichen.sh           — die neueste DMG im Ordner nehmen
#
# Voraussetzung: `gh auth login` ist einmal gelaufen (siehe README des Ordners).
set -euo pipefail

cd "$(dirname "$0")"
REPO="Lindaris"

# Version bestimmen: Argument, sonst die neueste DMG im Ordner.
if [ $# -ge 1 ]; then
  VERSION="$1"
else
  NEUESTE=$(ls -t Lindaris_*_universal.dmg 2>/dev/null | head -1)
  [ -n "$NEUESTE" ] || { echo "FEHLER: keine Lindaris_*_universal.dmg in $(pwd)"; exit 1; }
  VERSION=$(echo "$NEUESTE" | sed -E 's/^Lindaris_(.+)_universal\.dmg$/\1/')
  echo "Keine Version angegeben — nehme die neueste DMG: $VERSION"
fi

TAG="v$VERSION"
DMG="Lindaris_${VERSION}_universal.dmg"
NOTES="RELEASE_NOTES_${TAG}.md"

# Alles Nötige muss da sein, bevor irgendetwas hochgeht.
[ -f "$DMG" ]   || { echo "FEHLER: $DMG fehlt in $(pwd)"; exit 1; }
[ -f "$NOTES" ] || { echo "FEHLER: $NOTES fehlt in $(pwd)"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "FEHLER: nicht bei GitHub angemeldet. Zuerst:  gh auth login"; exit 1; }

USER=$(gh api user --jq .login)
echo "Angemeldet als: $USER — veröffentliche $TAG"

# 1) README und Screenshots hochladen
echo "Lade README und Screenshots hoch …"
git push -u origin main

# 2) Release anlegen oder die DMG an ein vorhandenes anhängen
if gh release view "$TAG" >/dev/null 2>&1; then
  echo "Release $TAG existiert schon — hänge die DMG an (überschreibt eine vorhandene)."
  gh release upload "$TAG" "$DMG" --clobber
else
  echo "Lege Release $TAG an und lade die DMG hoch (etwa 9 MB) …"
  gh release create "$TAG" "$DMG" \
    --title "Lindaris $VERSION" \
    --notes-file "$NOTES"
fi

echo
echo "Fertig. Deine Download-Seite:"
echo "  https://github.com/$USER/$REPO/releases/latest"
