{ config, pkgs, lib, ... }:

{
  # Zsh konfigurieren
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    initExtra = ''
      # Oh-My-Posh initialisieren
      mkdir -p ~/.config/oh-my-posh
      if [ ! -f ~/.config/oh-my-posh/paradox.omp.toml ]; then
        curl -o ~/.config/oh-my-posh/paradox.omp.toml https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes/paradox.omp.toml
      fi
      eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/paradox.omp.toml)"

      # Syntax-Korrektur aktivieren
      setopt CORRECT

      # Aliase definieren
      alias ll='ls -lah'
      alias ..='cd ..'
      alias ...='cd ../..'
      alias grep='grep --color=auto'
      alias update='nix flake update && darwin-rebuild switch --flake ~/nix#NixIntosh'
    '';
  };

  # Zusätzliche Pakete, wenn nötig
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];
}

