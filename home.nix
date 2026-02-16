{ inputs, config, pkgs, ... }:

{
    home.username = "t0ast";
    home.homeDirectory = "/home/t0ast";

    imports = [
        ./homeModules/zen-browser.nix
        ./homeModules/legacy-dotfiles.nix
    ];

    home.packages = with pkgs; [
        bat
        bluetui
        btop
        eza
        fastfetch
        fluent-icon-theme
        git
        hypridle
        hyprlock
        kanshi
        mako
        nemo
        nemo-fileroller
        networkmanager_dmenu
        pwvucontrol
        ripgrep
        rofi
        rofi-calc
        starship
        swaybg
        ungoogled-chromium
        waybar
        wl-mirror
        yazi
        zathura
        zoxide
    ];

    programs.foot = {
        enable = true;
        server.enable = true;
        settings = {
            # font = "JetBrains Mono";
        };
    };

    programs.git = {
        enable = true;
        settings = {
            user = {
                email = "minhthinle69@gmail.com";
                name = "T0ast";
            };
        };
    };

    programs.starship = {
        enable = true;
        settings = {
            add_newline = false;
            aws.disabled = true;
            gcloud.disabled = true;
            line_break.disabled = true;
        };
    };

    services.kdeconnect.enable = true;

    i18n.inputMethod.fcitx5.settings.globalOptions = {
        Hotkey = {
            TriggerKeys = "";
            EnumerateWithTriggerKeys = true;
            ActivateKeys = "";
            DeactivateKeys = "";
            AltTriggerKeys = "";
            EnumerateSkipFirst = false;
            EnumerateGroupForwardKeys = "";
            EnumerateGroupBackwardKeys = "";
            TogglePreedit = "";
            ModifierOnlyKeyTimeout = 250;
            EnumerateForwadKeys = {
                "0" = "Control+Shift+Shift_L";
            };
            EnumerateBackwardKeys = {
                "0" = "Control+Alt+Alt_L";
            };
            PrevPage = {
                "0" = "Up";
            };
            NextPage = {
                "0" = "Down";
            };
            PrevCandidate = {
                "0" = "Shift+Tab";
            };
            NextCandidate = {
                "0" = "Tab";
            };
        };

        Behavior = {
            ActiveByDefault = false;
            resetStateWhenFocusedIn = "No";
            ShareInputState = "No";
            PreeditEnabledByDefault = true;
            ShowInputMethodInformation = true;
            showInputMethodInformationWhenFocusIn = false;
            CompactInputMethodInformation = true;
            ShowFirstInputMethodInformation = true;
            DefaultPageSize = 5;
            OverrideXkbOption = false;
            CustomXkbOption = "";
            EnabledAddons = "";
            DisabledAddons = "";
            PreloadInputMethod = true;
            AllowInputMethodForPassword = false;
            AutoSavePeriod = 30;
        };
    };

    home.stateVersion = "25.11";
}
