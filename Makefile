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
	$(UV) run python -c "\
	import yaml; \
	content = open('$(ARTICLES_DIR)/$*.md').read(); \
	meta = yaml.safe_load(content[3:content.find(chr(10)+'---', 3)]); \
	title = meta.get('title', '$*'); \
	abstract = meta.get('abstract', '').strip(); \
	slug = meta.get('slug', '$*'); \
	notes = abstract + chr(10) + chr(10) + '[Read online](https://heinrichhartmann.com/math/' + slug + ')'; \
	open('/tmp/release-title.txt','w').write(title); \
	open('/tmp/release-notes.txt','w').write(notes)"
	gh release create "$*" \
		"$(PDF_DIR)/$*.pdf" \
		--title "$$(cat /tmp/release-title.txt)" \
		--notes "$$(cat /tmp/release-notes.txt)"

clean:
	rm -rf site/ build/

.PHONY: install build serve pdfs clean
