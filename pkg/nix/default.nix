# nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
# nix-shell -E 'with import <nixpkgs> {}; callPackage ./default.nix { }'

{ stdenv
, lib
, fetchFromGitHub
, bash
, subversion
, makeWrapper
}:
  stdenv.mkDerivation {
    pname = "lolcommit";
    version = "v1.0.1";
    src = fetchFromGitHub {
      owner = "sanhphanvan96";
      repo = "lolcommit";
      rev = "v1.0.1";
      sha256 = "sha256-5jAkLv7fpeNVHOW1cFwGCV573JkypxInwZs/zu4co+A=";
    };
    buildInputs = [ bash subversion ];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/themes
      cp bin/lolcommit.sh $out/bin/lolcommit.sh
      cp themes/*.txt $out/themes
      wrapProgram $out/bin/lolcommit.sh \
        --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
    '';
  }
