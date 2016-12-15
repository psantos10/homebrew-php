require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Ioncubeloader < AbstractPhp71Extension
  init
  desc "Loader for ionCube Secured Files"
  homepage "http://www.ioncube.com/loaders.php"
  if MacOS.prefer_64_bit?
    url "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz"
    sha256 "41d4d6cd0fb7bac8129a9a4e1e0710852dd5b899de03739960f191af2afc3fc9"
  else
    url "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86.tar.gz"
    sha256 "1abba772695aa811ff99205e938afadbc40577f0de60a9ac5ce39cb92d88d9ad"
  end
  version "6.0.7"

  bottle do
    cellar :any_skip_relocation
    sha256 "f85714ecd0c1e3f0b4dec8847b526a15dd58259ad17393a3fa792c8722f202b4" => :sierra
    sha256 "f85714ecd0c1e3f0b4dec8847b526a15dd58259ad17393a3fa792c8722f202b4" => :el_capitan
    sha256 "6ad778b4ea3a4def049f1000ed612c9c01ab05b8505117b012f62725493997a2" => :yosemite
  end

  def extension_type
    "zend_extension"
  end

  def install
    prefix.install "ioncube_loader_dar_7.1.so" => "ioncubeloader.so"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("ionCube")
  end
end
