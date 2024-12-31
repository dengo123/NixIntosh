{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ranger
    ripgrep         # Schnelle Textsuche
    fd              # Einfacher, schneller Ersatz für 'find'
    fzf             # Fuzzy Finder für interaktive Suchen
    bat             # Verbesserte 'cat'-Version mit Syntax-Highlighting
    git             # Versionskontrollsystem
    neovim          # Texteditor
    tmux            # Terminal-Multiplexer
    htop            # Interaktiver Prozess-Manager
    tree            # Verzeichnisstruktur anzeigen
    wget            # Herunterladen von Dateien
    curl            # Datenübertragung
  ];
}

