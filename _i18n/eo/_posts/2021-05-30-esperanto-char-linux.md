---
title: Kiel skribi la esperantajn literojn en Linukso
author: victorb
---

Skribi la esperantajn literojn en Linukso povas esti malfacila. Sed kun tio vi povas uzi `Alt Gr` por ĝi.

Aldonu en `.Xmodmap` :

```
keycode 54 = c C NoSymbol NoSymbol ccircumflex Ccircumflex
keycode 42 = g G NoSymbol NoSymbol gcircumflex Gcircumflex
keycode 43 = h H NoSymbol NoSymbol hcircumflex Hcircumflex
keycode 44 = j J NoSymbol NoSymbol jcircumflex Jcircumflex
keycode 39 = s S NoSymbol NoSymbol scircumflex Scircumflex
keycode 30 = u U NoSymbol NoSymbol ubreve Ubreve
```

Do nun `Alt Gr + c` donas `ĉ` kaj `Shift + Alt Gr + c` donas `Ĉ`.

Vi ne bezonas plu uzi la h-sistemo aŭ la x-sistemo. 

Ĝuu!
