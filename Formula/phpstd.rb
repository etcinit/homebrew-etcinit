require 'formula'
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/phar-requirement", __FILE__)

class Phpstd < Formula
  homepage 'https://github.com/etcinit/php-coding-standard'
  url 'https://github.com/etcinit/php-coding-standard/releases/download/v0.1.9/phpstd.phar'
  sha256 '153fce64267352bf7760b776a61c64fbc546b2266b142ba03888730175913290'
  version 'v0.1.9'

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
