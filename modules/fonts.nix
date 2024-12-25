{ config, pkgs, ... }:

{
  # Fonts-Konfiguration
  fonts = {
    packages = [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.fira-code
    ];
  };
}

