{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		nodejs
		cargo
		python3Packages.flake8   # Flake8 für Python
		nodePackages.jsonlint    # JSON-Linter
		taplo                   # TOML-Formatter
		nodePackages.eslint_d    # Eslint Daemon
		jq
	];
}
