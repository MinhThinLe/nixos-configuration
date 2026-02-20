{
    inputs,
    pkgs,
    ...
}:

{
    home.username = "t0ast";
    home.homeDirectory = "/home/t0ast";

    imports = [
        inputs.zen-browser.homeModules.beta
        ./homeModules/zen-browser.nix
        ./homeModules/legacy-dotfiles.nix
        ./homeModules/foot.nix
        ./homeModules/shell-scripts.nix
    ];

    home.packages = with pkgs; [
        bat
        bluetui
        btop
        cargo
        cliphist
        eza
        fastfetch
        file-roller
        gcc
        gimp
        git
        hypridle
        hyprlock
        kanshi
        mako
        nautilus
        networkmanagerapplet
        networkmanager_dmenu
        unrar
        pwvucontrol
        ripgrep
        rofi
        rofi-calc
        starship
        swaybg
        ungoogled-chromium
        waybar
        wl-clipboard
        wl-mirror
        wlsunset
        zathura
        zoxide
    ];

    programs.git = {
        enable = true;
        settings = {
            user = {
                email = "minhthinle69@gmail.com";
                name = "T0ast";
            };
        };
    };

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

    services.kdeconnect.enable = true;

    home.stateVersion = "25.11";
}
