class Nexii < Formula
  homepage "https://github.com/etcinit/nexii"
  url "https://github.com/etcinit/nexii/archive/0.1.3.tar.gz"
  version "0.1.3"
  sha256 "4336f140fb92fccf675e937728cd7e1430a5e3e1f968a6339f253128dfe98dc8"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go " "get -d"
    system "go " "build -o nexii"
    bin.install "nexii"
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
    system "#{bin}/nexii " "--version"
  end
end
