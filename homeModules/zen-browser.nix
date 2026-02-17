{ inputs, pkgs, stylix, ... }:
{
    programs.zen-browser.enable = true;
    programs.zen-browser.policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
        };
    };

    programs.zen-browser.profiles."default" = {
        id = 0;
        isDefault = true;
        extensions.packages = 
            with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
                bitwarden
                clearurls
                decentraleyes
                facebook-container
                privacy-badger
                ublock-origin
                vimium
            ];
    };
    
    programs.zen-browser.profiles."University" = {
        id = 1;
        isDefault = false;
        extensions.packages = 
            with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
                ublock-origin
                bitwarden
                vimium
            ];
    };

    programs.zen-browser.profiles."default".settings = {
        "browser.aboutConfig.showWarning" = false;
        "extensions.autoDisableScopes" = 0;
        "extensions.pocket.enabled" = false;
        "sidebar.visibility" = "hide-sidebar";
        "zen.view.compact.enable-at-startup" = true;
        "zen.view.compact.hide-tabbar" = false;
        "zen.view.compact.hide-taskbar" = false;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.sidebar-expanded" = false;
        "zen.view.use-single-toolbar" = false;
    };

    stylix.targets.zen-browser.profileNames = [ "default" "University" ];
}
