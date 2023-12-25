{ stdenv, lib, autoreconfHook, jq, gawk }:
stdenv.mkDerivation {
  pname = "ak-core";
  src = ./.;
  version = "0.3.1";
  nativeBuildInputs = [autoreconfHook];
  depsTargetTarget = [gawk];
  preInstall = ''
    mkdir -p $out/bin;
    mkdir -p $out/share/jq;
  '';
  meta.license = lib.licenses.gpl3;
}
