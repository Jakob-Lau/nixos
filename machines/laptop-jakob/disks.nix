{ config, lib, pkgs, ... }:

#TODO: CHECK THIS OUT: https://github.com/nix-community/disko its kinda better but felix does not support it 

{
   fileSystems."/" =
    { device = "/dev/disk/by-uuid/4db3c057-b778-4b74-b9e3-4edd76f8db81";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A10E-1AE1";
      fsType = "vfat";
    };
}
