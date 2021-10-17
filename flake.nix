{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.nixpkgs.follows = "nix/nixpkgs";

  outputs = { self, nix, nixpkgs, ... }: {

    overlays.ak-core = import ./overlay.nix;
    overlay = self.overlays.ak-core;

    packages.x86_64-linux.ak-core = ( import nixpkgs {
      sys = "x86_64-linux";
      overlays = [self.overlay nix.overlay];
    } ).ak-core;
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.ak-core;

    nixosModules.ak-core = { pkgs, ... }: {
      nixpkgs.overlays = [self.overlay];
    };
    nixosModule = self.nixosModules.ak-core;
  };
}
