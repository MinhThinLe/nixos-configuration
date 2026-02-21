# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
    imports = [
        ./hosts/laptop/hardware-configuration.nix
        ./nixosModules
    ];

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

    environment.systemPackages = with pkgs; [
        niri
        sof-firmware
        xwayland-satellite
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
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestions.enable = true;
    };

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];
    nixpkgs.config.allowUnfree = true;

    programs.steam.enable = true;

    system.stateVersion = "25.11";
}
