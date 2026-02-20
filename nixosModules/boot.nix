{ pkgs, ... }:
{
    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        kernelPackages = pkgs.linuxPackages_latest;

        # Fixes my keyboard
        extraModprobeConfig = ''
            options hid_apple fnmode=2
        '';
        kernelModules = [ "hid_apple" ];

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
}
