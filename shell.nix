let pkgs = import <nixpkgs> {};
 #     nanomsg-py = .... build expression for this python library;
in pkgs.mkShell {
  buildInputs = [
    pkgs.cacert
    pkgs.python3Packages.pip
    pkgs.python3Packages.httpserver
    pkgs.python3Packages.pyopenssl
  ];
  shellHook = ''
            alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
            export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python2.7/site-packages:$PYTHONPATH"
            unset SOURCE_DATE_EPOCH
  '';
}
