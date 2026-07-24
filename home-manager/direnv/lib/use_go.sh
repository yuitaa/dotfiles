use_go() {
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/go.nix" flake.nix
    log_status "Generated flake.nix for Go project"
  fi
  use flake
}
