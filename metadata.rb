maintainer 'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license 'Apache 2.0'
description 'installs/configures dop_php'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name 'php'
version '1.1.1'

%w(debian ubuntu).each do |os|
  supports os
end

%w(
  apt
  git
  php
  build-essential
  dotdeb
  composer
  redisio
).each do |ressource|
  depends ressource
end
