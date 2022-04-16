{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    utils.url   = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, utils }:
    let
      eachDefaultSystemMap = utils.lib.eachSystemMap utils.lib.defaultSystems;
    in {
      packages = eachDefaultSystemMap ( system: rec {
        ak-core =
          ( import nixpkgs { inherit system;} ).callPackage ./default.nix {};
        default = ak-core;
      } );

      overlays.ak-core = final: prev: {
        inherit (self.packages.${final.system}) ak-core;
      };
      overlays.default = self.overlays.ak-core;

      nixosModules.ak-core = { ... }: {
        nixpkgs.overlays = builtins.attrValues self.overlays;
      };
      nixosModule = self.nixosModules.ak-core;
    };
}
