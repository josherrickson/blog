# Adjusting spacing between icons in the Mac menubar

The below taken from
<https://www.jessesquires.com/blog/2023/12/16/macbook-notch-and-menu-bar-fixes/>:

Read the current defaults:

```
defaults -currentHost read -globalDomain NSStatusItemSpacing
defaults -currentHost read -globalDomain NSStatusItemSelectionPadding
```

Note: These values are not set by default. This means you will get an error that
the keys and values do not exist if you have not previously set them.

Write the defaults by providing an integer value:

```
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 12
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 8
```

Note: Unfortunately, you will need to logout and login for the changes to take
effect.

After some experimentation, I landed on the values above — 12 for spacing and 8
for padding fit my needs. You should experiment as well. The smallest tolerable
values are probably around 6 or 8.

Remove the values to restore the default behavior:

```
defaults -currentHost delete -globalDomain NSStatusItemSpacing
defaults -currentHost delete -globalDomain NSStatusItemSelectionPadding
```
Again, you will need to logout and login for the changes to take effect.
