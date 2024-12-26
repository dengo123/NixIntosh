{ config, pkgs, lib, ... }:

{
  # macOS Systemeinstellungen
  system.defaults = {
    dock = { 
      autohide = true;
      persistent-apps = [
	"/Applications/WezTerm.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Calendar.app"
        "/System/Applications/Notes.app"
        "/Applications/Zen Browser.app"
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

