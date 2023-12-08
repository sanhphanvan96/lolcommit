# nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
# nix-shell -E 'with import <nixpkgs> {}; callPackage ./default.nix { }'
# nix-env -i ./result

{ stdenv, lib, fetchFromGitHub, bash, subversion, makeWrapper }:
let
  pname  = "lolcommit";
  gitUrl = "https://github.com/sanhphanvan96/lolcommit.git";
  gitOwner = "sanhphanvan96";
  gitRepo  = "lolcommit";
  gitTag = "v1.0.1";
  gitSHA256 = "sha256-CYmEsGLdJu6JdEdw4iFgA97/AKFvsFR7jixiw8q8r4g=";

in stdenv.mkDerivation {
  pname = "lolcommit";
  version = gitTag;
  src = fetchFromGitHub {
    owner = gitOwner;
    repo  = gitRepo;
    rev   = gitTag;
    sha256 = gitSHA256;
  };

  buildInputs = [ bash subversion ];
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/themes
    cp bin/lolcommit.sh $out/bin/lolcommit
    cp themes/*.txt $out/themes
    wrapProgram $out/bin/lolcommit \
      --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
  '';
}
