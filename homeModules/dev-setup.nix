{ pkgs, ... }:
{
    # While this isn't really necessary as they have this thing called devShell
    # on nixOS, I don't really want to have to redownload my entire dev setup
    # every time I run nix-collect-garbage
    home.packages = with pkgs; [
        gcc
        nil
        nixfmt
        postgresql
        rustup
        tree-sitter
    ];
}
