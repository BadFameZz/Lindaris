Der Video-Export findet ffmpeg jetzt auch dann, wenn es per Homebrew installiert ist.

## Behoben

**„ffmpeg ist nicht installiert" — obwohl es installiert war.** Wer ffmpeg per
`brew install ffmpeg` eingerichtet hatte, bekam beim Export trotzdem diese
Meldung. Der Grund liegt in macOS: eine aus dem Finder gestartete App erbt den
PATH der Shell **nicht**, sie sieht nur die Systemverzeichnisse — und Homebrew
liegt nicht darin. Im Terminal lief ffmpeg einwandfrei, für Lindaris war es
unsichtbar.

Lindaris sucht ffmpeg jetzt zusätzlich an den üblichen Orten (Homebrew auf
Apple Silicon und Intel, MacPorts, System) und prüft dabei, ob das gefundene
Binary auch wirklich startet — ein durch ein Homebrew-Update beschädigtes
ffmpeg wird übersprungen statt blockierend ausgewählt.

Liegt dein ffmpeg woanders, kannst du den Pfad über die Umgebungsvariable
`LINDARIS_FFMPEG` vorgeben.

## Weiterhin offen

Die ffmpeg-Prüfung läuft erst **am Ende** des Exports. Fehlt ffmpeg ganz, rechnet
Lindaris den kompletten Export durch und meldet es erst danach. Das wird in einer
kommenden Version an den Anfang gezogen.

## Installation

DMG öffnen, App nach *Programme* ziehen (vorhandene ersetzen). Dann **einmalig freigeben**:

```
xattr -cr /Applications/Lindaris.app
```

Ohne Terminal: *Systemeinstellungen → Datenschutz & Sicherheit → „Trotzdem öffnen"*.
(*Rechtsklick → Öffnen* gibt es seit macOS 15 nicht mehr für nicht-notarisierte Apps.)

Liegt die App nicht in *Programme*, den Pfad im Befehl entsprechend anpassen.

Für den Video-Export wird weiterhin [ffmpeg](https://ffmpeg.org) gebraucht: `brew install ffmpeg`
