# XProc

Dieses Repository enthält Folien, Programme, Übungen und Beispiele des Online-Workshops an der Berlin-Brandenburgischen
Akademie der Wissenschaften (bbaw), 14. Oktober 2022.

## MorganaXProc-III w/ Saxon 10.8 & SchXslt Schematron 1.9.3

Das Verzeichnis ```bin/morgana``` enthält eine konfigurierte Version des XProc 3.0-Prozessors »MorganaXProc-III«. Diese
Version verwendet Saxon HE 10.8 für XSLT Transformationen und SchXslt 1.9.3 für die Schematron-Validierung. 

Um zu testen, ob MorganXProc-III wie gewünscht funktioniert, kann die Pipeline ```exercise/01-hello/pipeline.xpl```
ausgeführt werden.

```
cd xproc-workshop-berlin-2022
bin/morgana/Morgana.bat exercises/01-hello/pipeline.xpl
=================================
MorganaXProc-IIIse 1.0
Copyright 2011-2022 by <xml-project /> Achim Berndzen
=================================

[09:35:46.46] We are running MorganaXProc-IIIse 1.0 from <xml-project /> Achim Berndzen.
[09:35:46.50] Running Schematron validation as p:validate-with-schematron
Using Saxon-HE 10.8. XSLT and XQuery processor developed by Saxonica Limited
SchXslt is copyright (c) 2018 and later by David Maus <dmaus@dmaus.name> and released under the terms of the MIT license.
bin/morgana/Morgana.bat exercises/01-hello/pipeline.xpl  12.37s user 0.23s system 274% cpu 4.598 total
```

## Lizenzen

MorganaXProc-III unterliegt dem Copyright (c) 2011-2022 von &lt;xml-project/> Achim Berndzen und ist unter der GNU
General Publice License 3 veröffentlicht. Der Quelltext ist auf
[SourceForge](https://sourceforge.net/projects/morganaxproc-iiise/) verfügbar.

Saxon HE 10.8 unterliegt dem Copyright (c) von Saxonica Ltd und ist unter der [Mozilla Public License
2.0](https://opensource.org/licenses/MPL-2.0) veröffentlicht. Saxon HE ist auf
[SourceForge](http://saxon.sourceforge.net/) verfügbar.

SchXslt Schematron unterliegt dem Copyright (c) 2018-2022 von David Maus und ist unter den Bedingungen der
[MIT](https://opensource.org/licenses/MIT)-Lizenz veröffentlicht. Der Quelltext ist auf
[Github](https://github.com/schxslt/schxslt) verfügbar.
