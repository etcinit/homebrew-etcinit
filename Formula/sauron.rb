class Sauron < Formula
  homepage "https://github.com/etcinit/sauron"
  url "https://github.com/etcinit/sauron/archive/0.0.2.tar.gz"
  version "0.0.2"
  sha256 "88516f495de7f55780400f25b37874ff1d1cbd63ca959408c7e18a9b2207c5d1"

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
