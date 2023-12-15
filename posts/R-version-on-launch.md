---
title: "Displaying R Version on Launch"
date: 2023-11-26T21:28:51-05:00
draft: false
---

I've started using [rig](https://github.com/r-lib/rig) to manage my R versions,
since I need both current and development versions. I wanted a way to keep track
of which version of R was currently running. I started with a simple `cat` call
in my .Rprofile, but that caused issues occasionally.

Instead, the answer is to use `message()`. E.g.,

```r
message(paste0("Version: ", version$major, ".",
               version$minor, " ", version$status))
```

Note that this is *not* affected by the `--quiet` flag, so `R --quiet` will
suppress the long R startup message while still displaying your custom message.

(I also played around with modifying the prompt but decided against it, but if
that's your flavor, check [this stackoverflow
answer](https://stackoverflow.com/a/1448823) for how to manipulate it.)
