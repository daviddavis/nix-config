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

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      gs = "git status";
      gd = "git diff";
      wat = "echo 'wut'";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
