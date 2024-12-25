{ config, pkgs, lib, ... }:

{
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
}

