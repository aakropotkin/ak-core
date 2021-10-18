#!/usr/bin/env sh
set -e;
rabin2 -Ij ${1}|jq '
 .info|.size       = .binsz
      |.btype      = .bintype
      |.big_endian = ( if .endian == "little" then false else true end )
      |.debugfile  = .dbg_file
';
