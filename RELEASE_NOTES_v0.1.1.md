Kleines Update mit einer sichtbaren Korrektur.

## Neu

**Logo wird rund zugeschnitten.** Bisher lag ein quadratisches Logo als Kachel im runden weißen Blob — der Kreisrahmen aus der Vorlage fehlte. Jetzt schneidet Lindaris das Logo kreisförmig zu (nicht-quadratische Bilder werden mittig beschnitten statt verzerrt), und der Blob bildet drumherum den weißen Rahmen. Im Szene-Panel gibt es dafür den Schalter **Logo rund**, falls du das quadratische Bild doch willst.

## Installation

DMG öffnen, App nach *Programme* ziehen (vorhandene ersetzen). Dann **einmalig freigeben**:

```
xattr -cr /Applications/Lindaris.app
```

Ohne Terminal: *Systemeinstellungen → Datenschutz & Sicherheit → „Trotzdem öffnen"*.
(*Rechtsklick → Öffnen* gibt es seit macOS 15 nicht mehr für nicht-notarisierte Apps.)

Für den Video-Export wird weiterhin [ffmpeg](https://ffmpeg.org) gebraucht: `brew install ffmpeg`
