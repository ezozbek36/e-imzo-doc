{
  pkgs ? import <nixpkgs> { },
}:

let
  nodejs = pkgs.nodejs_22;
  pnpm = pkgs.nodePackages.pnpm;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    pnpm
    # Native dependencies for Sharp image processing
    vips
    pkg-config
    # Additional build tools
    git
  ];

  shellHook = ''
    # Install dependencies if not already installed
    if [ ! -d "node_modules" ]; then
      echo "Installing dependencies with pnpm..."
      pnpm install
    fi

    # Set up environment variables for Sharp
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1

    echo "✨ Nix development environment ready!"
    echo "📦 Available commands:"
    echo "  pnpm dev      - Start development server"
    echo "  pnpm build    - Build for production"
    echo "  pnpm preview  - Preview production build"
    echo "  pnpm biome format --write && pnpm biome lint - Format and lint code"
  '';
}
