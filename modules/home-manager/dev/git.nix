{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "marques-jpg";
    userEmail = "gfelicianomarques@gmail.com";
  };
}
