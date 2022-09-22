{
  lib
  , buildPythonPackage
  , fetchFromGitHub
  , cadquery
  , pytestCheckHook
}:
buildPythonPackage rec {
  pname = "cq-kit";
  rev = "f5820c67030f14ae8e387872ae859ad023983c8e";
  version = "git-" + builtins.substring 0 7 rev;
  src = fetchFromGitHub {
    owner = "michaelgale";
    repo = pname;
    inherit rev;
    sha256 = "sha256-cWJD7+fZ5QzbsmO3Zj/gYhy15z21JG/vV3nETsgVeC4=";
    fetchSubmodules = true;
  };

  propagatedBuildInputs = [ cadquery ];

  checkInputs = [ pytestCheckHook ];

  preCheck = ''
    pushd .
    cd tests
  '';

  postCheck = ''
    popd
  '';

}
