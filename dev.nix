{ 
    pkgs,
    ...
}:
pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        makeWrapper
        bashInteractive
        #autoPatchelfHook
    ];

    NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.stdenv.cc.cc
    ];
    NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";

    buildInputs = with pkgs; [
      gnumake
      gcc
      ccls
      bear
      glibc
      jq
      patchelf
    ];

    sourceRoot = ".";

    shellHook = ''
      echo "Hello from shell!"
    '';
    #postShellHook = ''
    #  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)"  ./test/bins/elf/analysis/calls_x64
    #  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" ./test/bins/elf/analysis/x64-loop
    #  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" ./test/bins/elf/analysis/x86-helloworld-gcc
    #'';
}
