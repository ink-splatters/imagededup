{ pkgs, pre-commit-hooks, system, ... }:

pre-commit-hooks.lib.${system}.run {
  src = ../.;
  hooks = {
    deadnix.enable = true;
    # markdownlint.enable = true;
    nil.enable = true;
    nixfmt.enable = true;
    statix.enable = true;
  };

  tools = pkgs;
}

