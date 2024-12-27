{ config, pkgs, ... }:

{
  # Zsh konfigurieren
  programs.zsh = {
    enable = true; # Zsh aktivieren
    enableCompletion = false; # Completion wird in der .zshrc verwaltet
    enableSyntaxHighlighting = false; # Syntax Highlighting wird in der .zshrc verwaltet
  };

  # Optional: Benötigte Pakete
  environment.systemPackages = with pkgs; [
    oh-my-posh
    zsh-autosuggestions # Für .zshrc verfügbar
    zsh-syntax-highlighting # Für .zshrc verfügbar
	];
}

