# Exclude files from git commands

To exclude files from git commands such as `git grep` or `git diff`:

```bash
git grep foobar -- ':!*.java'
git diff -- ':!*.html' ':!abc.csv'
```

Works for whole folders as well.
