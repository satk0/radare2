{ 
    pkgs,
    ...
}:
pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        makeWrapper
        bashInteractive
    ];

    NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
      stdenv.cc.cc
      glibc
      libselinux
    ]);

    NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";

    buildInputs = with pkgs; [
      gnumake
      ccls
      bear
      jq
      nodejs_22
    ];

    sourceRoot = ".";

    # https://github.com/NixOS/nixpkgs/issues/18995
    hardeningDisable = [ "all" ];


    shellHook = ''
      export R2R_SKIP_ASM=1
      export R2R_SKIP_ARCHOS=1

      if test -f /etc/NIXOS && test ! -f /bin/ls; then
        sudo ln -s /run/current-system/sw/bin/ls /bin/ls
      fi

      echo "Hello from shell!"
    '';
}

