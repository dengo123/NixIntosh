{ config, pkgs, ... }:

{
  # Fonts-Konfiguration
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.departure-mono
      nerd-fonts.symbols-only
    ];
  };
  # Ricing Pakete
  environment.systemPackages = with pkgs; [
    neofetch
  ];
}

