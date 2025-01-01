{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		deadnix
		alejandra
		statix
		nodejs
		cargo
    pipx
		jq
	];
}
