{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    settings = {
      background_opacity = "0.90"; 
      dynamic_background_opacity = "yes";

      enable_audio_bell = "no";
      window_alert_on_bell = "no";
      bell_on_tab = "no";
      command_on_bell = "none";

      window_padding_width = 10;
      confirm_os_window_close = 0;
    };

    extraConfig = ''
      background #1a1b26
      foreground #c0caf5
      selection_background #283457
      selection_foreground #c0caf5
      url_color #73daca
      cursor #c0caf5
      cursor_text_color #1a1b26
      
      color0 #15161e
      color1 #f7768e
      color2 #9ece6a
      color3 #e0af68
      color4 #7aa2f7
      color5 #bb9af7
      color6 #7dcfff
      color7 #a9b1d6
      
      color8 #414868
      color9 #f7768e
      color10 #9ece6a
      color11 #e0af68
      color12 #7aa2f7
      color13 #bb9af7
      color14 #7dcfff
      color15 #c0caf5
    '';
  };
}
