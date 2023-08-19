
{ config, lib, pkgs, ... }:
let
  cfg = config.my.profiles.apps;
 in {



  options.my.profiles.apps = with lib; {
    desktop_apps = mkEnableOption "Basic Apps";
    dev_apps = mkEnableOption "Development Apps";
    gnome_apps = mkEnableOption "Gnome Extentions and Configuration";
  };

  config = lib.mkIf cfg.desktop_apps {
    users.users.jakobl.packages = with pkgs; [
      firefox
      discord
      spotify
      keepassxc
      nextcloud-client
    ] ++ lib.optionals cfg.dev_apps [
        vscode
        jetbrains.idea-ultimate
      ] ++ lib.optionals cfg.gnome_apps [
          gnomeExtensions.tweaks-in-system-menu
          gnomeExtensions.wireless-hid
          gnome.gnome-tweaks
      ];
    };    
  }
