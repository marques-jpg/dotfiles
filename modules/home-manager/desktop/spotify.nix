{ pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;
    
    theme = spicePkgs.themes.sleek;
    
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
      hidePodcasts
    ];
  };
}
