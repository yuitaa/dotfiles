{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.interop.register = true;

  services.vscode-server.enable = true;
}
