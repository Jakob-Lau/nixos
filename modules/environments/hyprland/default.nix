{ config, lib, pkgs, ... }:
let
  cfg = config.my.profiles.hyprland;
 in {



  options.my.profiles.hyprland = with lib; {
    enable = mkEnableOption "hyprland env";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      xwayland.enable = true;
    };
    users.users.jakobl.packages = with pkgs; [
      wofi
      mako
      kitty
      hyprpaper
      waybar
      libsForQt5.dolphin
    ];
    hardware = {
      # Opengl
      opengl.enable = true;

      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
    };
  };


}
