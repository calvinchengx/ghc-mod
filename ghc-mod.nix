{ mkDerivation, async, base, bytestring, cabal-helper, cereal
, containers, deepseq, directory, djinn-ghc, doctest, emacs
, filepath, ghc, ghc-paths, ghc-syb-utils, haskell-src-exts, hlint
, hspec, monad-control, monad-journal, mtl, old-time, pretty
, process, split, stdenv, syb, temporary, text, time, transformers
, transformers-base
}:
mkDerivation {
  pname = "ghc-mod";
  version = "5.2.1.2";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    async base bytestring cabal-helper cereal containers deepseq
    directory djinn-ghc filepath ghc ghc-paths ghc-syb-utils
    haskell-src-exts hlint monad-control monad-journal mtl old-time
    pretty process split syb temporary text time transformers
    transformers-base
  ];
  testDepends = [ base doctest hspec ];
  buildTools = [ emacs ];
  configureFlags = "--datasubdir=ghc-mod-5.2.1.2";
  postInstall = ''
    cd $out/share/ghc-mod-5.2.1.2
    make
    rm Makefile
    cd ..
    ensureDir "$out/share/emacs"
    mv ghc-mod-5.2.1.2 emacs/site-lisp
  '';
  doCheck = false;
  homepage = "http://www.mew.org/~kazu/proj/ghc-mod/";
  description = "Happy Haskell Programming";
  license = stdenv.lib.licenses.agpl3;
}
