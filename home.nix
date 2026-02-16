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
        fcitx5
        fcitx5-gtk
        fluent-icon-theme
        git
        hypridle
        hyprlock
        kanshi
        kdePackages.fcitx5-configtool
        kdePackages.fcitx5-qt
        kdePackages.fcitx5-unikey
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

    home.stateVersion = "25.11";
}
