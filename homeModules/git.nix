{
    config,
    lib,
    ...
}:
{
    options.git.enable = lib.mkEnableOption "git";

    config = lib.mkIf config.git.enable {
        programs.git.enable = true;

        programs.git = {
            settings = {
                user = {
                    email = "minhthinle69@gmail.com";
                    name = "T0ast";
                };
            };
        };
    };
}
