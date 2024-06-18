{
  description = "The famous missile wars Minecraft mini game packaged for papermc with Nix.";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = rec {
          default = pkgs.stdenv.mkDerivation {
            name = "missile-wars";
            unpackPhase = ''
              mkdir -p $out/paper;
              mkdir -p $out/plugins;
              cp -r ${pkgs.papermc} $out/paper;
              cp -r ${missile-wars} $out/plugins;
              cp -r ${world-edit} $out/plugins;
              cp ${run-script}/bin/start $out;
            '';
          };
          missile-wars = import ./missile-wars.nix { inherit pkgs; };
          world-edit = import ./world-edit.nix { inherit pkgs; };
          run-script = pkgs.writeShellScriptBin "start" ''
            java=${pkgs.jdk21}/bin/java
            missile_wars=${missile-wars}
            world_edit=${world-edit}
            papermc=$(find ${pkgs.papermc} -name '*.jar')
            ${builtins.readFile ./start.sh}
          '';
        };
      }
    );

}
