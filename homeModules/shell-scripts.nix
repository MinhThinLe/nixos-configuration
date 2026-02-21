{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        (writeShellScriptBin "clipboard-manager" ''
            if [ -z "$1" ]; then
                ${pkgs.cliphist}/bin/cliphist list
            else
                ${pkgs.cliphist}/bin/cliphist decode <<<"$1" | ${pkgs.wl-clipboard}/wl-copy
            fi
        '')

        (writeShellScriptBin "nightlight" ''
            ${pkgs.wlsunset}/bin/wlsunset \
                -t 3500 \
                -s 19:30 \
                -S 6:30 \
        '')

        (writeShellScriptBin "present" ''
            if  [ -e /run/user/1000/pipectl.1000.wl-present.pipe ]; then
                rm /run/user/1000/pipectl.1000.wl-present.pipe
            fi

            ${pkgs.wl-mirror}/bin/wl-present mirror eDP-1 --fullscreen-output HDMI-A-1 --fullscreen
        '')

        (writeShellScriptBin "note" ''
            pushd /home/t0ast/stuff/notes
            ${pkgs.neovim}/bin/nvim index.md
            popd
        '')

    ];

    home.file.".zprofile".text = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
            exec niri-session -l
        fi
    '';

    home.file."${config.xdg.dataHome}/nvim/mason/bin/prettify-table" = {
        text = "tr -s \" \" | column -t -s '|' -o '|'";
        executable = true;
    };
}
