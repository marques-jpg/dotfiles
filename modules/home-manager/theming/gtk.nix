{ pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
