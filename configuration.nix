# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [
        /etc/nixos/hardware-configuration.nix
        ./style.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.extraModprobeConfig = ''
        options hid_apple fnmode=2
    '';
    boot.kernelModules = [ "hid_apple" ];

    networking.hostName = "t0ast-nix";
    networking.networkmanager.enable = true;
    networking.firewall = rec {
        allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
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

    users.users.t0ast = {
        isNormalUser = true;
        description = "t0ast";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        xwayland-satellite
    ];

    fonts.packages = with pkgs; [
        icomoon-feather
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
    ];

    environment.variables = {
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
    };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    programs.niri.enable = true;
    programs.foot.theme = "gruvbox-dark";

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

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.gnome.gnome-keyring.enable = true;

    services.xserver.videoDrivers = [ "modesetting" ];

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            pkgs.mesa.drivers
        ];
    };

    system.stateVersion = "25.11";
}
