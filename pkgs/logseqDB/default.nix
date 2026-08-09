{ pkgs, ... }:
let
  version = "2.0.1";
  pname = "logseqDB";

  src = pkgs.fetchurl {
    url = "https://github.com/logseq/logseq/releases/download/${version}/Logseq-linux-x86_64-${version}.AppImage";
    hash = "sha256-Sd42cHizdnD+vbmH5WK3Xe4eGulsKL+4c4d5xCKX3Qw=";
  };

  appimageContents = pkgs.appimageTools.extractType1 { inherit pname src; };
in 
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    meta = {
      description = "A privacy-first, open-source platform for knowledge management and collaboration";
      homepage = "https://github.com/logseq/logseq";
      downloadPage = "https://github.com/logseq/logseq/releases";
      license = pkgs.lib.licenses.agpl3Only;
      sourceProvenance = with pkgs.lib.sourceTypes; [ binaryNativeCode ];
      platform = [ "x86_64-linux" ];
    };
  }

