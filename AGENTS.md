# Workflow

1. Edit the relevant Nix files (`flake.nix`, `nixos/configuration.nix`, `nixos/wsl.nix`, `nixos/configuration-default.nix`, `home-manager/home.nix`).
2. Build and apply (auto-detects WSL vs bare-metal):
   ```
   sudo nixos-rebuild switch --flake ~/dotfiles#
   ```
   Or specify explicitly:
   ```
   sudo nixos-rebuild switch --flake ~/dotfiles#nixos   # WSL
   sudo nixos-rebuild switch --flake ~/dotfiles#default  # bare-metal
   ```
3. If the build succeeds, stage and commit:
   ```
   git add -A
   git commit -m "<description>"
   ```

# Adding new tracked files

When adding a new file that should be tracked by git:
1. Add it to `.gitignore` using a `!` pattern (e.g. `!new-dir/` and `!new-dir/**`).
2. Stage and commit both `.gitignore` and the new file.
