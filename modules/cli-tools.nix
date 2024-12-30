{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep         # Schnelle Textsuche
    fd              # Einfacher, schneller Ersatz für 'find'
    fzf             # Fuzzy Finder für interaktive Suchen
    bat             # Verbesserte 'cat'-Version mit Syntax-Highlighting
    exa             # Moderne Alternative zu 'ls'
    git             # Versionskontrollsystem
    neovim          # Texteditor
    tmux            # Terminal-Multiplexer
    htop            # Interaktiver Prozess-Manager
    tree            # Verzeichnisstruktur anzeigen
    wget            # Herunterladen von Dateien
    curl            # Datenübertragung
    jq              # JSON-Parser
  ];
}

