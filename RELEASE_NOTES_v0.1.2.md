Lindaris hat ein eigenes Icon.

## Neu

**Eigenes App-Icon.** Bisher trug die App das Tauri-Standardicon — im Dock und im
Programme-Ordner war sie damit von jeder anderen Tauri-App nicht zu unterscheiden.
Jetzt steht dort ein Lindaris-Icon: das „L" als leuchtende Welle über einem
Spektrum, auf dunklem Grund.

Das Icon folgt der macOS-Norm (Kunstfläche mittig auf transparentem Canvas), sitzt
also im Dock genauso wie die Apple-Icons daneben — nicht als randlose Kachel.

## Sonst

Nichts. Diese Version ändert an der Funktion nichts; wer 0.1.1 benutzt und mit dem
Standardicon leben kann, verpasst nichts.

## Installation

DMG öffnen, App nach *Programme* ziehen (vorhandene ersetzen). Dann **einmalig freigeben**:

```
xattr -cr /Applications/Lindaris.app
```

Ohne Terminal: *Systemeinstellungen → Datenschutz & Sicherheit → „Trotzdem öffnen"*.
(*Rechtsklick → Öffnen* gibt es seit macOS 15 nicht mehr für nicht-notarisierte Apps.)

Falls das alte Icon nach dem Ersetzen im Dock hängen bleibt: das ist der
Icon-Cache von macOS, nicht die App. Einmal ab- und wieder anmelden räumt ihn auf.

Für den Video-Export wird weiterhin [ffmpeg](https://ffmpeg.org) gebraucht: `brew install ffmpeg`
