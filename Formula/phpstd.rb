require 'formula'
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/phar-requirement", __FILE__)

class Phpstd < Formula
  homepage 'https://github.com/etcinit/php-coding-standard'
  url 'https://github.com/etcinit/php-coding-standard/releases/download/v0.1.8/phpstd.phar'
  sha256 '4bafea623467f233fd562c662824d5ea7d5915cfe5e289b998f61523f504e1fd'
  version 'v0.1.8'

  depends_on PhpMetaRequirement
  depends_on PharRequirement

  def install
    libexec.install "phpstd.phar"
    sh = libexec + "phpstd"
    sh.write("#!/bin/sh\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/phpstd.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  test do
    system 'phpstd --version'
  end
end
