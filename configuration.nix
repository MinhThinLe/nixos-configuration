# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
    imports = [
        ./hosts/laptop/hardware-configuration.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot = {
        extraModprobeConfig = ''
            options hid_apple fnmode=2
        '';
        kernelModules = [ "hid_apple" ];
    };

    boot = {
        plymouth = {
            enable = true;
            theme = "bgrt";
        };
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
            "quiet"
            "udev.log_level=3"
            "systemd.show_status=auto"
        ];
        loader.timeout = 0;
    };

    networking.hostName = "t0ast-nix";
    networking.networkmanager.enable = true;
    # Poking a hole in the firewall for kdeconnect
    networking.firewall = rec {
        allowedTCPPortRanges = [
            {
                from = 1714;
                to = 1764;
            }
        ];
        allowedUDPPortRanges = allowedTCPPortRanges;
    };

    time.timeZone = "Asia/Ho_Chi_Minh";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "vi_VN";
        LC_IDENTIFICATION = "vi_VN";
        LC_MEASUREMENT = "vi_VN";
        LC_MONETARY = "vi_VN";
        LC_NAME = "vi_VN";
        LC_NUMERIC = "vi_VN";
        LC_PAPER = "vi_VN";
        LC_TELEPHONE = "vi_VN";
        # LC_TIME = "en_US";
    };

    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.waylandFrontend = true;
        fcitx5.addons = with pkgs; [
            kdePackages.fcitx5-unikey
            kdePackages.fcitx5-configtool
        ];
    };

    services.getty.autologinUser = "t0ast";

    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    services.pulseaudio.enable = false;
    security.polkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    services.libinput.enable = true;

    services.gvfs.enable = true;

    services.gnome.gnome-keyring.enable = true;
    
    services.tlp = {
        enable = true;
        pd.enable = true;
        settings = {
            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_ENERGY_PERF_POLICY_ON_SAV = "power";

            PLATFORM_PROFILE_ON_AC = "performance";
            PLATFORM_PROFILE_ON_BAT = "low-power";
            PLATFORM_PROFILE_ON_SAV = "low-power";

            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 0;
            CPU_BOOST_ON_SAV = 0;

            CPU_HWP_DYN_BOOST_ON_AC = 1;
            CPU_HWP_DYN_BOOST_ON_BAT = 0;
            CPU_HWP_DYN_BOOST_ON_SAV = 0;

            WIFI_PWR_ON_AC = "on";
            WIFI_PWR_ON_BAT = "on";
        };
    };

    users.users.t0ast = {
        isNormalUser = true;
        description = "t0ast";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
        # packages = with pkgs; [ ];
        shell = pkgs.zsh;
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        xwayland-satellite
        niri
        neovim
        tlp
        tlp-pd
    ];

    fonts.packages = with pkgs; [
        icomoon-feather
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
    ];

    environment.variables = {
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
    };

    programs.neovim = {
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestions.enable = true;
    };

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
        config = {
            common = {
                default = [ "gtk" ];
            };
            niri = {
                default = [
                    "gnome"
                    "gtk"
                ];
                "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
                "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
            };
        };
    };

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    nix.nixPath = [ "/home/t0ast/nixos-configuration" ];

    services.xserver.videoDrivers = [ "modesetting" ];

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver
            vpl-gpu-rt
            pkgs.mesa
        ];
    };

    programs.steam.enable = true;

    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
    };

    system.stateVersion = "25.11";
}
