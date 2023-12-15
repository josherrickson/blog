.PHONY: all posts

all: index.html posts

index.html: index.md header.html footer.html
	pandoc -o tmp.html $<
	cat header.html tmp.html footer.html > $@
	rm tmp.html
	npx prettier $@ -w

posts:
	$(MAKE) -C posts
