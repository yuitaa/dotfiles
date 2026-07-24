{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    neovim
    bat
    ffmpeg
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yuita";
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

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "extract" "command-not-found" "z" "web-search" ];
      theme = "robbyrussell";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "fastfetch\n";

    shellAliases = {
      ll = "ls -alF";
      update = "sudo nixos-rebuild switch --flake ~/dotfiles#";
      nv = "nvim";
    };
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nixos/dotfiles/nvim";

  home.stateVersion = "26.05";
}
