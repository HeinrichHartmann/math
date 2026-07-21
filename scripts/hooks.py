"""
MkDocs hooks: slug redirects from article frontmatter.
"""

import logging, os

log = logging.getLogger("mkdocs")


def _parse_frontmatter(content: str) -> dict:
    """Parse YAML frontmatter from markdown content (between --- markers)."""
    if not content.startswith('---'):
        return {}
    lines = content.split('\n', 1)[1].split('\n')
    meta = {}
    for line in lines:
        if line.strip() == '---':
            break
        if ':' in line:
            parts = line.split(':', 1)
            key = parts[0].strip()
            value = parts[1].strip().strip('"').strip("'")
            if value:
                meta[key] = value
    return meta


def on_config(config):
    """Register slug redirects with mkdocs-redirects."""
    redirects_plugin = config.get('plugins', {}).get('redirects')
    if redirects_plugin:
        docs_dir = config['docs_dir']
        for root, _dirs, files in os.walk(docs_dir):
            for filename in files:
                if not filename.endswith('.md'):
                    continue
                filepath = os.path.join(root, filename)
                with open(filepath, 'r', encoding='utf-8') as f:
                    meta = _parse_frontmatter(f.read())
                slug = meta.get('slug')
                if slug:
                    src_path = os.path.relpath(filepath, docs_dir)
                    redirects_plugin.config['redirect_maps'][f"{slug}.md"] = src_path
                    log.info(f"Slug redirect: {slug} -> {src_path}")
    return config
