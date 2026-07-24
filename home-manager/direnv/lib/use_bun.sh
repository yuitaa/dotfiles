use_bun() {
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/bun.nix" flake.nix
    log_status "Generated flake.nix for Bun project"
  fi
  use flake
}
