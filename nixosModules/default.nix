{ ... }: {
    imports = [
        ./boot.nix
        ./keyboard-disabling.nix
        ./graphics.nix
        ./i18n.nix
        ./services.nix
        ./style.nix
    ];
}
