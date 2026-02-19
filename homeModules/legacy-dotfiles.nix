{ config, ... }:
{
    home.file."${config.xdg.configHome}" = {
        source = ./legacyDotfiles;
        recursive = true;
    };

    home.file."${config.xdg.configHome}/rofi/launchers/type-1/launcher.sh" = {
        source = ./legacyDotfiles/rofi/launchers/type-1/launcher.sh;
        executable = true;
    };

    home.file."${config.xdg.configHome}/rofi/applets/bin/" = {
        source = ./legacyDotfiles/rofi/applets/bin;
        recursive = true;
        executable = true;
    };

    home.file.".zshrc" = {
        source = ./legacyDotfiles/.zshrc;
    };

    home.file.".zprofile".text = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
            exec niri-session -l
        fi
    '';

    # Stupid way to add a script
    home.file."${config.xdg.dataHome}/nvim/mason/bin/prettify-table" = {
        text = "tr -s \" \" | column -t -s '|' -o '|'";
        executable = true;
    };

    home.file."scripts/cliphist.sh" = {
        text = ''
            #!/usr/bin/env bash
            if [ -z "$1" ]; then
                cliphist list # | sed 's/.*\t//'
            else
                cliphist decode <<<"$1" | wl-copy
            fi
        '';
        executable = true;
    };

    home.file."scripts/nightlight.sh" = {
        text = ''
            START_TIME="19:30"
            END_TIME="6:30"
            COLOR_TEMPERATURE="3500"

            wlsunset \
                -t $COLOR_TEMPERATURE \
                -s $START_TIME \
                -S $END_TIME \
        '';
        executable = true;
    };

    home.file."scripts/present.sh" = {
        text = ''
            if  [ -e /run/user/1000/pipectl.1000.wl-present.pipe ]; then
                rm /run/user/1000/pipectl.1000.wl-present.pipe
            fi
            sleep 0.5
            niri msg action focus-monitor "eDP-1" && \
                wl-present mirror eDP-1 --fullscreen-output HDMI-A-1 --fullscreen &
        '';
        executable = true;
    };
}
