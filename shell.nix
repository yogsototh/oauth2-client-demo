let 
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/50999ee5859bfe2a5f811eed11cd16df355b86a2.tar.gz";
  pkgs = import nixpkgs { config = {}; overlays = []; };
 #     nanomsg-py = .... build expression for this python library;
in pkgs.mkShell {
  buildInputs = [
    pkgs.cacert
    pkgs.python3Packages.pip
    pkgs.python3Packages.httpserver
    pkgs.python3Packages.pyopenssl
    pkgs.httpie
    pkgs.lighttpd
  ];
  shellHook = ''
            alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
            export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python2.7/site-packages:$PYTHONPATH"
            unset SOURCE_DATE_EPOCH
  '';
}
