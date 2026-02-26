{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.clipboard.enable = lib.mkEnableOption "clipboard manager";

    config = lib.mkIf config.clipboard.enable {
        home.packages = with pkgs; [
            wl-clipboard
            cliphist

            (writeShellScriptBin "clipboard-manager" ''
                if [ -z "$1" ]; then
                    ${pkgs.cliphist}/bin/cliphist list
                else
                    ${pkgs.cliphist}/bin/cliphist decode <<<"$1" | ${pkgs.wl-clipboard}/bin/wl-copy
                fi
            '')
        ];

        systemd.user.services."clipboard-manager" = {
            Unit = {
                Description = "A clipboard manager daemon";
            };
            Install = {
                WantedBy = [ "default.target" ];
            };
            Service = {
                Type = "simple";
                ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
            };
        };
    };
}
