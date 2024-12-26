{ config, pkgs, lib, ... }:

{
  # Zsh konfigurieren
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    # Benutzerdefinierte Konfiguration für die interaktive Shell
    interactiveShellInit = ''
      # Oh-My-Posh mit Zen-Theme initialisieren
      mkdir -p ~/.config/oh-my-posh
      if [ ! -f ~/.config/oh-my-posh/zen.toml ]; then
        curl -o ~/.config/oh-my-posh/zen.toml https://raw.githubusercontent.com/dreamsofautonomy/zen-omp/main/zen.toml
      fi
      eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zen.toml)"

      # Syntax-Korrektur aktivieren
      setopt CORRECT

      # History-Konfiguration
      HISTFILE=~/.zsh_history
      HISTSIZE=10000              # Anzahl der Befehle in der Sitzung
      SAVEHIST=10000              # Anzahl der gespeicherten Befehle
      setopt APPEND_HISTORY       # Historie anhängen, statt zu überschreiben
      setopt HIST_IGNORE_DUPS     # Keine Duplikate in der Historie speichern
      setopt HIST_IGNORE_ALL_DUPS # Alle früheren Duplikate aus der Historie entfernen
      setopt HIST_FIND_NO_DUPS    # Duplikate beim Durchsuchen der Historie ignorieren
      setopt SHARE_HISTORY        # Historie zwischen allen Shell-Sitzungen teilen
      setopt EXTENDED_HISTORY     # Zeitstempel für Befehle speichern
      setopt INC_APPEND_HISTORY   # Befehle sofort nach Ausführung speichern
      setopt HIST_REDUCE_BLANKS   # Überflüssige Leerzeichen aus Befehlen entfernen

      # Aliase definieren
      alias ll='ls -lah'
      alias ..='cd ..'
      alias ...='cd ../..'
      alias grep='grep --color=auto'
      
      alias update='nix flake update && darwin-rebuild switch'

      alias v='nvim'
      alias n='nano'
      alias e='emacs'

      alias cl='clear'

      alias g='git
      alias ga='git add'
      alias gaa='git add --all'
      alias gp='git push'
      alias gl='git pull'
      alias gcm='git commit -m'
    '';
  };

  # Zusätzliche Pakete
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];
}

