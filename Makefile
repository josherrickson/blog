.PHONY: all posts move

all: index.html posts move

index.html: index.md header.html footer.html
	pandoc -o tmp.html $<
	cat header.html tmp.html footer.html > $@
	rm tmp.html
	npx prettier $@ -w


posts:
	$(MAKE) -C posts

move: index.html posts
	mv index.html docs/
	mv posts/*.html docs/
	rm -rf docs/images
	cp -r images docs/images
