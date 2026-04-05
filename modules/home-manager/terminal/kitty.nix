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
      background #080808
      foreground #bdbdbd
      selection_background #b0b0b0
      selection_foreground #080808
      cursor #9e9e9e
      cursor_text_color #080808
      
      # cores Moonfly
      color0 #323437
      color1 #ff5454
      color2 #8cc85f
      color3 #e3c78a
      color4 #80a0ff
      color5 #cf87e8
      color6 #79dac8
      color7 #c6c6c6
      
      color8 #373c40
      color9 #ff5189
      color10 #36c692
      color11 #c2c292
      color12 #74b2ff
      color13 #ae81ff
      color14 #85dc85
      color15 #e4e4e4
    '';
  };
}
