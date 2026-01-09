{
  pkgs ? import <nixpkgs> { },
}:

let
  nodejs = pkgs.nodejs_22;
  pnpm = pkgs.nodePackages.pnpm;

  # Build the project using pnpm
  buildProject = pkgs.stdenv.mkDerivation {
    name = "e-imzo-doc";
    version = "0.0.1";

    src = ./.;

    nativeBuildInputs = with pkgs; [
      nodejs
      pnpm
      vips
      pkg-config
    ];

    buildPhase = ''
      export HOME=$TMPDIR
      export SHARP_IGNORE_GLOBAL_LIBVIPS=1

      # Install dependencies
      pnpm install --frozen-lockfile

      # Build the project
      pnpm build
    '';

    installPhase = ''
      mkdir -p $out
      cp -r dist/* $out/
    '';
  };

in
{
  inherit buildProject;

  # Development shell
  shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
      pnpm
      vips
      pkg-config
      git
    ];

    shellHook = ''
      export SHARP_IGNORE_GLOBAL_LIBVIPS=1

      if [ ! -d "node_modules" ]; then
        echo "Installing dependencies with pnpm..."
        pnpm install
      fi

      echo "✨ Nix development environment ready!"
      echo "📦 Available commands:"
      echo "  pnpm dev      - Start development server"
      echo "  pnpm build    - Build for production"
      echo "  pnpm preview  - Preview production build"
      echo "  pnpm biome format --write && pnpm biome lint - Format and lint code"
    '';
  };
}
