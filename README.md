# My flake-based NixOS configuration

To install it, do it like you would with any other flake-based config

```sh
sudo nixos-rebuild switch --flake .#t0ast-nix
```

Do note that for things to work correctly, your root partition should be
symlinked to `/dev/disk/by-label/root` and has an ext4 filesystem. Similarly,
your boot partition must be available at `/dev/disk/by-designator/esp` and is
formatted as vfat. If you would like to use another filesystem (for example
btrfs) or have totally different hardware (my laptop is currently a Lenovo
Ideapad Slim 3 15IAH8), you'll have to manually edit
`hosts/laptop/hardware-configuration.nix` or generate a new one with

```sh
nixos-generate-config --show-hardware config
```

then replace the old config with the one from the output of the aforementioned
command.
