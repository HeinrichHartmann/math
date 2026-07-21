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
# Builds PDF, creates a GitHub release with the PDF attached.
# TAG defaults to the article stem; override with TAG=custom-tag
release-%: pdf-%
	$(eval STEM := $*)
	$(eval TAG ?= $(STEM))
	gh release create "$(TAG)" \
		"$(PDF_DIR)/$(STEM).pdf" \
		--title "$(STEM)" \
		--notes "PDF built from source at this tag. See [article on the web](https://heinrichhartmann.com/math/Publications/$(STEM)/)."

clean:
	rm -rf site/ build/ pdf/

.PHONY: install build serve pdfs clean
