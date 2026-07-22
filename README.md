# Lindaris

Ein Audio-Visualizer für macOS: System-Audio live visualisieren, oder einen Song laden, eine Musikvideo-Szene bauen und als MP4 exportieren.

![Lindaris — Szene mit organischer Bloom-Welle](docs/screenshot.png)

## Download

**[→ Neueste Version herunterladen](../../releases/latest)**

Universal Binary — läuft auf Apple Silicon (M1/M2/M3) und Intel-Macs.

## Installation

1. DMG öffnen, **Lindaris.app** in den Ordner *Programme* ziehen.
2. **Beim ersten Start:** Rechtsklick auf die App → **Öffnen** → im Dialog nochmal **Öffnen**.

> **Warum der Umweg?** Lindaris ist nicht bei Apple notarisiert (das kostet ein
> kostenpflichtiges Entwicklerkonto). macOS blockiert deshalb den normalen
> Doppelklick beim ersten Mal. Der Rechtsklick-Weg ist Apples offizieller Weg,
> eine Anwendung trotzdem zu starten — danach öffnet sie normal per Doppelklick.
>
> Falls macOS die App als „beschädigt" meldet, hilft im Terminal:
> ```
> xattr -cr /Applications/Lindaris.app
> ```

## Systemvoraussetzungen

- **macOS 14.2** oder neuer
- Für **System-Audio**: Berechtigung zur Bildschirm-/Audioaufnahme (fragt die App beim ersten Start ab)
- Für den **Video-Export**: [ffmpeg](https://ffmpeg.org) muss installiert sein:
  ```
  brew install ffmpeg
  ```
  Ohne ffmpeg funktioniert alles außer dem Export; die App sagt dann klar Bescheid.

## Was die App kann

**System-Audio-Modus** — visualisiert, was gerade auf dem Mac läuft (Spotify, YouTube, egal was), in drei Stilen: Spektrum, Welle, Partikel. Vollbild per Doppelklick, Bedienelemente blenden sich aus.

**Song-Modus** — eine Audiodatei laden (MP3, WAV, FLAC, M4A), abspielen, scrubben. Die Analyse läuft einmal über den ganzen Song, dadurch ist die Darstellung exakt reproduzierbar.

**Szene** — daraus ein Musikvideo bauen: Hintergrundbild, Logo mit Glühen, eine organische Bloom-Welle, die auf die Musik reagiert (Bass an den Seiten, fließender Regenbogen-Saum), optional Titel und Interpret. Format 16:9 oder 9:16.

**Export** — die Szene als MP4 rendern, in 1080p oder 4K, mit dem Original-Ton. Das exportierte Video sieht exakt so aus wie die Vorschau — dieselbe Render-Funktion erzeugt beides.

![Ein Frame aus einem exportierten Video](docs/export-frame.png)

## Bekannte Grenzen

- **Nur macOS.** Windows und Linux sind nicht getestet.
- **Nicht notarisiert** — daher der Rechtsklick beim ersten Start (siehe oben).
- **Export braucht ffmpeg** im System (siehe oben).
- Sehr lange Songs brauchen beim Export viel Arbeitsspeicher.

## Status

Frühe Version (0.1.0). Sie tut, was oben steht, und wurde auf einem Apple-Silicon-Mac
end-to-end getestet — inklusive eines echten Videoexports. Auf Intel-Macs ist sie
gebaut, aber nicht gelaufen.

---

Der Quellcode ist nicht öffentlich. Fehler und Wünsche gerne als
[Issue](../../issues).
