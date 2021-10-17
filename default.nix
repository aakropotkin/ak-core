{ stdenv, lib, autoreconf, automake, libtool, jq }:
stdenv.mkDerivation {
  name = "ak-core";
  src = ./.;
  version = "0.1.0";
  buildInputs = [autoreconf automake libtool];
  depsTargetTarget = [gawk];
  prePatch = ''
    patchShebangs ./bootstrap.sh;
  '';

  preConfigure = ''
    ./bootstrap.sh;
  '';

  installPhase = ''
    mkdir -p $out/bin;
    mkdir -p $out/share/jq;
    make install;
  '';
  meta.license = lib.licenses.gpl3;
}
