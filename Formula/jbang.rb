class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.139.3"
  url "https://github.com/jbangdev/jbang/releases/download/v0.139.3/jbang-0.139.3.zip"
  sha256 "6ff8d2f387583a8b1b1eb7839826a5e0a227c7cf1550e3bd85e0beb4838ca3ef"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "init", "-t", "cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
