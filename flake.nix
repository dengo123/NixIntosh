{
  description = "Nix with Apples flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, ...}: 
	let
    pkgs = import nixpkgs {system = "x86_64-darwin";};

    # Module manuell importieren
    extraModules = [
      ./modules/homebrew.nix
      ./modules/macos-settings.nix
      ./modules/fonts.nix
      ./modules/zsh.nix
      ./modules/cli-tools.nix
      ./modules/dev-tools.nix
      ./modules/tor.nix
    ];

    # Standardkonfiguration
    configuration = {
      config,
      pkgs,
      ...
    }: {
      networking = {
        computerName = "MacBook von Deniz";
        hostName = "NixIntosh";
      };

      # Systemweite Pakete
      environment.systemPackages = with pkgs; [
        mkalias
        fastfetch
      ];

      services.nix-daemon.enable = true;
      nix.settings.experimental-features = ["nix-command" "flakes"];
      nixpkgs.config.allowUnfree = true;

      # Versionsnummer und State Version
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
    };
  in {
    darwinConfigurations.NixIntosh = nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules =
        [
          configuration
        ]
        ++ extraModules;
    };
  };
}
