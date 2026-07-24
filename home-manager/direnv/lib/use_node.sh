use_node() {
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/node.nix" flake.nix
    log_status "Generated flake.nix for Node.js project"
  fi
  use flake
}
