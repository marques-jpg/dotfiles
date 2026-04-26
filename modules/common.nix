{ config, pkgs, inputs, ... }:

{

  nixpkgs.overlays = [
    inputs.firefox-addons.overlays.default
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.kernelParams = [ "snd_rn_pci_acp3x.dmic_acpi_check=1" ];
  boot.kernelParams = [ 
    "snd_rn_pci_acp3x.dmic_acpi_check=1" 
    "snd_pci_acp6x.dmic_acpi_check=1" 
  ];  

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.xkb = { layout = "pt"; variant = ""; };
  console.keyMap = "pt-latin1";

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.docker.enable = true;

  programs.zsh.enable = true;

  users.users.marques = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Guilherme Marques";
    extraGroups = [ "networkmanager" "wheel" "dialout" "docker" ];
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  security.pam.services.swaylock = {};
  programs.dconf.enable = true;
  #hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;
  #hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };  
  services.blueman.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ 
    wofi
    git
    vesktop
    pavucontrol
  ];
  system.stateVersion = "25.11";
  age.identityPaths = [ "/home/marques/.ssh/id_ed25519" ];
  age.secrets.teste.file = ../secrets/teste.age;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  services.pipewire.wireplumber.extraConfig = {
    "10-bluetooth-policy" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
	"bluez5.autoswitch-profile" = false;
        "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "headset_head_unit" "headset_audio_gateway" ];
      };
    };
  };
}
