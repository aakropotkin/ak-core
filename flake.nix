{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;

  outputs = { self, nix, nixpkgs, ... }: 
    let
      supportedSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems ( sys: f sys );
      version = "0.1.${nixpkgs.lib.substring 0 8 " +
                "self.lastModifiedDate}.${self.shortRev or "dirty"}";
    in {

      overlay = final: prev: {
        ak-core = with final;
          let
            nix = final.nix;
          in stdenv.mkDerivation {
            name = "ak-core";
            src  = self;

            depsTargetTarget = with pkgs; [ gawk ];

            installPhase = ''
              mkdir -p $out/bin;

              install -t $out/bin src/sh-scripts/cuts;
              install -t $out/bin src/zsh-scripts/scomm;
              install -t $out/bin src/awk-scripts/dedup;
            '';
          };
      };

      defaultPackage = forAllSystems ( sys: ( import nixpkgs {
        inherit sys;
        overlays = [ self.overlay ];
      } ).ak-core );

      nixosModules.ak-core = { pkgs, ... }: {
        nixpkgs.overlays = [ self.overlay ];
      };

    };
}
