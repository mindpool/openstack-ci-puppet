class mediawiki::image_scaler {
  package { ["imagemagick", "ghostscript", "ffmpeg", "ffmpeg2theora", "librsvg2-bin", "djvulibre-bin", "netpbm", "libogg0", "libvorbisenc2", "libtheora0", "oggvideotools", "libvips15", "libvips-tools"]:
    ensure => present;
  }
  package { [ "gsfonts", "texlive-fonts-recommended", "ttf-alee", "ttf-arabeyes", "ttf-arphic-ukai", "ttf-arphic-uming", "ttf-bengali-fonts", "ttf-devanagari-fonts", "ttf-farsiweb", "ttf-gujarati-fonts", "ttf-kacst", "ttf-kannada-fonts", "ttf-khmeros", "ttf-lao", "ttf-liberation", "ttf-linux-libertine", "ttf-malayalam-fonts", "ttf-manchufont", "ttf-mgopen", "ttf-nafees", "ttf-oriya-fonts", "ttf-punjabi-fonts", "ttf-sil-abyssinica", "ttf-sil-ezra", "ttf-sil-padauk", "ttf-sil-scheherazade", "ttf-sil-yi", "ttf-takao-gothic", "ttf-takao-mincho", "ttf-tamil-fonts", "ttf-thai-tlwg", "ttf-tmuni", "ttf-ubuntu-font-family", "ttf-unfonts-extra", "ttf-wqy-zenhei", "xfonts-100dpi", "xfonts-75dpi", "xfonts-base", "xfonts-mplus", "xfonts-scalable"]:
    ensure => present;
  }
  cron { "removetmpfiles":
    command => "for dir in /tmp; do find \$dir -ignore_readdir_race -type f \\( -name 'gs_*' -o -name 'magick-*' \\) -cmin +15 -exec rm -f {} \\;; done",
    user => root,
    minute => '*/5',
    ensure => present
  }
}
