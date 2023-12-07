{ stdenv, fetchFromGitHub, bash }:

stdenv.mkDerivation rec {
  pname = "lolcommit";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "your-github-username";
    repo = pname;
    rev = "v${version}";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  buildInputs = [ bash ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/bin/lolcommit.sh $out/bin/lolcommit
  '';

  meta = with stdenv.lib; {
    description = "A random commit message generator";
    homepage = "https://github.com/your-github-username/lolcommit";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
