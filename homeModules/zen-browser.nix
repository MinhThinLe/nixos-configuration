{
    config,
    inputs,
    lib,
    pkgs,
    ...
}:
{
    imports = [
        inputs.zen-browser.homeModules.beta
    ];

    options.zen-browser.enable = lib.mkEnableOption "zen-browser";

    config = lib.mkIf config.zen-browser.enable {
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
            extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
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
            extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
                ublock-origin
                bitwarden
                vimium
            ];
        };

        programs.zen-browser.profiles."default".settings = {
            "browser.aboutConfig.showWarning" = false;
            "browser.translations.neverTranslateLanguages" = "vi";
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

        stylix.targets.zen-browser.profileNames = [
            "default"
            "University"
        ];

        programs.zen-browser.suppressXdgMigrationWarning = true;

        xdg.desktopEntries = {
            zen-browser-uni = {
                name = "Zen Browser (University profile)";
                genericName = "Web browser";
                exec = "zen-beta -P University";
                icon = "zen-browser";
                terminal = false;
                categories = [
                    "Network"
                    "WebBrowser"
                ];
                mimeType = [
                    "text/html"
                    "text/xml"
                ];
            };
        };
    };
}
