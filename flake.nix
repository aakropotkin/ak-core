{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, ... }: {
    overlays.ak-core = import ./overlay.nix;

    packages.x86_64-linux.ak-core = ( import nixpkgs {
      sys = "x86_64-linux";
      overlays = [self.overlays.ak-core];
    } ).ak-core;
    packages.x86_64-linux.default = self.packages.x86_64-linux.ak-core;

    packages.aarch64-linux.ak-core = ( import nixpkgs {
      sys = "aarch64-linux";
      overlays = [self.overlays.ak-core];
    } ).ak-core;
    packages.aarch64-linux.default = self.packages.aarch64-linux.ak-core;

    packages.x86_64-darwin.ak-core = ( import nixpkgs {
      sys = "x86_64-darwin";
      overlays = [self.overlays.ak-core];
    } ).ak-core;
    packages.x86_64-darwin.default = self.packages.x86_64-darwin.ak-core;

    packages.aarch64-darwin.ak-core = ( import nixpkgs {
      sys = "aarch64-darwin";
      overlays = [self.overlays.ak-core];
    } ).ak-core;
    packages.aarch64-darwin.default = self.packages.aarch64-darwin.ak-core;

    nixosModules.ak-core = { pkgs, ... }: {
      nixpkgs.overlays = [self.overlays.ak-core];
    };
    nixosModule = self.nixosModules.ak-core;
  };
}
