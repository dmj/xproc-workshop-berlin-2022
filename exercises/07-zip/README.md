# Import von Verlagsdaten in das Repositorium des FID Romanistik

## Verarbeitungsschritte

### Lieferung entpacken (Ant)

TBD

### ONIX Normalisieren (XProc, fid:normalize-onix)

Wir erhalten Verlagsdaten in verschiedenen Variationen von ONIX: Version 2 oder 3, Kurz- oder Referenzform. Der Schritt
die Metadaten und überführt sie in das Referenzformat von ONIX 2 oder ONIX 3.

### SAF Metadaten erzeugen (XProc, fid:create-saf-metadata)

Erzeugt aus dem normalisierten ONIX die deskriptiven Metadaten und legt sie im SAF Zielverzeichnis ab.

### SAF Inhalte erzeugen (XProc, fid:create-saf-content)

Kopiert die Paketinhalte in das SAF-Zielverzeichnis und erstellt die Inhaltsbeschreibung. Die ZIP-Datei wird zusätzlich
als Inhalt im Bundle DEPOSIT geführt.

## Lizenz

Pipelines und Transformationen sind wenn nicht anders angegeben Copyright (c) by Staats- und Universitätsbibliothek
Hamburg und unter der GNU General Public License v3 veröffentlicht.

Die ONIX Schemadateien und DTDs unterliegen dem Copyright von EDItEUR und sind unter den in den Dateien aufgeführten
Lizenzbestimmungen benutzbar.

## Autoren

David Maus &lt;david.maus@sub.uni-hamburg.de&gt;
