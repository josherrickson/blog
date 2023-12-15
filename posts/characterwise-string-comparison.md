# Character-wise String Comparison in R

If you have two strings in R and want to check character-by-character equality:

```r
a <- "abcdef"
b <- "abcdff"
Reduce(`==`, strsplit(c(a, b), ""))
```

This results in:

```r
> Reduce(`==`, strsplit(c(a, b), ""))
[1]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
```
