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
        eza
        fastfetch
        gimp
        hypridle
        hyprlock
        kanshi
        mako
        mpv
        networkmanager_dmenu
        networkmanagerapplet
        pavucontrol
        ripgrep
        swaybg
        tinymist
        tree
        typst
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
    clipboard.enable = true;
    dolphin.enable = true;

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
