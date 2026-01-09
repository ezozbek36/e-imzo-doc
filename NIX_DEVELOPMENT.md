# Nix Development Environment

This project includes a Nix development environment for reproducible development.

## Quick Start

### Using Nix Shell
```bash
nix-shell
```

### Using direnv (recommended)
1. Install direnv
2. Add `use nix` to `.envrc` (create if needed)
3. Run `direnv allow`

## What's Included

- **Node.js 22 LTS** - Latest stable Node.js version
- **pnpm** - Package manager (as required by project)
- **Sharp native dependencies** - For image processing
- **Git** - Version control
- **Auto-installation** - Dependencies install automatically on shell entry

## Available Commands

Once in the Nix shell:
```bash
pnpm dev      # Start development server (localhost:4321)
pnpm build    # Build for production
pnpm preview  # Preview production build
pnpm biome format --write && pnpm biome lint  # Format and lint code
```

## Environment Variables

- `SHARP_IGNORE_GLOBAL_LIBVIPS=1` - Ensures Sharp uses bundled libvips

## Building with Nix

To build the project using Nix:
```bash
nix-build
```

The built site will be available in the `result` directory.
