# Prereqs

Besides normal *nix tools, this also uses [prettier](https://prettier.io) to
clean up the HTML output. Technically not really needed, and can be removed from
the Makefile.

# New posts

1. Create a .md file inside `posts/`. The first line should be `# <title>`,
   where "`<title>`" will be used as the page title.

2. Update index.md to add a link to the file.

3. Update rss.xml to add a link for the RSS feed.

4. Run `make`.

`make open` will open docs/index.html
