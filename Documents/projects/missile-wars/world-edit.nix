{ pkgs }:
# https://github.com/IntellectualSites/FastAsyncWorldEdit
pkgs.stdenv.mkDerivation {
  name = "world-edit";
  src = builtins.fetchurl {
    url = "https://ci.athion.net/job/FastAsyncWorldEdit/lastSuccessfulBuild/artifact/artifacts/FastAsyncWorldEdit-Bukkit-2.10.1-SNAPSHOT-810.jar";
    sha256 = "1jc093v5byj5kymx64101y35zf7jh6ggm1wiym979czm2dj1xadi";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/plugins
    cp $src $out/plugins
  '';
}
