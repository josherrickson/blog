---
title: "Fixing colors in Emacs themes in tmux"
date: 2023-10-14T20:12:30-04:00
---

For years I've struggled with certain themes in Emacs having incorrect colors
when run in the terminal (`emacs -nw`) but appearing correct in GUI Emacs.
Finally found a solution - the issue was with tmux. The fix for me was to
include this in my .tmux.conf:

```
set -g default-terminal 'screen-256color'
set -ga terminal-overrides ',*256col*:Tc'
```

This comes from
https://github.com/alacritty/alacritty/issues/109#issuecomment-440353106. There
are a number of other similar suggested fixes in that thread if this doesn't
work.

One thing that made testing this easier is this script:

```
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh >24-bit-color.sh
bash 24-bit-color.sh
```

With the correct settings, each row of colors is an almost smooth gradient. With
the incorrect settings, there are clear discrepancies in the gradient.
