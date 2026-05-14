{ pkgs, ... }:
let
    keyboard_product_name = "5ac/24f/200"; # Remember to change this when I inevitably get a new keyboard
in
{
    services.udev = {
        extraRules = ''
            SUBSYSTEM=="usb", ACTION=="add", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="${keyboard_product_name}", RUN+="${pkgs.writeShellScriptBin "laptop-keyboard" (builtins.readFile ./laptop-keyboard.sh)}/bin/laptop-keyboard disable"
            SUBSYSTEM=="usb", ACTION=="remove", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="${keyboard_product_name}", RUN+="${pkgs.writeShellScriptBin "laptop-keyboard" (builtins.readFile ./laptop-keyboard.sh)}/bin/laptop-keyboard enable"
        '';
    };

    environment.systemPackages = [
        (pkgs.writeShellScriptBin "laptop-keyboard" (builtins.readFile ./laptop-keyboard.sh))
    ];
}
