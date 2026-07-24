{ config, pkgs, lib, ... }:

let
  opencode-wakatime-plugin = pkgs.runCommand "opencode-wakatime-plugin" {
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/opencode-wakatime/-/opencode-wakatime-1.3.9.tgz";
      sha256 = "0hylc8vvwsxb66pl95f03i61id1qckqw8naag3p9v3gxn0nm1z38";
    };
    nativeBuildInputs = [ pkgs.gnutar ];
  } ''
    mkdir -p "$out"
    tar xzf "$src" -C "$out" package/dist/bundle.js
    mv "$out/package/dist/bundle.js" "$out/wakatime.js"
    rm -rf "$out/package"
  '';
in

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    bat
    ffmpeg
    ripgrep
    fd
    eza
    btop
    lazygit
    jq
    yq
    fastfetch
    opencode
    nerd-fonts.jetbrains-mono
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ nil ];
    initLua = ''
      dofile(vim.fn.expand("~/dotfiles/nvim/init.lua"))
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yuitaa";
        email = "95457974+yuitaa@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    historyLimit = 5000;
  };

  programs.gh = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.file.".config/direnv/direnv.toml".source = ./direnv/direnv.toml;

  home.file.".config/opencode/plugin/wakatime.js".source =
    "${opencode-wakatime-plugin}/wakatime.js";

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "extract" "command-not-found" "z" "web-search" ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      export PATH="$HOME/dotfiles/scripts:$PATH"
      fastfetch --structure-disabled colors
    '';

    shellAliases = {
      ll = "ls -alF";
      update = "sudo nixos-rebuild switch --flake ~/dotfiles#$(grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null && echo nixos || echo default)";
      nv = "nvim";
    };
  };

  home.stateVersion = "26.05";
}
