{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage
  home.username = "david";
  home.homeDirectory = "/home/david";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    fzf
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;

    initExtra = ''
      # Set prompt
      PS1='%F{cyan}%n@%m%f %F{yellow}%~%f %# '

      # Basic key bindings
      bindkey -e
    '';

    shellAliases = {
      ll = "ls -la";
      g = "git";
      gaa = "git rev-parse --show-toplevel | xargs git add -A";
      gs = "git status";
      gd = "git diff";
      gc = "git commit";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
