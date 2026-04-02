{ config, pkgs, ... }:

{
  home.username = "marques";
  home.homeDirectory = "/home/marques";
  
  home.stateVersion = "25.11";

  imports = [
   #./git.nix
    ../../modules/home-manager/dev/git.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    #zen-browser
    spotify
    htop
  ];
  
  programs.home-manager.enable = true;
}
