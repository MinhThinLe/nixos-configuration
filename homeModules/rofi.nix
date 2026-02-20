{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.rofi.enable = lib.mkEnableOption "rofi";

    config = lib.mkIf config.rofi.enable {
        programs.rofi = {
            enable = true;
            package = pkgs.rofi;
            plugins = with pkgs; [
                (rofi-calc.override { rofi-unwrapped = rofi-unwrapped; })
            ];
        };
    };
}
