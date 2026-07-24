# Workflow

1. Edit the relevant Nix files (`flake.nix`, `nixos/configuration.nix`, `home-manager/home.nix`).
2. Build and apply:
   ```
   sudo nixos-rebuild switch --flake ~/dotfiles#
   ```
3. If the build succeeds, stage and commit:
   ```
   git add -A
   git commit -m "<description>"
   ```
