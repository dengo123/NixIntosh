{ config, pkgs, lib, ... }:

{
  # Aktiviert Homebrew
  homebrew = {
    enable = true;

    # Standard Brew-Formeln und Casks
    brews = [ "mas" ];
    casks = [ 
      "wezterm" 
      "zen-browser" 
      "wine-stable" 
      "zoom" 
      "tor-browser"
    ];

    # Mac App Store Apps
    masApps = {
      "Pages" = 409201541;
      "Numbers" = 409203825;
      "Keynote" = 409183694;
      "GarageBand" = 682658836;
    };

    # Aktivierungseinstellungen
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  # Optional: Rosetta automatisch aktivieren, wenn auf ARM
  #homebrew.enableRosetta = pkgs.stdenv.isAarch64;
}

