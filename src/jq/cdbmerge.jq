# -*- mode: jq; -*-
# ============================================================================ #
#
#
# ---------------------------------------------------------------------------- #

module {
  name: "cdbmerge",
  version: "0.0.0"
};


# ---------------------------------------------------------------------------- #

def merge_source_group:
  {
    file:      .[0].file,
    directory: .[0].directory,
    arguments: ( max_by( .arguments|length )|.arguments )
  };


def merge_sources:
    group_by(.file)|map( merge_source_group );


def delete_nix_wrapper:
  [.[]|select( .arguments[0]|contains( ".nix-profile/bin/" )|not )];


def nix_fix_ccj:
  delete_nix_wrapper|merge_sources;


# ---------------------------------------------------------------------------- #



# ============================================================================ #
# vim: set filetype=jq :
