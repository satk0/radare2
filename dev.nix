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
