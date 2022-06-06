{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, utils }:
    let inherit (utils.lib) eachDefaultSystemMap;
    in {
      packages = eachDefaultSystemMap ( system: {
        ak-core = nixpkgs.legacyPackages.${system}.callPackage ./. {};
        default = self.packages.${system}.ak-core;
      } );

      overlays.ak-core = final: prev: {
        ak-core = nixpkgs.legacyPackages.${final.system}.callPackage ./. {};
      };
      overlays.default = self.overlays.ak-core;

      nixosModules.ak-core = { ... }: {
        nixpkgs.overlays = self.overlays.ak-core;
      };
      nixosModules.default = self.nixosModules.ak-core;
    };
}
