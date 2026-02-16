{ inputs, config, pkgs, ... }:

{
    home.username = "t0ast";
    home.homeDirectory = "/home/t0ast";

    # Import files from the current configuration directory into the Nix store,
    # and create symbolic links pointing to those store files in the Home directory.

    # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

    # Import the scripts directory into the Nix store,
    # and recursively generate symbolic links in the Home directory pointing to the files in the store.
    # home.file.".config/i3/scripts" = {
    #   source = ./scripts;
    #   recursive = true;   # link recursively
    #   executable = true;  # make all files executable
    # };

    # encode the file content in nix configuration file directly
    # home.file.".xxx".text = ''
    #     xxx
    # '';

    # set cursor size and dpi for 4k monitor
    # xresources.properties = {
    #   "Xcursor.size" = 16;
    #   "Xft.dpi" = 172;
    # };

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
        gruvbox-dark-gtk
        hypridle
        hyprlock
        kanshi
        nemo
        nemo-fileroller
        kdePackages.fcitx5-configtool
        kdePackages.fcitx5-qt
        kdePackages.fcitx5-unikey
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
        mako
        networkmanager_dmenu
        nwg-look
        pwvucontrol
        ripgrep
        rofi
        rofi-calc
        swaybg
        ungoogled-chromium
        waybar
        wl-mirror
        yazi
        zathura
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
