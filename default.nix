{ stdenv, lib, autoconf, automake, libtool, jq, gawk }:
stdenv.mkDerivation {
  name = "ak-core";
  src = ./.;
  version = "0.2.0";
  buildInputs = [autoconf automake libtool];
  depsTargetTarget = [gawk];
  installPhase = ''
    mkdir -p $out/bin;
    mkdir -p $out/share/jq;
    make install;
  '';
  meta.license = lib.licenses.gpl3;
}
