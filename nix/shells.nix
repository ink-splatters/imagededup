{ pkgs, common, self, system, ... }:
with pkgs; {

  default = mkShell.override { inherit (llvmPackages_17) stdenv; } {

    inherit (common) CFLAGS CXXFLAGS LDFLAGS buildInputs nativeBuildInputs;

    name = "imagededup";

    shellHook = self.checks.${system}.pre-commit-check.shellHook + ''
      export PS1="\n\[\033[01;36m\]‹imagededup› \\$ \[\033[00m\]"
    '';
  };

  install-hooks = mkShell.override { stdenv = stdenvNoCC; } {
    inherit (self.checks.${system}.pre-commit-check) shellHook;
  };
}
