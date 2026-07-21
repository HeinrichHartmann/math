---
description: "Release an article: build PDF, create GitHub release, update frontmatter"
allowed-tools: ["Read", "Write", "Edit", "Bash", "Grep", "Glob"]
---

# Release an article

Release a single article given as `$ARGUMENTS` (the article stem,
e.g. `2025-07-26-Fundamental-Theorem-of-Algebra`).

## What this does

1. Builds the PDF from the markdown source
2. Creates a GitHub release with the PDF and `.md` attached
3. Updates the article's frontmatter with the GitHub release link
4. Commits and pushes the update

## Procedure

### 1. Validate

Check the article exists at `docs/Publications/<stem>.md`. Read its
frontmatter and confirm it has: `type: math-article`, `title`,
`abstract`, `slug`, `status: "900 Published"`.

If the article has `draft: true` or is missing required fields,
**stop and report**.

### 2. Check for existing release

```bash
gh release view <stem> 2>/dev/null
```

If a release already exists, **stop and ask** — re-releasing
requires deleting the old release first (`gh release delete <stem>
--yes && git push origin :refs/tags/<stem>`).

### 3. Build and release

```bash
make clean
make release-<stem>
```

This builds the PDF into `build/pdf/`, extracts title + abstract +
slug from frontmatter, and creates a GitHub release with:
- **Tag**: the article stem
- **Title**: from frontmatter `title:`
- **Notes**: frontmatter `abstract:` + a "Read online" link using
  the `slug:`
- **Attachments**: the PDF + the `.md` source

### 4. Update frontmatter

Add the GitHub release URL to the article's `publications:` block
if not already present:

```yaml
publications:
  GitHub: "https://github.com/HeinrichHartmann/math/releases/tag/<stem>"
  # ... existing entries (Zenodo, arXiv, etc.)
```

The GitHub entry should come first in the publications list — it is
the canonical source for PDFs.

### 5. Commit and push

```bash
git add docs/Publications/<stem>.md
git commit -m "Add GitHub release link to <title>"
git push origin main
```

### 6. Report

Print:
- The release URL
- The online article URL (from slug)
- The PDF download URL

## Notes

- PDFs are release artifacts, not checked into git.
- `build/` is gitignored — `make clean` removes it.
- The release tag pins the exact source commit that produced the PDF.
- Each article is released independently (one release per article,
  not a batch).
- To update: delete the old release, fix the source, re-run this
  skill.
