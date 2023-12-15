---
title: "Hooks for loading R packages"
date: 2023-10-13T12:03:27-04:00
---

The `setHook` function can be used to add hooks when loading (or unloading) R
packages. For example, to update my [previous post]({{< ref
"devtools-better-yesno" >}}) about replacing the `yesno` function in
**devtools** can be improved by using hooks. The version in the original post
loaded **devtools** in every R session. By using hooks, the change to `yesno`
takes place anytime **devtools** is loaded, but does not require **devtools**
loaded in every R session.


```r
setHook(packageEvent("devtools", "onLoad"), {
  yesno <- function(...) {
    cat(paste0(..., collapse = ""))
    utils::menu(c("Yes", "No")) != 1
  }
  utils::assignInNamespace("yesno", yesno, "devtools")
  rm(yesno)
})
```

To improve this, we can first make sure **devtools** is actually installed on
the system.

```r
pkg <- utils::installed.packages()[, "Package"]

# Better yesno function from devtools
if (isTRUE("devtools" %in% pkg)) {
  setHook(packageEvent("devtools", "onLoad"), {
    yesno <- function(...) {
      cat(paste0(..., collapse = ""))
      utils::menu(c("Yes", "No")) != 1
    }
    utils::assignInNamespace("yesno", yesno, "devtools")
    rm(yesno)
  })
}
rm(pkg)
```

Make sure to `rm` the objects otherwise they'll exist in the environment when
you start a fresh R session.
