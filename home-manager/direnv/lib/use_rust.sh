use_rust() {
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/rust.nix" flake.nix
    log_status "Generated flake.nix for Rust project"
  fi
  use flake
}
