{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.settings.auto-optimise-store = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    zsh
  ];

  programs.nix-ld.enable = true;
  programs.zsh.enable = true;

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  i18n.defaultLocale = "ja_JP.UTF-8";
  i18n.supportedLocales = [ "ja_JP.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];

  time.timeZone = "Asia/Tokyo";

  system.stateVersion = "26.05";
}
