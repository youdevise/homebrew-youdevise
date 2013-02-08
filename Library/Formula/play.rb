require 'formula'

# Modified to download youdevise fork
class Play < Formula
  homepage 'http://www.playframework.org/'
  url 'https://github.com/downloads/youdevise/Play20/play-2.0.5-YD1.zip'
  sha1 '74c24f1c44f4394385b4735cff50beda30e304ef'

  head 'https://github.com/youdevise/Play20.git'

  def install
    rm Dir['*.bat'] # remove windows' bat files
    libexec.install Dir['*']
    inreplace libexec+"play" do |s|
      s.gsub! "$dir/", "$dir/../libexec/"
      s.gsub! "dir=`dirname $PRG`", "dir=`dirname $0` && dir=$dir/`dirname $PRG`"
    end
    bin.install_symlink libexec+'play'
  end
end
