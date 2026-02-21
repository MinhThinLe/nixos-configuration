{
    pkgs,
    ...
}:

{
    home.username = "t0ast";
    home.homeDirectory = "/home/t0ast";

    imports = [
        ./../../homeModules
    ];

    home.packages = with pkgs; [
        bat
        bluetui
        btop
        cargo
        eza
        fastfetch
        file-roller
        gcc
        gimp
        hypridle
        hyprlock
        kanshi
        mako
        nautilus
        networkmanagerapplet
        networkmanager_dmenu
        pavucontrol
        ripgrep
        starship
        swaybg
        tree
        ungoogled-chromium
        unrar
        waybar
        zathura
        zoxide
    ];

    zen-browser.enable = true;
    foot.enable = true;
    rofi.enable = true;

    programs.git = {
        enable = true;
        settings = {
            user = {
                email = "minhthinle69@gmail.com";
                name = "T0ast";
            };
        };
    };

    programs.mangohud.enable = true;

    services.kdeconnect.enable = true;

    home.stateVersion = "25.11";
}
