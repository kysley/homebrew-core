class Handbrake < Formula
  desc "Open-source video transcoder available for Linux, Mac, and Windows."
  homepage "https://handbrake.fr/"
  url "https://handbrake.fr/rotation.php?file=HandBrake-1.0.0.tar.bz2"
  sha256 "15fb4593c70d75621212e4499f018c3c93d7ce39f1083bf527d4616ded0044c5"
  head "https://github.com/HandBrake/HandBrake.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "yasm" => :build

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-xcode",
                          "--disable-gtk"
    system "make", "-C", "build"
    system "make", "-C", "build", "install"
  end

  test do
    system bin/"HandBrakeCLI", "--help"
  end
end
