{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep         # Schnelle Textsuche
    fd              # Einfacher, schneller Ersatz für 'find'
    fzf             # Fuzzy Finder für interaktive Suchen
    bat             # Verbesserte 'cat'-Version mit Syntax-Highlighting
    git             # Versionskontrollsystem
    neovim          # Texteditor
    yazi            # CLI-Filemanager
    tmux            # Terminal-Multiplexer
    htop            # Interaktiver Prozess-Manager
    tree            # Verzeichnisstruktur anzeigen
    wget            # Herunterladen von Dateien
    curl            # Datenübertragung
    jq              # JSON Preview
    ffmpeg          # Video Thumbnails für yazi
    zoxide          # Vergangene Pfad Navigierung
    xclip           # system clipboard support
    stow
  ];
}

