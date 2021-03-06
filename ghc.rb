require 'formula'

class Ghc < Formula
  homepage 'http://haskell.org/ghc/'

  env :std

  if Hardware.is_64_bit?
    url 'http://www.haskell.org/ghc/dist/7.4.2/ghc-7.4.2-x86_64-unknown-linux.tar.bz2'
    sha1 '4bce5e19263b0ed4257970951280697a04d5404b'
  else
   url 'http://www.haskell.org/ghc/dist/7.4.2/ghc-7.4.2-i386-unknown-linux.tar.bz2'
   sha1 '3017300670273637fe17af3394bd00e9bfc2d38e'
  end

  def install
    args = ["--prefix=#{prefix}"]

    system "./configure", *args

    system "make install"
  end

  def caveats; <<-EOS.undent
    This brew is for GHC only; you might also be interested in haskell-platform.
    EOS
  end
end
