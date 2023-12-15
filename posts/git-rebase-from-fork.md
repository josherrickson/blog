---
title: "Rebasing a fork on git"
date: 2023-12-09T06:16:42-05:00
---

There's tons of resources online about git rebase, but it took me a while to
find a solution to this specific problem.

You have a fork of a repository. You've made commits on your fork, and there are
also new commits on the original repository (call it the "upstream repository").
You want to pull in those changes, but *before* your commits, so you don't have
a merge.

1. Add the upstream repository as a remote:

```
git remote add upstream https://github.com/<upstream user>/<upstream repository>.git
```

2. Fetch the upstream changes:

```
git fetch upstream
```

3. Rebase:

```
git rebase upstream/<branch>
```

4. Push, with a force:

```
git push origin <branch> --force
```

What if you've already commited the merge? Find the hash of the last commit that
**you** made, then run

```
git reset --hard <hash>
```

This only works if the merge is the last thing you've done; if you have changes
on your fork both before and after the branch, it'll be far more complicated.

This is based off many sources, but primarily
<https://medium.com/@topspinj/how-to-git-rebase-into-a-forked-repo-c9f05e821c8a>.
