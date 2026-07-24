# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

let
  code-wsl = pkgs.writeShellScriptBin "code" ''
    WIN_USER=$(/mnt/c/Windows/System32/cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r\n')
    CODE="/mnt/c/Users/$WIN_USER/AppData/Local/Programs/Microsoft VS Code/bin/code"
    if [ -x "$CODE" ]; then
      exec "$CODE" "$@"
    else
      echo "Error: VS Code not found on Windows." >&2
      echo "Install VS Code from https://code.visualstudio.com/" >&2
      exit 1
    fi
  '';
in

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    curl
    git
    zsh
    fastfetch
    home-manager
    opencode
    code-wsl
    wget
  ];

  programs.zsh.enable = true;
  users.users.nixos.shell = pkgs.zsh;

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
