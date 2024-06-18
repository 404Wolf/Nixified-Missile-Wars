{ pkgs }:
let
  buildMavenPackage = (pkgs.maven.override { inherit jdk; }).buildMavenPackage;
  jdk = pkgs.jdk17;
in
buildMavenPackage rec {
  pname = "missilewars";
  src = pkgs.fetchFromGitHub {
    owner = "RedstoneFuture";
    repo = "missilewars";
    rev = "85e8d4e17579a52dae55478c481d7eb0e8bef5ee";
    hash = "sha256-dvNcWVLnbkD2NPdpS0M68pqaRDXBo+qaj+5Wy8ICHI8=";
  };
  mvnHash = "sha256-Ihti60D5ag+D/yvmvp+CWkxHkSphfENiz28K01yWkPA=";
  version = "4.7.0";
  installPhase = ''
    mkdir -p $out/plugins
    cp missilewars-plugin/target/MissileWars-${version}.jar $out/plugins/${pname}-${version}.jar
  '';
  meta = with pkgs.lib; {
    description = "MissileWars is a famous, fun and fast minigame spigot-plugin for Minecraft";
    homepage = "https://github.com/RedstoneFuture/missilewars";
    license = licenses.gpl3;
  };
}
