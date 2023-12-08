.PHONY: build build-nix clean-nix

build: build-nix

build-nix:
	cd ./pkg/nix && nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'

clean-nix:
	cd ./pkg/nix && nix-collect-garbage
