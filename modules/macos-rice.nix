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
    # Window Manager und Statusbar
    aerospace
    sketchybar

    #Fancies
    fastfetch
    pipes
    cava
    peaclock
    cbonsai
    asciiquarium-transparent
    ascii-rain
    nyancat
    cmatrix
    neo
    cowsay
    fortune
    sl
  ];
}

