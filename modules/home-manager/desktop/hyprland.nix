{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  
  home.packages = with pkgs; [
    grim          # Tira a fotografia do ecrã
    slurp         # Permite selecionar a área do ecrã com o rato
    wl-clipboard  # Copia a imagem para a área de transferência
    swaybg        # O motor ultraleve para gerir o wallpaper
    #swaylock
    swayidle
  ];

  programs.swaylock = {
    enable = true;
    settings = {
      color = "080808";           # Fundo Moonfly (Carvão escuro)
      ring-color = "e4e4e4";      # O Círculo normal a branco/cinza claro
      inside-color = "080808";    # O interior do círculo igual ao fundo
      line-color = "00000000";    # Remove as linhas de separação (transparente)
      separator-color = "00000000"; 
      
      key-hl-color = "c99d46";    # O azul vibrante do Moonfly quando carregas nas teclas
      ring-ver-color = "8cc85f";  # Verde quando está a verificar a password
      ring-wrong-color = "ff5454";# Vermelho quando te enganas
      text-color = "e4e4e4";      # Texto a branco
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "\wofi --show drun -I";

      env = [
        "GTK_THEME,Adwaita:dark"
      ];

      "exec-once" = [
        "hyprctl setcursor Adwaita 24"
        "blueman-applet"                         # Ícone do Bluetooth em segundo plano
        "swaybg -i ~/.wallpaper.jpg -m fill"     # Motor de wallpaper
        "bash -c 'sleep 2 && waybar'"
	"waybar"
	"bash -c 'pkill waybar; sleep 2; waybar'"
	#"swayidle -w before-sleep 'swaylock -f -c 080808'"
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
        "gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'"
      ];

      input = {
        kb_layout = "pt";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true; # Inverte o scroll para o comportamento moderno
        };
        sensitivity = 0; # Sensibilidade do rato
      };

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, Q, killactive,"         
        "$mod SHIFT, M, exit,"         
        "$mod, Space, exec, $menu"     
        "$mod, V, togglefloating,"     
        "$mod, F, fullscreen,"
	"$mod SHIFT, S, exec, spotify"
	"$mod SHIFT, D, exec, vesktop"
	"$mod SHIFT, B, exec, zen-beta"        
        
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        
	"$mod, X, exec, swaylock -f"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

	"$mod SHIFT, left, swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up, swapwindow, u"
        "$mod SHIFT, down, swapwindow, d"
        
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"        
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 0"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 0"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(c0caf5aa) rgba(a9b1d6aa) 45deg";
        "col.inactive_border" = "rgba(414868aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
      
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 4, myBezier"
          "windowsOut, 1, 4, default, popin 80%"
          "border, 1, 5, default"
          "fade, 1, 4, default"
          "workspaces, 1, 3, default"
        ];
      };
    };
  };
}
