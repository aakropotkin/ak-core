{
  description = "A handful of useful core utilities and scripts for Linux";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.ak-core =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "ak-core";
        src  = self;
        installPhase = ''
          mkdir -p $out/bin;
          install -t $out/bin src/zsh-scripts/scomm;
        '';
      };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.ak-core;

  };
}
