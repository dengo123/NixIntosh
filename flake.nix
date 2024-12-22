{
  description = "Nix with Apple flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { self, nixpkgs, nix-darwin, nix-homebrew, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-darwin"; };
      lib = nixpkgs.lib;
      configuration = { config, pkgs, ... }: {
        networking.computerName = "MacBook von Deniz";
        networking.hostName = "NixIntosh";

        # Systemweite Pakete
        environment.systemPackages = with pkgs; [
          neovim
          mkalias
	  fastfetch
        ];

        # Homebrew deklarative Verwaltung
        homebrew = {
          enable = true;
          brews = [ "mas" ];
          casks = [ "wezterm" "zen-browser" "wine-stable" "zoom" "tor-browser" ];
          masApps = {
            "Pages" = 409201541;
            "Numbers" = 409203825;
            "Keynote" = 409183694;
            "GarageBand" = 682658836;
          };
          onActivation = {
            cleanup = "zap";
            autoUpdate = true;
            upgrade = true;
          };
        };

        # Fonts
        fonts.packages = [
          (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        ];

        # Nix-Daemon Service und Nix Einstellungen
        services.nix-daemon.enable = true;
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
        nixpkgs.config.allowUnfree = true;

        # Spotlight für Nix-Apps
        system.activationScripts.applications.text = let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
          };
        in
        pkgs.lib.mkForce ''
          echo "Setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read src; do
            app_name=$(basename "$src")
            echo "Copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

        # Aktivierungsskript für Berechtigungen hinzu
        system.activationScripts.fixPermissions.text = ''
          echo "Fixing /nix permissions..."
          sudo chown -R root:wheel /nix
        '';

        # macOS Systemeinstellungen
        system.defaults = {
          dock = { 
            autohide = true;
            persistent-apps = [
              "/System/Applications/Mail.app"
              "/System/Applications/Calendar.app"
              "/System/Applications/Notes.app"
              "/Applications/Zen Browser.app"
              "/Applications/WezTerm.app"
	      "/System/Applications/System Settings.app"
            ];
            show-recents = false;
          };
          finder = {
            FXPreferredViewStyle = "clmv";
            _FXShowPosixPathInTitle = true;
            AppleShowAllFiles = true;
          };
          loginwindow.GuestEnabled = false;
          NSGlobalDomain = {
            AppleInterfaceStyle = "Dark";
            AppleShowAllFiles = true;
            NSWindowShouldDragOnGesture = true;
          };
          SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;  
        };

        # Versionsnummer und State Version
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 5;
      };
    in {
      darwinConfigurations.NixIntosh = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          configuration
          (nix-homebrew.darwinModules.nix-homebrew {
            lib = lib;
            nix-homebrew = {
              enable = true;
              enableRosetta = false;
              user = "dengo123";
              autoMigrate = false;
            };
          })
        ];
      };

      darwinPackages = self.darwinConfigurations.NixIntosh.pkgs;
    };
}


