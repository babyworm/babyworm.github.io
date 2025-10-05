# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo-based personal blog (babyworm.github.io) using the Blowfish theme v2.90.0. The site is deployed to GitHub Pages via GitHub Actions and includes both Korean and English content. The blog focuses on technical topics related to semiconductor design, processors, and general technology.

## Key Commands

### Local Development
```bash
# Install dependencies (includes dart-sass-embedded via postinstall script)
npm ci

# Build the site locally (takes ~3-4 minutes for 1600+ pages)
npm run build
# or directly:
hugo --gc --minify

# Run development server with live reload
hugo server -D

# Run development server on all interfaces
hugo server -D --disableFastRender --bind 0.0.0.0 --baseURL http://localhost:1313
```

### Content Management
```bash
# Create a new post (uses archetype from archetypes/default.md)
hugo new content/post/blogs/my-new-post.md

# Create a new doc
hugo new content/post/docs/my-new-doc.md
```

### Testing Deployment Locally
```bash
# Build with production settings
HUGO_ENVIRONMENT=production hugo --gc --minify --baseURL "https://babyworm.github.io/"
```

## Architecture

### Hugo Configuration
- **Configuration**: Split across `config/_default/` directory (Blowfish recommended structure)
  - `config/_default/hugo.toml` - Main site configuration
  - `config/_default/params.toml` - Theme parameters
  - `config/_default/languages.ko.toml` - Korean language configuration
  - `config/_default/menus.ko.toml` - Menu structure
  - `config/_default/markup.toml` - Markdown rendering settings
- **Hugo Version**: 0.151.0 (Extended required for Sass processing)
- **Theme**: Blowfish v2.90.0 (installed in `themes/blowfish/`)
- **Default Language**: Korean (`ko`), with English support
- **Timezone**: Asia/Seoul

### Content Structure
```
content/
├── about.md              # About page
├── books.md              # Book list/reviews
└── post/
    ├── blogs/            # Main blog posts (100+ technical articles)
    ├── docs/             # Documentation posts
    ├── demo/             # Demo/example posts
    └── other/            # Miscellaneous content
```

### Layouts and Customization
Custom layouts are in `layouts/`:
- `layouts/partials/comments.html` - Disqus comments integration
- `layouts/shortcodes/` - Custom shortcodes (notice, blockquote, expand, youku, music)

The Blowfish theme provides most layouts via Hugo modules; only overrides and custom partials are stored locally.

### Asset Management
- **Images**: Store author images in `assets/images/` or `static/images/`
- **SCSS/CSS**: Theme handles styling; custom styles can be added to `assets/`
- **JavaScript**: Theme configuration in `assets/jsconfig.json`

### Deployment

**GitHub Actions** (`.github/workflows/hugo.yaml`):
- Triggers on push to `main` branch
- Installs Hugo Extended 0.151.0 and Dart Sass
- Runs `npm ci` to install dependencies (including dart-sass-embedded)
- Builds with `hugo --gc --minify`
- Deploys to GitHub Pages automatically

**Netlify** (`netlify.toml`):
- Alternative deployment platform (currently configured)
- Uses Hugo 0.151.0 Extended with Go 1.22.5
- Custom build command includes dart-sass-embedded setup
- Deploy previews available for branches

### Build Dependencies

**Dart Sass Embedded**:
- Required for Blowfish theme Sass compilation
- Installed via `scripts/install-dart-sass-embedded.sh` (runs during `npm install`)
- Version 1.62.1 (configurable via `SASS_EMBEDDED_VERSION`)
- Cross-platform script supports Linux, macOS, Windows (x64, arm64, arm, ia32)

**Theme Installation**:
- Theme is installed in `themes/blowfish/` directory (v2.90.0)
- No Hugo Modules or Go dependencies required
- Theme files are committed to the repository for easier version control

### Site Features
- **Comments**: Disqus integration (shortname: "babyworm-github-io")
- **Analytics**: Google Analytics (G-5K5SXHWR3B)
- **Search**: Enabled with JSON output format
- **RSS**: 20 items, available at `/index.xml`
- **Taxonomies**: categories, tags, series, authors
- **Code Highlighting**: Goldmark with line numbers, friendly theme
- **CJK Support**: Enabled for Korean text processing

### Front Matter Template
New posts should follow the archetype in `archetypes/default.md`:
```yaml
---
title: "Post Title"
description: ""
date: 2024-01-01
draft: true
tags: []
categories: []
showComments: true
---
```

## Development Notes

- **Never commit** to `public/` directory - it's generated and deployed automatically
- **Theme customization**: Override theme files by placing them in `layouts/` with the same path structure
- **Testing locally**: Always test with `hugo server -D` before pushing (build takes ~3-4 minutes)
- **Theme updates**: To update Blowfish theme:
  1. `cd themes && rm -rf blowfish`
  2. `git clone --depth 1 --branch vX.XX.X https://github.com/nunocoracao/blowfish.git`
  3. `rm -rf blowfish/.git`
  4. Commit the changes
- **Korean content**: Default language is Korean; use proper front matter for English posts if needed
- **Draft posts**: Set `draft: false` in front matter when ready to publish
- **Images**: Reference images with absolute paths from `static/` or use page bundles
- **Config structure**: All configuration is in `config/_default/` directory, not root `hugo.toml`

## Common Issues

- **Sass compilation errors**: Ensure dart-sass-embedded is installed via `npm ci`
- **Build timeout**: Normal - site has 1600+ pages and takes 3-4 minutes to build
- **Build failures**: Check Hugo version matches 0.151.0 Extended
- **Theme not loading**: Verify `themes/blowfish/` directory exists and is populated
- **Warning about module compatibility**: Can be ignored - theme works correctly with Hugo 0.151.0
