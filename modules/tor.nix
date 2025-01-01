{ config, lib, pkgs, ... }:

{
  # Tor-Dienst aktivieren
  services.tor = {
    enable = true;
    settings = {
      # Verzeichnis für Hidden Service-Daten
      HiddenServiceDir = "/var/lib/tor/hidden_service";

      # Port-Weiterleitung für den Hidden Service
      HiddenServicePort = [
        {
          port = 80; # Externer Port (Onion-Adresse)
          target = "127.0.0.1:18081"; # Ziel, auf das weitergeleitet wird
        }
      ];

      # Optional: Log-Level und Ausgabe
      Log = "notice stdout";
    };
  };

  # Verzeichnis für den Hidden Service erstellen
  systemd.tmpfiles.rules = [
    "d /var/lib/tor/hidden_service 0700 tor tor -"
  ];

  # Optional: Benutzer und Gruppe für Tor anlegen, falls sie fehlen
  users.users.tor = {
    isSystemUser = true;
    home = "/var/lib/tor";
  };
  users.groups.tor = {};
}

