{ ... }:

{
  programs.zen-browser.profiles.marques.search = {
    force = true;
    default = "DuckDuckGo";
    engines = {
      "Nix Packages" = {
        urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
        iconUpdateURL = "https://nixos.org/favicon.png";
        updateInterval = 24 * 60 * 60 * 1000;
        definedAliases = [ "@np" ];
      };
      "Google".metaData.hidden = true;
    };
  };
}
