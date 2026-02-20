{ pkgs, ... }:
{
    time.timeZone = "Asia/Ho_Chi_Minh";

    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
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

        inputMethod = {
            enable = true;
            type = "fcitx5";
            fcitx5.waylandFrontend = true;
            fcitx5.addons = with pkgs; [
                kdePackages.fcitx5-unikey
                kdePackages.fcitx5-configtool
            ];
        };
    };
}
