{ config, pkgs, inputs, ... }:

{
  home.username = "marques";
  home.homeDirectory = "/home/marques";
  
  home.stateVersion = "26.05";

  imports = [
   #./git.nix
   #../../modules/home-manager/dev/git.nix
   inputs.zen-browser.homeModules.default
   ../../modules/home-manager/desktop/waybar.nix
   ../../modules/home-manager/desktop/hyprland.nix
   ../../modules/home-manager/desktop/spotify.nix
   ../../modules/home-manager/terminal
   ../../modules/home-manager/theming/gtk.nix
   ../../modules/home-manager/essentials.nix
   ../../modules/home-manager/dev
   ../../modules/home-manager/browsers/zen-browser
  ];

  home.packages = with pkgs; [
    fastfetch
    #zen-browser
    #spotify
    htop
  ];
  
  programs.home-manager.enable = true;
}
