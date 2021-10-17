{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, ... }: {
    overlays.ak-core = import ./overlay.nix;
    overlay = self.overlays.ak-core;

    packages.x86_64-linux.ak-core = ( import nixpkgs {
      sys = "x86_64-linux";
      overlays = [self.overlay];
    } ).ak-core;
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.ak-core;

    nixosModules.ak-core = { pkgs, ... }: {
      nixpkgs.overlays = [self.overlay];
    };
    nixosModule = self.nixosModules.ak-core;
  };
}
