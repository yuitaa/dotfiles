{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    neovim
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
    nil
    nerd-fonts.jetbrains-mono
  ];

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
    };
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nixos/dotfiles/nvim";

  home.stateVersion = "26.05";
}
