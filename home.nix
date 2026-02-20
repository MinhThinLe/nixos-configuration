{
    pkgs,
    ...
}:

{
    home.username = "t0ast";
    home.homeDirectory = "/home/t0ast";

    imports = [
        ./homeModules
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

    zen-browser.enable = true;
    foot.enable = true;

    programs.git = {
        enable = true;
        settings = {
            user = {
                email = "minhthinle69@gmail.com";
                name = "T0ast";
            };
        };
    };

    services.kdeconnect.enable = true;

    home.stateVersion = "25.11";
}
