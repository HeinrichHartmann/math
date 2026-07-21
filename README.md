# Mathematics — Heinrich Hartmann

Source repository for [heinrichhartmann.com/math](https://heinrichhartmann.com/math/).
See [docs/Publications](docs/Publications/) for the list of articles.

Mathematical articles written in Markdown with LaTeX math, 
rendered as a static site via [MkDocs](https://www.mkdocs.org/) and [mkdocs-math](https://github.com/HeinrichHartmann/mkdocs-math). 
PDFs are generated from the same sources using Pandoc and pdfLaTeX.

## Setup

The project uses [uv](https://docs.astral.sh/uv/) for Python
dependency management and a [Nix flake](flake.nix) for system
dependencies (Pandoc, TeX Live, etc.).

With Nix + direnv installed, entering the directory activates the
dev shell automatically. Without Nix, ensure `pandoc` and a full
TeX Live distribution are on your PATH.

```bash
# Install Python dependencies
make install

# Build the site
make build

# Live preview
make serve
```

## Building PDFs

Single article:

```bash
make pdf-2025-07-26-Fundamental-Theorem-of-Algebra
```

All articles:

```bash
make pdfs
```

PDFs are written to `build/pdf/`. The PDF pipeline uses
`mkdocs-math`'s export module (`python -m mkdocs_math.export
export-pdf`), which runs Pandoc with a Lua filter for math
environments, then compiles via pdfLaTeX with BibTeX.

## Releasing

```bash
make release-2025-07-26-Fundamental-Theorem-of-Algebra
```

This builds the PDF, creates a GitHub release tagged with the
article stem, and attaches the PDF. GitHub automatically includes a
source archive.

## Structure

```
docs/
  Publications/     Article sources (Markdown + LaTeX math)
  Profile/          Author profile page
  preamble.tex      LaTeX macros (MathJax rendering)
  preamble-pdf.tex  LaTeX macros (PDF builds)
meta/
  refs.bib          Shared bibliography
mkdocs.yml          Site configuration
```

## License

Articles are published under
[CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) unless
otherwise noted in the article frontmatter.
