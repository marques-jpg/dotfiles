{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    libreoffice
    mattermost-desktop
  ];
}
