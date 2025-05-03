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

  home.packages = with pkgs; [ python313 ];

  programs.home-manager.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;

    initExtra = ''
      # Set prompt
      PS1='
      %F{cyan}%n@%m%f %F{yellow}%~%f %F{cyan}$%f '

      # Basic key bindings
      bindkey -e
    '';

    shellAliases = {
      ll = "ls -la";
      g = "git";
      gaa = "git rev-parse --show-toplevel | xargs git add -A";
      gca = "git rev-parse --show-toplevel | xargs git add -A && git commit";
      gs = "git status";
      gg = "git status";
      gd = "git diff";
      gc = "git commit";
      ggp = "git push origin $(git rev-parse --abbrev-ref HEAD)";
      ggl = "git pull origin $(git rev-parse --abbrev-ref HEAD)";
      ggpull = "git pull origin $(git rev-parse --abbrev-ref HEAD)";
      ggf = "git push -f origin $(git rev-parse --abbrev-ref HEAD)";
    };
  };

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      amend = "commit --amend";
    };
  };

  home.stateVersion = "24.11";
}
