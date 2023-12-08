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
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "sanhphanvan96";
      repo = "lolcommit";
      rev = "v1.0.0";
      sha256 = "kiENQHeDqCbujERdxl+Rdzy2WUtvq6Jl7HqvH7zhNlc=";
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
