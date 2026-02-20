{ pkgs, ... }:
{
    services = {
        getty.autologinOnce = true;
        getty.autologinUser = "t0ast";

        xserver.xkb = {
            layout = "us";
            variant = "";
        };

        pulseaudio.enable = false;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        libinput.enable = true;

        gvfs.enable = true;
        gnome.gnome-keyring.enable = true;

        tlp = {
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
    };

    security.polkit.enable = true;

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
}
