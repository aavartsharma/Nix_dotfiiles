{ lib, appimageTools, fetchurl }:
let
  version = "2.0.1";
  pname = "logseqDB";

  src = fetchurl {
    url = "https://github.com/logseq/logseq/releases/download/${version}/Logseq-linux-x86_64-${version}.AppImage";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  appimageContents = appimageTools.extractType1 { inherit name src; }
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  meta = {
    description = "A privacy-first, open-source platform for knowledge management and collaboration";
    homepage = "https://github.com/logseq/logseq";
    downloadPage = "https://github.com/logseq/logseq/releases";
    license =lib.license.agpl3Only;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platform = [ "x86_64-linux" ];
  }
}
