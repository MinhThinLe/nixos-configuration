# {
#     inputs,
#     pkgs,
#     lib,
#     ...
# }:
# let
#     extension = shortId: guid: {
#         name = guid;
#         value = {
#             install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
#             installation_mode = "normal_installed";
#         };
#     };
#
#     prefs = {
#         # Check these out at about:config
#         "extensions.autoDisableScopes" = 0;
#         "extensions.pocket.enabled" = false;
#         "browser.aboutConfig.showWarning" = false;
#         "sidebar.visibility" = "hide-sidebar";
#         "zen.view.compact.enable-at-startup" = true;
#         "zen.view.compact.hide-taskbar" = false;
#         "zen.view.compact.hide-toolbar" = true;
#         # ...
#     };
#
#     extensions = [
#         # To add additional extensions, find it on addons.mozilla.org, find
#         # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
#         # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid
#         (extension "ublock-origin" "uBlock0@raymondhill.net")
#         (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
#         (extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}")
#         (extension "facebook-container" "@contain-facebook")
#         (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
#         (extension "darkreader" "addons@darkreader.org")
#         (extension "decentraleyes" "jid1-BoFifL9Vbdl2zQ@jetpack")
#         (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
#         # ...
#     ];
#
# in
# {
#     home.packages = [
#         (pkgs.wrapFirefox
#             inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
#             {
#                 extraPrefs = lib.concatLines (
#                     lib.mapAttrsToList (
#                         name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
#                     ) prefs
#                 );
#
#                 extraPolicies = {
#                     DisableTelemetry = true;
#                     ExtensionSettings = builtins.listToAttrs extensions;
#
#                     SearchEngines = {
#                         Default = "ddg";
#                         Add = [
#                             {
#                                 Name = "nixpkgs packages";
#                                 URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
#                                 IconURL = "https://wiki.nixos.org/favicon.ico";
#                                 Alias = "@np";
#                             }
#                             {
#                                 Name = "NixOS options";
#                                 URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
#                                 IconURL = "https://wiki.nixos.org/favicon.ico";
#                                 Alias = "@no";
#                             }
#                             {
#                                 Name = "NixOS Wiki";
#                                 URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
#                                 IconURL = "https://wiki.nixos.org/favicon.ico";
#                                 Alias = "@nw";
#                             }
#                             {
#                                 Name = "noogle";
#                                 URLTemplate = "https://noogle.dev/q?term={searchTerms}";
#                                 IconURL = "https://noogle.dev/favicon.ico";
#                                 Alias = "@ng";
#                             }
#                         ];
#                     };
#
#                 };
#                 profiles = {
#                     personal = {
#                         id = 0;
#                         name = "Personal";
#                         isDefault = true;
#                     };
#
#                     university = {
#                         id = 1;
#                         name = "University";
#                         isDefault = false;
#                     };
#                 };
#             }
#         )
#     ];
# }
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
