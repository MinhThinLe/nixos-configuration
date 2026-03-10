{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.foot.enable = lib.mkEnableOption "foot";

    config = lib.mkIf config.foot.enable {
        stylix.targets.foot.enable = false;

        programs.foot =
            let
                foot-theme = pkgs.fetchurl {
                    url = "https://codeberg.org/dnkl/foot/raw/branch/master/themes/gruvbox-dark";
                    hash = "sha256-hlmLklG/vAEDy8I+k13+o4ZR6Cq6lTxOconjf9M75eo=";
                };
            in
            {
                enable = true;
                server.enable = true;
                settings = {
                    main = {
                        font = "JetBrainsMonoNL NFP:size=12";
                        include = "${foot-theme}";
                        box-drawings-uses-font-glyphs = "yes";
                    };
                    cursor = {
                        style = "beam";
                    };
                    key-bindings = {
                        scrollback-up-line = "Control+k";
                        scrollback-down-line = "Control+j";
                        search-start = "Control+Shift+s";
                        font-increase = "Control+plus Control+equal Control+KP_Add";
                        font-decrease = "Control+minus Control+KP_Subtract";
                    };
                    search-bindings = {
                        find-next = "Control+n";
                        find-prev = "Control+Shift+n";
                    };
                };
            };
    };
}
