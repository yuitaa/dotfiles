use_python() {
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/python.nix" flake.nix
    log_status "Generated flake.nix for Python project"
  fi
  use flake
}
