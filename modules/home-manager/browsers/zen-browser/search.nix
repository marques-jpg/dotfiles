{ ... }:

{
  programs.zen-browser.profiles.marques.search = {
    force = true;
    default = "SearXNG";
    engines = {
      "SearXNG" = {
        urls = [
          {
            template = "https://browser.pryvo.at.eu.org/search";
            params = [
              { name = "q"; value = "{searchTerms}"; }
            ];
          }
          {
            type = "application/x-suggestions+json";
            template = "https://browser.pryvo.at.eu.org/autocompleter";
            params = [
              { name = "q"; value = "{searchTerms}"; }
            ];
          }
        ];
        iconUpdateURL = "https://browser.pryvo.at.eu.org/favicon.ico";
        updateInterval = 24 * 60 * 60 * 1000;
        definedAliases = [ "@busca" "@s" ];
      };

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