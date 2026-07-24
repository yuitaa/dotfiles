{ config, pkgs, ... }:

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

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "extract" "command-not-found" "z" "web-search" ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = "fastfetch --structure-disabled colors";

    shellAliases = {
      ll = "ls -alF";
      update = "sudo nixos-rebuild switch --flake ~/dotfiles#";
      nv = "nvim";
      init-project = "~/dotfiles/scripts/init-project";
    };
  };

  home.stateVersion = "26.05";
}
