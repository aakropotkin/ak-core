{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.nixpkgs.follows = "nix/nixpkgs";

  outputs = { self, nix, nixpkgs, ... }: 
    let
      supportedSystems = ["x86_64-linux" "i686-linux" "aarch64-linux"];
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

            buildInputs = with pkgs; [autoconf automake libtool];
            depsTargetTarget = with pkgs; [gawk];

            prePatch = ''
              patchShebangs ./bootstrap.sh;
            '';

            preConfigure = ''
              ./bootstrap.sh;
            '';
          };
      };

      defaultPackage = forAllSystems ( sys:
        ( import nixpkgs {
            inherit sys;
            overlays = [self.overlay nix.overlay];
          }
        ).ak-core );
      packages = forAllSystems ( sys:
        { ak-core = self.defaultPackage.${sys}; } );

      nixosModule = { pkgs, ... }: {
        nixpkgs.overlays = [self.overlay];
      };
    
      nixosModules.ak-core = self.nixosModule;

    };
}
