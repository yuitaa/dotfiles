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

# Adding new tracked files

When adding a new file that should be tracked by git:
1. Add it to `.gitignore` using a `!` pattern (e.g. `!new-dir/` and `!new-dir/**`).
2. Stage and commit both `.gitignore` and the new file.
