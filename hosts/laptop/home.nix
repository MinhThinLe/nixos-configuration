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
        brightnessctl
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
        networkmanager_dmenu
        networkmanagerapplet
        pavucontrol
        ripgrep
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
    starship.enable = true;
    git.enable = true;

    programs.mangohud.enable = true;

    services.kdeconnect.enable = true;

    xdg.userDirs = {
        enable = true;
        desktop = "$HOME/Desktop";
        documents = "$HOME/Documents";
        download = "$HOME/Downloads";
        pictures = "$HOME/Pictures";
        music = "$HOME/Music";
        videos = "$HOME/Videos";
        publicShare = "$HOME/Public";
    };

    home.stateVersion = "25.11";
}
