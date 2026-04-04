{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "marques-jpg";
    userEmail = "gfelicianomarques@gmail.com";

    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      cm = "commit -m";
      lg = "log --oneline --graph --all";
    };

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      
      gpg.format = "ssh";
      commit.gpgsign = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
