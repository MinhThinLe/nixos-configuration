{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {

    nixosConfigurations.t0ast-nix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [
        ./configuration.nix
        # ./homeModules/zen-browser.nix
        home-manager.nixosModules.home-manager
	    {
	      home-manager.extraSpecialArgs = {inherit inputs self;};
          home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.t0ast = import ./home.nix;
	    }
      ];
    };
  };
}
