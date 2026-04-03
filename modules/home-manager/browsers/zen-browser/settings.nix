{ ... }:

{
  programs.zen-browser.profiles.marques.settings = {
    "browser.startup.homepage" = "about:home";
    "browser.newtabpage.enabled" = false;
    "privacy.donottrackheader.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "signon.rememberSignons" = false;
    "extensions.pocket.enabled" = false;
    "datareporting.healthreport.uploadEnabled" = false;
  };
}
