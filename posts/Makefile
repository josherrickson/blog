MD_FILES := $(wildcard *.md)
HTML_FILES=$(MD_FILES:.md=.html)

.PHONY:default
default: $(HTML_FILES)

%.html: %.md
	pandoc -o tmp.html $< --no-highlight
	cat ../header.html tmp.html ../footer.html > $@
	rm tmp.html
	npx prettier $@ -w
