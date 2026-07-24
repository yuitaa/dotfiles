_use_template() {
  local lang="$1"
  if [ ! -f flake.nix ]; then
    cp "${HOME}/dotfiles/home-manager/direnv/templates/${lang}.nix" flake.nix
    log_status "Generated flake.nix for ${lang} project"
  fi
  use flake
}
