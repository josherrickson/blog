SRC_DIR = posts
DEST_DIR = docs

HTML_FILES := $(wildcard $(SRC_DIR)/*.html)
HTML_DEST_FILES := $(patsubst $(SRC_DIR)/%.html, $(DEST_DIR)/%.html, $(HTML_FILES))

.PHONY: all move-files open

all: docs/index.html $(HTML_DEST_FILES) move-files

docs/index.html: index.md header.html footer.html
	@echo "$< -> $@"
	@mkdir -p docs
	@pandoc -o tmp.html index.md
	@npx prettier tmp.html -w
	@cp header.html header-tmp.html
	@sed -i '' "s/::TITLE::/Blog/" header-tmp.html
	@cat header-tmp.html tmp.html footer-index.html > $@
	@rm tmp.html
	@rm header-tmp.html

docs/%.html: posts/%.html header.html footer.html
	@echo "$< -> $@"
	@mkdir -p docs
	@cp header.html header-tmp.html
	sed -i '' 's/::TITLE::/$(shell sed -nE "s|.*<h1>(.*)</h1>.*|\\1|p" $< | sed "s/<[^>]*>//g" | sed "s/\//\\\\\//g")/' header-tmp.html
	@cat header-tmp.html $< footer.html > $@
	@rm header-tmp.html


move-files:
	@echo "Moving files"
	@rm -rf docs/images
	@cp -r images docs/images
	@cp rss.xml docs/

open:
	open docs/index.html
