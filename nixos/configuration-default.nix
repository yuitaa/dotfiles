{ config, lib, pkgs, ... }:

{
  imports = [ ./configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "yuita";
  networking.networkmanager.enable = true;
}
