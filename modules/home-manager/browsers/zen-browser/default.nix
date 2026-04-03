{ config, pkgs, inputs, ... }:

{
  imports = [
    ./settings.nix
    ./search.nix
  ];

  programs.zen-browser = {
    enable = true;
    #package = inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default; 

    profiles.marques = {
      id = 0;
      name = "marques";
      isDefault = true;

      extensions = {
	force = true;
        packages = [
          pkgs.firefoxAddons.ublock-origin
          pkgs.firefoxAddons.bitwarden-password-manager
          pkgs.firefoxAddons.darkreader
	  pkgs.firefoxAddons.chameleon-ext
        ];
      };
    };
  };
}
