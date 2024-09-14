{
  description = "Radare2 devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
    let
      # Helper to provide system-specific attributes
      pkgs = import nixpkgs { inherit system; };
      #fhs = pkgs.callPackage ./shell.nix {inherit pkgs; };

    in {
        #devShells.default = fhs.env;
        # TODO: Make it use FHSEnv as a sudo wrapper as polkit or run0 instead of docker
        #devShells.default = pkgs.callPackage ./shell.nix {inherit pkgs; };
        devShells.default = pkgs.callPackage ./dev.nix {inherit pkgs; };
    }
  );
}

