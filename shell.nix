{ 
    pkgs,
    ...
}:
pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        makeWrapper
        bashInteractive
    ];
    
    buildInputs = with pkgs; [
      gnumake
      gcc
      ccls
    ];

    shellHook = ''
      echo "Hello from shell!"
    '';
}

