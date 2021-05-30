---
title: Kiel skribi la esperantojn literojn en Linukso
author: Victor B
---

Skribi la esperantojn literojn en Linukso povas esti malfacila. Sed vi povas uzi `Alt Gr` por tio.

Aldonu ĝin en `.Xmodmap` :

```
keycode 54 = c C NoSymbol NoSymbol ccircumflex Ccircumflex
keycode 42 = g G NoSymbol NoSymbol gcircumflex Gcircumflex
keycode 43 = h H NoSymbol NoSymbol hcircumflex Hcircumflex
keycode 44 = j J NoSymbol NoSymbol jcircumflex Jcircumflex
keycode 39 = s S NoSymbol NoSymbol scircumflex Scircumflex
keycode 30 = u U NoSymbol NoSymbol ubreve Ubreve
```

Kaj nun vi povas skribi ĉ kun `Alt Gr` + `c` aŭ Ĉ kun `Shift` + `Alt Gr` + `c`

Vi ne devas plu uzi la h-sistemo aŭ la x-sistemo!
