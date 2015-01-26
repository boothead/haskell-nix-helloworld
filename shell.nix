let
  pkgs = import <nixpkgs> {};
  haskellPackages = pkgs.haskellPackages_ghc784.override {
    extension = self: super: {
      thispackage = self.callPackage ./. {};
    };
  };

in pkgs.myEnvFun {
     name = haskellPackages.thispackage.name;
     buildInputs = [
       (haskellPackages.ghcWithPackages (hs: ([
         hs.cabalInstall
         hs.text
       ] ++ hs.thispackage.buildInputs)))
     ];
   } 
