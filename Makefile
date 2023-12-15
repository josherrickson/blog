MD_FILES := $(wildcard posts/*.md)
TMP=$(MD_FILES:.md=.html)
HTML_FILES=$(subst posts,docs,$(TMP))

.PHONY: all move-files open

all: docs/index.html $(HTML_FILES) move-files

docs/index.html: index.md header.html footer.html
	mkdir -p docs
	pandoc -o tmp.html index.md
	cp header.html header-tmp.html
	sed -i '' "s/::TITLE::/Blog/" header-tmp.html
	cat header-tmp.html tmp.html footer.html > $@
	rm tmp.html
	rm header-tmp.html
	npx prettier $@ -w

docs/%.html: posts/%.md
	mkdir -p docs
	pandoc -o tmp.html $< --no-highlight
	cp header.html header-tmp.html
	sed -i '' "s/::TITLE::/$$(head -n 1 $< | sed 's/^# //' | tr -d '\n')/" header-tmp.html
	cat header-tmp.html tmp.html footer.html > $@
	rm tmp.html
	rm header-tmp.html
	npx prettier $@ -w


move-files:
	rm -rf docs/images
	cp -r images docs/images
	cp rss.xml docs/

open:
	open docs/index.html
