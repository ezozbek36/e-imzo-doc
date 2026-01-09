# AGENTS.md

This file contains instructions for AI agents working in this repository.

## Project Overview

This is an Astro 5.6.1 documentation site using Starlight theme with the Diátxis framework approach.

- **Framework**: Astro with Starlight integration
- **Package Manager**: pnpm (NOT npm or yarn)
- **Content Type**: Documentation site with guides and reference sections
- **Module System**: ES modules (`"type": "module"`)

## Development Commands

### Primary Commands
```bash
pnpm dev          # Start development server (localhost:4321)
pnpm start        # Alias for dev
pnpm build        # Build for production
pnpm preview      # Preview production build
pnpm astro        # Direct Astro CLI access
```

### Code Quality Commands
```bash
pnpm biome check      # Check formatting and linting
pnpm biome format     # Format code
pnpm biome lint        # Run linter
pnpm biome check --apply  # Auto-fix issues
```

### Testing
⚠️ **No test framework is currently configured**. If tests are needed, set up a testing framework first.

## Code Style Guidelines

### Primary Tooling
- **Formatter/Linter**: Biome (NOT Prettier/ESLint)
- **TypeScript**: Strict Astro configuration
- **Editor**: VS Code with Biome extension recommended

### Formatting Rules
- **Line Width**: 140 characters
- **Quote Style**: Single quotes
- **Semicolons**: As needed
- **Indentation**: 
  - JS/TS files: Tabs (3 spaces width)
  - JSON files: Spaces (2 spaces)
- **End of Line**: LF
- **Final Newlines**: Required

### Import Organization
- Auto-organization enabled via Biome
- Use Biome's `organizeImports` action
- Imports should be grouped and sorted automatically

## File Structure & Conventions

### Content Organization (Diátxis Framework)
```
src/content/docs/
├── index.mdx          # Homepage with splash template
├── guides/            # Task-oriented, step-by-step guides
│   └── example.md
└── reference/         # Comprehensive, factual reference docs
    └── example.md
```

### File Naming Conventions
- **Content Files**: kebab-case (e.g., `getting-started.md`)
- **Directories**: lowercase with hyphens
- **Components**: PascalCase (if custom components are added)

### Frontmatter Pattern
```yaml
---
title: Page Title
description: Page description
template: splash  # Optional for homepage only
---
```

### Content Types
- **Guides**: Task-oriented, step-by-step instructions
- **Reference**: Comprehensive, factual documentation
- **Homepage**: Uses splash template with hero section and card grid

## TypeScript & Development

### Configuration
- **Base Config**: `astro/tsconfigs/strict`
- **Includes**: `.astro/types.d.ts` and all files
- **Excludes**: `dist/` directory

### Type Checking
Run TypeScript compiler directly:
```bash
npx tsc --noEmit
```

### Linting & Formatting
Always use Biome:
```bash
npx @biomejs/biome check
npx @biomejs/biome format --write
npx @biomejs/biome lint
```

## Import Patterns

### Starlight Imports
```typescript
import { Card, CardGrid } from '@astrojs/starlight/components';
import { defineCollection } from 'astro:content';
import { docsLoader } from '@astrojs/starlight/loaders';
import { docsSchema } from '@astrojs/starlight/schema';
```

### Content Collections
```typescript
// Use astro:content for collection definitions
import { defineCollection } from 'astro:content';

// Use Starlight loaders and schemas
import { docsLoader } from '@astrojs/starlight/loaders';
import { docsSchema } from '@astrojs/starlight/schema';
```

## AI Agent Guidelines

### DOs
- ✅ Always use `pnpm` (never npm or yarn)
- ✅ Follow Diátxis framework for content structure
- ✅ Use Biome for all formatting and linting
- ✅ Maintain existing Starlight configuration patterns
- ✅ Respect the 140-character line width limit
- ✅ Use single quotes for strings
- ✅ Organize imports automatically with Biome
- ✅ Follow kebab-case naming for content files

### DON'Ts
- ❌ Do not use npm or yarn commands
- ❌ Do not configure Prettier or ESLint (Biome handles everything)
- ❌ Do not exceed 140 characters per line
- ❌ Do not use double quotes for strings
- ❌ Do not manually organize imports (let Biome handle it)
- ❌ Do not create test files without setting up a test framework first

### Content Guidelines
- **Guides**: Focus on specific tasks and step-by-step instructions
- **Reference**: Provide comprehensive, factual information
- **Homepage**: Use splash template with hero section and card grid
- **Frontmatter**: Always include title and description

### Development Workflow
1. Make changes to content or configuration
2. Run `pnpm biome check --apply` to auto-fix formatting
3. Test with `pnpm dev` or `pnpm build`
4. Verify changes in browser

### Configuration Files
- **Biome**: `biome.json` - Primary linting/formatting configuration
- **EditorConfig**: `.editorconfig` - Editor-specific settings
- **TypeScript**: `tsconfig.json` - TypeScript strict configuration
- **Astro**: `astro.config.mjs` - Astro and Starlight configuration
- **Content**: `src/content.config.ts` - Content collection definitions

### Special Notes
- This is a **documentation site**, not a typical web application
- Content follows the **Diátxis framework** principles
- **Starlight** components and patterns should be used consistently
- No testing framework is currently configured
- All tooling is centralized through **Biome**

## Common Tasks

### Adding New Content
1. Create `.md` or `.mdx` file in appropriate directory (`guides/` or `reference/`)
2. Add proper frontmatter with title and description
3. Follow Diátxis framework guidelines for content type
4. Update sidebar configuration in `astro.config.mjs` if needed

### Updating Configuration
1. Edit `astro.config.mjs` for Starlight settings
2. Edit `src/content.config.ts` for content collections
3. Run Biome to format changes
4. Test with `pnpm dev`

### Code Quality
Always run Biome before committing:
```bash
pnpm biome check --apply
```
