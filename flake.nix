# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{

# ---------------------------------------------------------------------------- #

  description = "A handful of useful core utilities and scripts for Linux";


# ---------------------------------------------------------------------------- #

  outputs = { nixpkgs, ... }: let

# ---------------------------------------------------------------------------- #

    eachSupportedSystemMap = let
      supportedSystems = [
        "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"
      ];
    in fn: let
      proc = system: { name = system; value = fn system; };
    in builtins.listToAttrs ( map proc supportedSystems );

# ---------------------------------------------------------------------------- #

    overlays.deps    = final: prev: {};
    overlays.ak-core = final: prev: { ak-core = final.callPackage ./. {}; };
    overlays.default = nixpkgs.lib.composeExtensions overlays.deps
                                                     overlays.ak-core;


# ---------------------------------------------------------------------------- #

    nixosModules.ak-core = { nixpkgs.overlays = overlays.default; };
    nixosModules.default = nixosModules.ak-core;


# ---------------------------------------------------------------------------- #

  in {

    inherit overlays nixosModules;

    packages = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.${system}.extend overlays.default;
    in {
      inherit (pkgsFor) ak-core;
      default = pkgsFor.ak-core;
    } );

  };  # End `outputs'


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
