Die erste öffentliche Version von Lindaris.

## Was drin ist

**System-Audio visualisieren** — drei Stile (Spektrum, Welle, Partikel), Vollbild, Bedienelemente blenden sich aus.

**Song-Modus** — MP3, WAV, FLAC oder M4A laden, abspielen, scrubben. Die Analyse läuft einmal komplett über den Song, dadurch ist die Darstellung reproduzierbar.

**Szene** — Musikvideo-Komposition: Hintergrundbild, Logo mit Glühen, organische Bloom-Welle mit Bass an den Seiten und wanderndem Regenbogen-Saum, optional Titel/Interpret. 16:9 oder 9:16.

**Video-Export** — MP4 in 1080p oder 4K mit Original-Ton, Fortschrittsanzeige, abbrechbar. Das Video ist Bild für Bild identisch mit der Vorschau.

## Installation

DMG öffnen, App nach *Programme* ziehen. **Beim ersten Start Rechtsklick → Öffnen** (die App ist nicht bei Apple notarisiert, macOS blockiert sonst den Doppelklick).

Für den Export wird [ffmpeg](https://ffmpeg.org) gebraucht: `brew install ffmpeg`

## Voraussetzungen

- macOS 14.2 oder neuer
- Universal Binary: Apple Silicon und Intel

## Ehrlich gesagt

Getestet wurde auf einem Apple-Silicon-Mac, dort auch ein kompletter Videoexport
mit einem echten Song. Der Intel-Teil ist gebaut, aber nie gelaufen. Windows und
Linux gibt es nicht. Sehr lange Songs brauchen beim Export viel Arbeitsspeicher.
