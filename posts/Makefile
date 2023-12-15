MD_FILES := $(wildcard *.md)
HTML_FILES=$(MD_FILES:.md=.html)

.PHONY: default
default: $(HTML_FILES)

%.html: %.md
	@echo "$< -> $@"
	pandoc -o tmp.html $< --no-highlight
	cp ../header.html header-tmp.html
	sed -i '' "s/::TITLE::/$$(head -n 1 $< | sed 's/^# //' | tr -d '\n')/" header-tmp.html
	cat header-tmp.html tmp.html ../footer.html > $@
	rm tmp.html
	rm header-tmp.html
	npx prettier $@ -w
