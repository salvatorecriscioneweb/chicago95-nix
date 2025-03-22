{
  description = "Chicago 95 On Nix";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          chicago95-gtk-theme = pkgs.callPackage ./nix/package.nix {};
          default = chicago95-gtk-theme;
        };
      }
    );
}
