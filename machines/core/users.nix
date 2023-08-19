{ config, pkgs, lib, ... }:
{

  users.users.jakobl = {
    isNormalUser = true;
    home = "/home/jakobl";
    group = "jakobl";
    extraGroups = [
      "adbusers" # adb control
      "audio" # sound control
      "dialout" # serial-console
      "docker" # usage of `docker` socket
      "input" # mouse control
      "libvirtd" # kvm control
      "networkmanager" # wireless configuration
      "podman" # usage of `podman` socket
      "video" # screen control
      "wheel" # `sudo` for the user.
    ];
  };

  users.groups.jakobl = {
    gid = 1000;
  };
}
