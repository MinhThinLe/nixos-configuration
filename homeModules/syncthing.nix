{ lib, config, ... }:
let
    container_id = "J67GSOV-VDEBACT-ZGNFGA5-W5GKANU-XMXQCIO-UPWPQXN-JBM4TLV-ATAB3QX";
in
{
    options.syncthing-service.enable = lib.mkEnableOption "syncthing-service";

    config = lib.mkIf config.syncthing-service.enable {
        services.syncthing = {
            enable = true;
            settings = {
                devices = {
                    "syncthing-container" = {
                        id = container_id;
                    };
                };
                folders = {
                    "Synced" = {
                        path = "/home/stuff/synced";
                    };
                };
            };
        };
    };
}
