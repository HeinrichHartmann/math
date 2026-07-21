UV ?= uv
ARTICLES_DIR = docs/Publications
PDF_DIR = build/pdf

install:
	$(UV) sync

build: install
	$(UV) run mkdocs build

serve:
	$(UV) run mkdocs serve

# Build single PDF: make pdf-2025-07-26-Fundamental-Theorem-of-Algebra
pdf-%:
	@mkdir -p $(PDF_DIR)
	$(UV) run python -m mkdocs_math.export export-pdf "$(ARTICLES_DIR)/$*.md" -o "$(PDF_DIR)"

# Build all PDFs
ARTICLES := $(shell find "$(ARTICLES_DIR)" -maxdepth 1 -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*.md" \
	| sed 's|.*/||; s|\.md$$||' | sort)
pdfs: $(addprefix pdf-,$(ARTICLES))

# Release single article: make release-2025-07-26-Fundamental-Theorem-of-Algebra
# Builds PDF, creates a GitHub release with title, abstract, and online link.
release-%: pdf-%
	$(eval STEM := $*)
	$(UV) run python -c "\
	import yaml, sys; \
	content = open('$(ARTICLES_DIR)/$(STEM).md').read(); \
	meta = yaml.safe_load(content[3:content.find(chr(10)+'---', 3)]); \
	title = meta.get('title', '$(STEM)'); \
	abstract = meta.get('abstract', '').strip(); \
	slug = meta.get('slug', '$(STEM)'); \
	notes = abstract + chr(10) + chr(10) + '[Read online](https://heinrichhartmann.com/math/' + slug + ')'; \
	print(title + chr(10) + notes)" > /tmp/release-meta.txt
	$(eval TITLE := $(shell head -1 /tmp/release-meta.txt))
	gh release create "$(STEM)" \
		"$(PDF_DIR)/$(STEM).pdf" \
		--title "$(TITLE)" \
		--notes "$$(tail -n +2 /tmp/release-meta.txt)"

clean:
	rm -rf site/ build/

.PHONY: install build serve pdfs clean
