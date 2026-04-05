{ pkgs, ... }:

{
  # Precisamos de instalar o motor do equalizador de som
  home.packages = with pkgs; [
    cava
    dejavu_fonts
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;    

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 8;
        
        # A Nova Estrutura: Som colado à janela e Relógio no centro
        modules-left = [ "custom/nixos" "hyprland/workspaces" "hyprland/window" "cava" ];
        modules-center = [ "clock" ];
        modules-right = [ "mpris" "cpu" "memory" "battery" "tray" ];

        "custom/nixos" = {
          format = " ";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        # Janela atual com o ÍCONE OFICIAL da App
        "hyprland/window" = {
          format = "{class}"; 
          icon = true;        
          icon-size = 18;
          max-length = 20;
          separate-outputs = true;
          rewrite = {
            "" = "Desktop";
          };
        };

        # O Equalizador de Som
        "cava" = {
          framerate = 30;
          autosens = 1;
          bars = 10;
          method = "pipewire";
          format-icons = [ " " "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        # Relógio no Centro
        "clock" = {
          format = "{:%a, %b %d %Y - %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "mpris" = {
          format = " {artist} - {title}";
          max-length = 30;
        };

        "cpu" = {
          format = "CPU {usage}%";
        };

        "memory" = {
          format = "RAM {}%";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "BAT {capacity}%";
          format-charging = "CHG {capacity}%";
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    # CSS - Design 100% Flat e Cores Moonfly
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }

      window#waybar {
        background-color: #080808; 
        color: #bdbdbd;
      }

      #custom-nixos, #workspaces, #window, #cava, #mpris, #clock, #cpu, #memory, #battery, #tray {
        background-color: transparent;
        padding: 0 7px;
      }

      #custom-nixos {
        color: #80a0ff; /* Azul vibrante Moonfly */
        font-size: 16px;
      }

      #workspaces button {
        color: #373c40; /* Cinza escuro para as workspaces inativas */
      }

      #workspaces button.active {
        color: #80a0ff; /* Azul para a ativa */
      }

      #workspaces button:hover {
        background: transparent;
        box-shadow: none;
        text-shadow: none;
      }

      /* Estilo para o nome da aplicação e ícone */
      #window {
        color: #e4e4e4;
        font-weight: bold;
        padding-left: 15px;
      }

      /* Estilo para as barras de som coladas ao nome da app */
      #cava {
        color: #ae81ff; /* Roxo brilhante Moonfly */
        padding-left: 0;
	font-family: "DejaVu Sans Mono";
        font-size: 14px; 
      }

      #clock {
        color: #bdbdbd;
        font-weight: bold;
      }

      #mpris { color: #8cc85f; }
      #battery.warning { color: #e3c78a; }
      #battery.critical { color: #ff5454; }
    '';
  };
}
