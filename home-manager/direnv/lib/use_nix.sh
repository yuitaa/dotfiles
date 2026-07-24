use_nix() {
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/nix.nix" flake.nix
    log_status "Generated flake.nix for Nix project"
  fi
  use flake
}
