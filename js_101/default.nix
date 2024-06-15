{ pkgs ? import <nixpkgs> {} }:
  
with pkgs;

let
  inherit (lib) optional optionals;
  nodejs = nodejs_20;
in

mkShell {
  buildInputs = [git nodejs nodePackages_latest.eslint]
    ++ optional stdenv.isLinux inotify-tools;

}
