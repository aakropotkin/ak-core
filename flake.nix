{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name    = "ak-core";
      overlay = ./overlay.nix;
    };
}
