{ lib, config, ... }:
{
    options.syncthing-service.enable = lib.mkEnableOption "syncthing-service";

    config = lib.mkIf config.syncthing-service.enable {
        services.syncthing = {
            enable = true;
        };
    };
}
