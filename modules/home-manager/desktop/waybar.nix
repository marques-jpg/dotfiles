{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "battery" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "default" = "";
            "active" = "";
          };
        };

        "clock" = {
          format = "{:%H:%M  -  %d/%m/%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = "CPU: {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = "RAM: {}%";
        };

        "battery" = {
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "BAT: {capacity}%";
          format-charging = "CHG: {capacity}%";
          format-plugged = "PLG: {capacity}%";
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    # CSS Mágico (Cores Tokyo Night)
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(8, 8, 8, 0.9); /* Fundo Moonfly */
        color: #bdbdbd;
      }

      #workspaces button {
        padding: 0 10px;
        color: #565f89;
      }

      #workspaces button.active {
        color: #80a0ff; /* Azul vibrante Moonfly */
      }

      #clock, #battery, #cpu, #memory, #tray {
        padding: 0 15px;
        color: #bdbdbd;
      }

      #battery.warning { color: #e0af68; }
      #battery.critical { color: #f7768e; }
    '';
  };
}
