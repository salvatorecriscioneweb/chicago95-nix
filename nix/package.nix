{
  pkgs,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "chicago95-gtk-theme";
  version = "0-unstable-03-06-2025";

  src = fetchFromGitHub {
    owner = "grassmunk";
    repo = "Chicago95";
    rev = "3f81fedb7626e69cf6ba32e2e0e6a01c5929e9f9";
    hash = "sha256-hdx0wHD8ocbx82aBoPunHgsbt9fdWg+NEyNKj6ltj5A=";
  };

  propagatedUserEnvPkgs = with pkgs; [
    gdk-pixbuf # Recommended for GTK2 applications
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes

    cp -r $src/Theme/* $out/share/themes

    runHook postInstall
  '';
}
