class Sauron < Formula
  homepage "https://github.com/etcinit/sauron"
  url "https://github.com/etcinit/sauron/archive/0.0.3.tar.gz"
  version "0.0.3"
  sha256 "b3c0cd8fe6f9088b43d099fcda8049adbae64a6a2e3d63eb7cd21b3c1eb8707e"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go " "get -d"
    system "go " "build -o sauron"
    bin.install "sauron"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test nexii`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/sauron " "--version"
  end
end
