{
    pkgs,
    ...
}:
(pkgs.buildFHSEnv {
	name = "r2-FHSEnv";
    #nativeBuildInputs = with pkgs; [
    #  makeWrapper
    #  bashInteractive
    #];

    #buildInputs = with pkgs; [
    #  gnumake
    #  gcc
    #  ccls
    #  bear
    #];

    targetPkgs = pkgs: (with pkgs; [
      gnumake
      gcc
      ccls
      bear
    ]);

    runScript = "bash";

    #shellHook = ''
    #  echo "Hello from shell!"
    #'';
}).env
